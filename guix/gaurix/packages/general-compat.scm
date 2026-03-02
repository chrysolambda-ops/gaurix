(define-module (gaurix packages general-compat)
  #:use-module (guix packages)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages python)
  #:use-module ((gnu packages tls) #:prefix gnu:)
  #:export (gtk2 gnu-netcat qt5-webengine python312 openssl-1.1))

(define-public gtk2
  (package
    (inherit gtk+-2)
    (name "gtk2")))

(define-public gnu-netcat
  (package
    (inherit netcat)
    (name "gnu-netcat")))

(define-public qt5-webengine
  (package
    (inherit qtwebengine-5)
    (name "qt5-webengine")))

(define-public python312
  (package
    (inherit python-3.12)
    (name "python312")))

(define-public openssl-1.1
  (package
    (inherit gnu:openssl-1.1)
    (name "openssl-1.1")))
