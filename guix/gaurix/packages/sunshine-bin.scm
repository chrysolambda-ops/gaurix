(define-module (gaurix packages sunshine-bin)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages base)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages upnp)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xorg))

(define-public sunshine-bin
  (package
    (name "sunshine-bin")
    (version "2025.924.154138")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/LizardByte/Sunshine/releases/download/v"
             version "/sunshine.pkg.tar.zst"))
       (sha256
        (base32 "0g4wzpdcm0p7slf4ih4ly6skslcb2nsys0pihrn39yz6zlgy0yrd"))))
    (build-system trivial-build-system)
    (native-inputs (list tar zstd))
    (inputs
     (list avahi
           curl
           libappindicator
           libcap
           libdrm
           libevdev
           miniupnpc
           libnotify
           pulseaudio
           libva
           libx11
           libxcb
           libxfixes
           libxrandr
           libxtst
           numactl
           openssl
           opus
           eudev
           which))
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (tar (search-input-file %build-inputs "/bin/tar"))
                 (zstd (search-input-file %build-inputs "/bin/zstd"))
                 (bin (string-append out "/bin"))
                 (usr (string-append out "/usr")))
            (mkdir-p usr)
            (invoke tar (string-append "--use-compress-program=" zstd) "-xf" src)
            (copy-recursively "usr/lib" (string-append usr "/lib"))
            (copy-recursively "usr/share" (string-append usr "/share"))
            (mkdir-p bin)
            (copy-file (string-append "usr/bin/sunshine-" #$version)
                       (string-append bin "/sunshine"))
            (chmod (string-append bin "/sunshine") #o755)
            #t))))
    (home-page "https://app.lizardbyte.dev/Sunshine")
    (synopsis "Self-hosted game stream host for Moonlight (binary)")
    (description "Binary package of Sunshine, a game streaming host for Moonlight clients.")
    (license license:gpl3)))
