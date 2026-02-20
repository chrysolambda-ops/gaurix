(define-module (gaurix packages localsend-bin)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression))

(define-public localsend-bin
  (package
    (name "localsend-bin")
    (version "1.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/localsend/localsend/releases/download/v"
             version "/LocalSend-" version "-linux-x86-64.deb"))
       (sha256
        (base32 "0k505wi0qqvblcnpimhhrrxb6sh3sqs2armjc4fsicmc7qn4n95h"))))
    (build-system trivial-build-system)
    (native-inputs (list binutils tar xz))
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw)
                  (srfi srfi-1))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw)
                       (srfi srfi-1))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (ar (search-input-file %build-inputs "/bin/ar"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (xz (search-input-file %build-inputs "/bin/xz"))
                 (cwd (getcwd))
                 (usr (string-append cwd "/usr"))
                 (desktop-src (string-append usr "/share/applications/localsend_app.desktop"))
                 (desktop-out (string-append out "/share/applications/localsend.desktop"))
                 (icons-out (string-append out "/share/icons"))
                 (opt-out (string-append out "/opt/localsend"))
                 (bin-out (string-append out "/bin")))
            (invoke ar "x" src)
            (invoke tar (string-append "--use-compress-program=" xz) "-xf" "data.tar.xz")

            (mkdir-p (dirname desktop-out))
            (copy-file desktop-src desktop-out)
            (substitute* desktop-out
              (("Exec=localsend_app") "Exec=localsend")
              (("^Icon=.+") "Icon=localsend"))

            (copy-recursively (string-append usr "/share/icons") icons-out)
            (for-each
             (lambda (res)
               (let ((old (string-append icons-out "/hicolor/" res "/apps/localsend_app.png"))
                     (new (string-append icons-out "/hicolor/" res "/apps/localsend.png")))
                 (when (file-exists? old)
                   (rename-file old new))))
             '("128x128" "256x256"))

            (mkdir-p opt-out)
            (copy-recursively (string-append usr "/share/localsend_app") opt-out)
            (let ((old (string-append opt-out "/localsend_app"))
                  (new (string-append opt-out "/localsend")))
              (when (file-exists? old)
                (rename-file old new)
                (chmod new #o755)))

            (mkdir-p bin-out)
            (symlink (string-append out "/opt/localsend/localsend")
                     (string-append bin-out "/localsend"))
            #t))))
    (synopsis "Cross-platform local file sharing app (prebuilt binary)")
    (description
     "LocalSend is an open-source cross-platform alternative to AirDrop for local network file sharing. This package repackages the upstream x86_64 Linux binary release.")
    (home-page "https://github.com/localsend/localsend")
    (license license:expat)))
