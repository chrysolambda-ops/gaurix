(define-module (gaurix packages llama-cpp-cuda)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cmake)
  #:use-module (guix gexp)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages pkg-config))

;; NOTE: Guix package variable names are Scheme identifiers, so we expose the
;; package as 'llama-cpp-cuda' while keeping the package name string exactly
;; "llama.cpp-cuda" to match AUR naming.
(define-public llama-cpp-cuda
  (package
    (inherit llama-cpp)
    (name "llama.cpp-cuda")
    ;; Authoritative version/source/hash values follow AUR PKGBUILD from:
    ;; https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=llama.cpp-cuda
    ;; pkgver=b7376
    (version "b7376")
    (source
     (origin
       (method url-fetch)
       ;; AUR source:
       ;; "${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
       (uri (string-append
             "https://github.com/ggml-org/llama.cpp/archive/refs/tags/"
             version ".tar.gz"))
       ;; AUR sha256 (hex):
       ;; 66b400cafd0742e1d1bf47617f9c8eacd7ef1dbab0c07ca0badbaec962c2429d
       ;; Converted to Guix nix-base32 for (sha256 (base32 ...)).
       (sha256
        (base32 "17a2q9ickbnvpah7rh5hp8fyzmxcisf7yqa7pz8y2hh7zp501d36"))))
    (arguments
     (list
      #:configure-flags
      #~(list (string-append "-DGGML_BUILD_NUMBER=" #$version)
              "-DBUILD_SHARED_LIBS=ON"
              "-DLLAMA_CURL=ON"
              "-DGGML_BLAS=ON"
              "-DGGML_BLAS_VENDOR=OpenBLAS"
              (string-append "-DBLAS_INCLUDE_DIRS="
                             #$(this-package-input "openblas")
                             "/include")
              (string-append "-DBLAS_LIBRARIES="
                             #$(this-package-input "openblas")
                             "/lib/libopenblas.so")
              ;; CUDA-enabled variant (AUR: -DGGML_CUDA=ON)
              "-DGGML_CUDA=ON"
              "-DGGML_RPC=ON"
              "-DGGML_BUILD_SERVER=ON"
              ;; Keep Guix reproducibility defaults rather than native tuning.
              "-DGGML_NATIVE=OFF"
              "-DGGML_FMA=OFF"
              "-DGGML_AVX2=OFF"
              "-DGGML_AVX512=OFF"
              "-DGGML_AVX512_VBMI=OFF"
              "-DGGML_AVX512_VNNI=OFF")
      #:tests? #f))
    ;; Keep same base inputs as Guix llama-cpp; CUDA toolkit dependency may be
    ;; provided by additional channels/user environment.
    (native-inputs
     (modify-inputs (package-native-inputs llama-cpp)
       (prepend bash-minimal pkg-config)))
    (synopsis "Port of Facebook's LLaMA model in C/C++ (CUDA-enabled)")))
