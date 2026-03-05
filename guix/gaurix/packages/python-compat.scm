(define-module (gaurix packages python-compat)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:export (python-pdm-pep517
            python-argparse-from-file
            python-ewmh
            python-transmission-rpc
            python-proton-client))

(define-public python-pdm-pep517
  (package
    (name "python-pdm-pep517")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "pdm-pep517" version))
       (sha256
        (base32 "0gygn8ricrmd6wqngiazawwpm81dvl8255mcdwlwlbdlf0g14jbz"))))
    (build-system pyproject-build-system)
    (home-page "https://pypi.org/project/pdm-pep517/")
    (synopsis "PEP 517 backend for PDM with PEP 621 metadata support")
    (description
     "This package provides a PEP 517 backend for PDM with support for PEP 621 metadata.")
    (license license:expat)))

(define-public python-argparse-from-file
  (package
    (name "python-argparse-from-file")
    (version "1.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/bulletmark/argparse-from-file")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12q6pp6x6pk7ckz129a06afpk4i50fmydl4siq7k9484dw8r34gl"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-platformdirs))
    (native-inputs (list python-setuptools python-setuptools-scm python-wheel))
    (home-page "https://github.com/bulletmark/argparse-from-file")
    (synopsis "Read argparse options from files")
    (description
     "This package extends Python's argparse module so command-line arguments can be read from files.")
    (license license:expat)))

(define-public python-ewmh
  (package
    (name "python-ewmh")
    (version "0.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/parkouss/pyewmh")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hydpyqr5v1qd05aafhahfhpdl0gybfrs5knrgs5pslhygy80qyq"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-xlib))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/parkouss/pyewmh")
    (synopsis "Python implementation of EWMH")
    (description
     "This package provides a Python implementation of the Extended Window Manager Hints based on Xlib.")
    (license license:isc)))

(define-public python-transmission-rpc
  (package
    (name "python-transmission-rpc")
    (version "7.0.11")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Trim21/transmission-rpc")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14np1kyxw3l4fzlkn7r35wc1ya1j1sgg7fqzb9pvqzf7nawd6kmp"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-requests python-typing-extensions))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/Trim21/transmission-rpc")
    (synopsis "Python client for Transmission RPC")
    (description
     "This package provides a Python module that implements the Transmission BitTorrent client's JSON-RPC protocol.")
    (license license:expat)))

(define-public python-proton-client
  (package
    (name "python-proton-client")
    (version "0.5.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/ProtonMail/proton-python-client")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1wm73c9dr5cmw7gm8w36byvaqvhzb6ybvb4g4kx9j1l39h28zdpz"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-bcrypt python-pyopenssl python-gnupg
                             python-requests))
    (native-inputs (list python-setuptools python-wheel))
    (home-page "https://github.com/ProtonMail/proton-python-client")
    (synopsis "Proton API wrapper")
    (description "This package provides a Python wrapper for Proton APIs.")
    (license license:expat)))
