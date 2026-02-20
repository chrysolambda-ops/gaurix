(define-module (gaurix packages hello-gaurix)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix gexp))

(define-public hello-gaurix
  (package
    (name "hello-gaurix")
    (version "0.1.0")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     (list #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((out (assoc-ref %outputs "out"))
                      (bin (string-append out "/bin"))
                      (prog (string-append bin "/hello-gaurix")))
                 (mkdir-p bin)
                 (call-with-output-file prog
                   (lambda (p)
                     (display "#!/bin/sh\necho 'hello from gaurix channel'\n" p)))
                 (chmod prog #o755)))))
    (synopsis "Tiny starter package for the Gaurix channel")
    (description "A tiny package used to validate the Gaurix channel scaffold.")
    (home-page "https://gitlab.com/chrysolambda-group/gaurix")
    (license license:expat)))
