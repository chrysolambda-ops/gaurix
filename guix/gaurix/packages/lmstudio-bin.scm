(define-module (gaurix packages lmstudio-bin)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

(define aur-revision "ac2cdc8990626c91d53dbc9f9edb5b72249aa8a2")

(define-public lmstudio-bin
  (package
    (name "lmstudio-bin")
    ;; Authoritative version, source URL, and checksums follow AUR lmstudio-bin.
    (version "0.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://installers.lmstudio.ai/linux/x64/"
             version "-2/LM-Studio-" version "-2-x64.AppImage"))
       (sha256
        (base32 "0iwspxvfm5cvlbbxli701m6wka2nvhz99l6pgrr0w8l7mrmiqi4i"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (appimage (assoc-ref %build-inputs "source"))
                 (assets (assoc-ref %build-inputs "aur-assets"))
                 (opt-dir (string-append out "/opt/lm-studio"))
                 (bin-dir (string-append out "/bin"))
                 (apps-dir (string-append out "/share/applications"))
                 (icons-dir (string-append out "/share/icons/hicolor/512x512/apps"))
                 (pixmaps-dir (string-append out "/share/pixmaps")))
            (mkdir-p opt-dir)
            (install-file appimage opt-dir)
            (rename-file (string-append opt-dir "/" (basename appimage))
                         (string-append opt-dir "/lm-studio.AppImage"))
            (chmod (string-append opt-dir "/lm-studio.AppImage") #o755)

            (mkdir-p bin-dir)
            (symlink (string-append opt-dir "/lm-studio.AppImage")
                     (string-append bin-dir "/lm-studio"))

            (mkdir-p apps-dir)
            (copy-file (string-append assets "/lmstudio.desktop")
                       (string-append apps-dir "/lmstudio.desktop"))

            (mkdir-p icons-dir)
            (copy-file (string-append assets "/lmstudio.png")
                       (string-append icons-dir "/lmstudio-bin.png"))

            (mkdir-p pixmaps-dir)
            (copy-file (string-append assets "/lmstudio.png")
                       (string-append pixmaps-dir "/lmstudio-bin.png"))
            #t))))
    (native-inputs
     (list (list "aur-assets"
                 (origin
                   (method git-fetch)
                   (uri (git-reference
                         (url "https://aur.archlinux.org/lmstudio-bin.git")
                         (commit aur-revision)))
                   (file-name (git-file-name name version))
                   (sha256
                    (base32 "16asbazvadwdfik982jsr5iw7qmm32df3afs2xpyhli9wcgfvzyv"))))))
    (home-page "https://lmstudio.ai")
    (synopsis "Desktop app for running local large language models")
    (description
     "LM Studio is a desktop application for discovering, downloading, and
running large language models locally.  This package repackages the upstream
pre-built AppImage distributed by LM Studio.")
    (license #f)))
