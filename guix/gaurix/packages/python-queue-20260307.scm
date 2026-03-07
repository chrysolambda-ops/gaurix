(define-module (gaurix packages python-queue-20260307)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:export (python-pywalfox
            python-zombie-imp))

(define-public python-google-generativeai
  (package
    (name "python-google-generativeai")
    (version "0.8.5")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/e9/2f/e5b65f1fffaed2f08f084b804a360f58ec7e26bc17db25beaa2ab68d6f60/google_generativeai-0.8.5.tar.gz")
        (sha256
         (base32 "0s1x52cd6v8ybly0pqkyc9h4mbx7y4rldn4j8x0j13r8if8m7g1m"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/google/generative-ai-python")
    (synopsis "Google Generative AI Python SDK")
    (description "Python SDK for Google's Generative AI APIs.")
    (license license:asl2.0)))

(define-public python-pywalfox
  (package
    (name "python-pywalfox")
    (version "2.7.4")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/64/ea/73225802da5e9d9024d25c3f55ffb056ea450c68bf972ad3c4c7072371dc/pywalfox-2.7.4.tar.gz")
        (sha256
         (base32 "0rpdh1k4b37n0gcclr980vz9pw3ihhyy0d0nh3xp959q4xz3vrsr"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/frewacom/pywalfox")
    (synopsis "Native app used alongside the Pywalfox browser extension")
    (description "Native app used alongside the Pywalfox browser extension.")
    (license license:mpl2.0)))

(define-public python-zombie-imp
  (package
    (name "python-zombie-imp")
    (version "0.0.4")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/48/ac/0701001f59a7eee5630b094252ac3019df62110a71aa5282b14a7293ffd3/zombie_imp-0.0.4.tar.gz")
        (sha256
         (base32 "17xk1qs7ir117j4sxy8nsvcbk4kwzxajd0m7iw8zhzfap49i4fn4"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/encukou/zombie-imp")
    (synopsis "Copy of Python imp module removed in Python 3.12")
    (description "Provides a copy of the imp module removed from modern Python versions.")
    (license license:psfl)))
