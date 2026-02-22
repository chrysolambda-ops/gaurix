(define-module (gaurix packages sunshine)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cmake)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp)
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages base)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages node)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages upnp)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg))

;; AUR sunshine PKGBUILD (fetched via scripts/fetch-aur-pkgbuild.sh sunshine)
;; pkgver=2025.924.154138, _commit=86188d47a7463b0f73b35de18a628353adeaa20e
(define %sunshine-commit "86188d47a7463b0f73b35de18a628353adeaa20e")
(define %sunshine-release-tag "v2025.924.154138")

(define-public sunshine
  (package
    (name "sunshine")
    (version "2025.924.154138")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://codeload.github.com/LizardByte/Sunshine/tar.gz/refs/tags/"
             %sunshine-release-tag))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0m0bcr1fzlsyk8frdn3mnp18j9bzgcq0ly8l4bgw0l0zq346i7qh"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list
         "-DBUILD_DOCS=OFF"
         "-DBUILD_TESTS=OFF"
         "-DBUILD_WERROR=OFF"
         "-DSUNSHINE_ENABLE_CUDA=OFF"
         "-DCUDA_FAIL_ON_MISSING=OFF"
         "-DSUNSHINE_COMPILE_OPTIONS=-Wno-uninitialized"
         "-DSUNSHINE_ASSETS_DIR=share/sunshine"
         "-DSUNSHINE_EXECUTABLE_PATH=/bin/sunshine"
         "-DSUNSHINE_PUBLISHER_NAME=LizardByte"
         "-DSUNSHINE_PUBLISHER_WEBSITE=https://app.lizardbyte.dev")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'relax-boost-version
            (lambda _
              (substitute* "cmake/dependencies/Boost_Sunshine.cmake"
                (("1\\.87\\.0") "1.89.0"))))
          (add-before 'configure 'set-build-metadata
            (lambda _
              (setenv "BUILD_VERSION" #$version)
              (setenv "COMMIT" #$%sunshine-commit)
              (setenv "BRANCH" "master"))))))
    (native-inputs
     (list appstream
           cmake
           desktop-file-utils
           node
           pkg-config))
    (inputs
     (list avahi
           boost
           curl
           libappindicator
           libcap
           libdrm
           libevdev
           libnotify
           pulseaudio
           libva
           libx11
           libxcb
           libxfixes
           libxrandr
           libxtst
           miniupnpc
           numactl
           openssl
           opus
           eudev))
    (home-page "https://app.lizardbyte.dev/Sunshine")
    (synopsis "Self-hosted game streaming host for Moonlight")
    (description
     "Sunshine is a self-hosted game stream host compatible with Moonlight clients.")
    (license license:gpl3)))
