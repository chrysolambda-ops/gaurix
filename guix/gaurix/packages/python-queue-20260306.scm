(define-module (gaurix packages python-queue-20260306)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system pyproject)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages python-build)
  #:export (python-steam
            python-argdispatch
            python-dataclasses-json
            python-survey
            python-pyro5
            python-desktop-notifier
            python-unoserver
            python-smooth
            python-niripy
            python-meteostat
            python-ci-info
            python-primp
            python-duckduckgo-search
            python-hwdata
            python-markitdown
            python-python-ffmpeg
            python-lsp-tree-sitter
            python-torrequest
            python-pyamdgpuinfo
            python-diagrams))

(define-public python-steam
  (package
    (name "python-steam")
    (version "1.4.4")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/9a/31/62ac25584988182dee5ee949395e08943ff8b11634dc33abab7078d28433/steam-1.4.4.tar.gz")
        (sha256
         (base32 "0asvss8iq3aafc9g8hdqs5ibkn6lgj5ypf7gqv48cwwkn0r3z99f"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/ValvePython/steam")
    (synopsis "Module for interacting with various Steam features")
    (description "Python package steam.")
    (license license:expat)))

(define-public python-argdispatch
  (package
    (name "python-argdispatch")
    (version "1.5.0")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/08/1e/d948ac727362bbc67f3a57651941d355d1177b7310eada759365f98d3fbc/argdispatch-1.5.0.tar.gz")
        (sha256
         (base32 "13bsvg2iavw9j9ry5a1fcn5lkh8fg1xhrrf2zqswghzlkm8ahnm9"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "http://framagit.org/spalax/argdispatch")
    (synopsis "A drop-in replacement for `argparse` dispatching subcommand calls to functions, modules or")
    (description "Python package argdispatch.")
    (license license:expat)))

(define-public python-dataclasses-json
  (package
    (name "python-dataclasses-json")
    (version "0.6.7")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/64/a4/f71d9cf3a5ac257c993b5ca3f93df5f7fb395c725e7f1e6479d2514173c3/dataclasses_json-0.6.7.tar.gz")
        (sha256
         (base32 "1dmkwll2cvm4bfaka8ivqlyacigm42437hlj57l4gczjd8fcapy0"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/lidatong/dataclasses-json")
    (synopsis "Easily serialize dataclasses to and from JSON.")
    (description "Python package dataclasses-json.")
    (license license:expat)))

(define-public python-survey
  (package
    (name "python-survey")
    (version "5.4.2")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/72/72/bb870980cf2785eb7b4421a7ad2489e4138e5a6d091c06e30589755e8fc2/survey-5.4.2.tar.gz")
        (sha256
         (base32 "1qprwfsjdw6v5zlgkx4n1rgw5a9i3695s8shn672si2xcx06japn"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/Exahilosys/survey")
    (synopsis "A simple library for creating beautiful interactive prompts.")
    (description "Python package survey.")
    (license license:expat)))

(define-public python-pyro5
  (package
    (name "python-pyro5")
    (version "5.16")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/6e/ab/38d7adb02f735f409e6af78951630f887590a885b2583c83cfe93a60b576/pyro5-5.16.tar.gz")
        (sha256
         (base32 "1m0433njmkp0v44kvbsh4gnhn35lhnkbc8s2jd5dp7l035bgawwb"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/irmen/Pyro5")
    (synopsis "Remote object communication library, fifth major version")
    (description "Python package Pyro5.")
    (license license:expat)))

(define-public python-desktop-notifier
  (package
    (name "python-desktop-notifier")
    (version "6.2.0")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/41/df/67c6ff92d870881b5a6e073773a209eeb2e263a15cd112ddddff5c14abe8/desktop_notifier-6.2.0.tar.gz")
        (sha256
         (base32 "0ll1cyv93kj00cgsjbv7r7s55dxy5626c4z1kl8yq329rd945lrq"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/desktop-notifier/")
    (synopsis "Python library for cross-platform desktop notifications")
    (description "Python package desktop-notifier.")
    (license license:expat)))

(define-public python-unoserver
  (package
    (name "python-unoserver")
    (version "3.6")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/6f/87/1301e71a6cbf920d51f10ab3b1b068701d6f979c4ee5f831bfcdad7b7d95/unoserver-3.6.tar.gz")
        (sha256
         (base32 "1r26pjrn732ii07h0amfxjmirxsdzafzh41my0kzgzrf10dnsw0m"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/unoserver/")
    (synopsis "A server for file conversions with Libre Office")
    (description "Python package unoserver.")
    (license license:expat)))

(define-public python-smooth
  (package
    (name "python-smooth")
    (version "0.0.1")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/eb/ed/90de4530a1432983fddef8bfceaf53279325927a46464961bba50d9a49de/smooth-0.0.1.tar.gz")
        (sha256
         (base32 "1k9pqi8czbdd9yrqrk27cg341xdbn515s2vyvlzxf71805fyrbrn"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/canonical/operator")
    (synopsis "smooth")
    (description "Python package smooth.")
    (license license:expat)))

(define-public python-niripy
  (package
    (name "python-niripy")
    (version "0.2.7")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/c7/87/04528464643a03011907b13fb8ee922b1e599c0687f76216a6763803e8d1/niripy-0.2.7.tar.gz")
        (sha256
         (base32 "0q5n31zqdrishw4868sv8rw3hgzx45h16ypn8gl43di284ailsn0"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/niripy/")
    (synopsis "Python bindings for Niri.")
    (description "Python package niripy.")
    (license license:expat)))

(define-public python-meteostat
  (package
    (name "python-meteostat")
    (version "2.1.3")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/a6/a2/6f15fd78b7306521705f164a9e65e92672bc8e3259056b34bb608b8bb139/meteostat-2.1.3.tar.gz")
        (sha256
         (base32 "0rd76jswiykyl8fn130b10wzjxqqygns7acjj16a4khi94fr2fqx"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/meteostat/")
    (synopsis "Access and analyze historical weather and climate data with Python.")
    (description "Python package meteostat.")
    (license license:expat)))

(define-public python-ci-info
  (package
    (name "python-ci-info")
    (version "0.4.0")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/f1/05/7880d5714b2e1c4c2f2ccbd04b2e2bdcd3753d91d5e925b3a91af25970db/ci_info-0.4.0.tar.gz")
        (sha256
         (base32 "0d6ml63jdcvq1ayzk1939f3imhri4kb4vn72jj3hp365nh8c310q"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/ci-info/")
    (synopsis "Continuous Integration Information")
    (description "Python package ci-info.")
    (license license:expat)))

(define-public python-primp
  (package
    (name "python-primp")
    (version "1.1.2")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/03/35/80be154508529f753fb82cb81298bdeb33e90f39f9901d7cfa0f488a581f/primp-1.1.2.tar.gz")
        (sha256
         (base32 "1i3hgarp99vw1jzasgcscmh5j6gs96bzm48fy1p3gdjxyhm1sk84"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/primp/")
    (synopsis "HTTP client that can impersonate web browsers")
    (description "Python package primp.")
    (license license:expat)))

(define-public python-duckduckgo-search
  (package
    (name "python-duckduckgo-search")
    (version "8.1.1")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/10/ef/07791a05751e6cc9de1dd49fb12730259ee109b18e6d097e25e6c32d5617/duckduckgo_search-8.1.1.tar.gz")
        (sha256
         (base32 "17d93jgb4shpw0bfl7d2c8sx8104nimhargahvbmm7vqrja43y9m"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/duckduckgo-search/")
    (synopsis "Search for words, documents, images, news, maps and text translation using the DuckDuckGo.")
    (description "Python package duckduckgo-search.")
    (license license:expat)))

(define-public python-hwdata
  (package
    (name "python-hwdata")
    (version "2.4.1")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/ff/ec/4a6e57d765a63f7e9a8c5348f0bf3f7d39243dc5bc695fa1e887ca5856c8/hwdata-2.4.1.tar.gz")
        (sha256
         (base32 "16xdh0ipr0fc14b1a5wxcrd3xw917b6a9jm3g3zh6z41yd2kikg9"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/xsuchy/python-hwdata")
    (synopsis "Interface to hwdata")
    (description "Python package hwdata.")
    (license license:expat)))

(define-public python-markitdown
  (package
    (name "python-markitdown")
    (version "0.1.5")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/83/93/3b93c291c99d09f64f7535ba74c1c6a3507cf49cffd38983a55de6f834b6/markitdown-0.1.5.tar.gz")
        (sha256
         (base32 "0k4mdzqm52zibqc18m106pn9dsc941niklqipdwrykgrfgnazhqs"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/markitdown/")
    (synopsis "Utility tool for converting various files to Markdown")
    (description "Python package markitdown.")
    (license license:expat)))

(define-public python-python-ffmpeg
  (package
    (name "python-python-ffmpeg")
    (version "2.0.12")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/dd/4d/7ecffb341d646e016be76e36f5a42cb32f409c9ca21a57b68f067fad3fc7/python_ffmpeg-2.0.12.tar.gz")
        (sha256
         (base32 "06dch2pml1ja5x9w4idg3a89nbbn93m08m80v5nkpkahgf4d8gf7"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/jonghwanhyeon/python-ffmpeg")
    (synopsis "A python binding for FFmpeg which provides sync and async APIs")
    (description "Python package python-ffmpeg.")
    (license license:expat)))

(define-public python-lsp-tree-sitter
  (package
    (name "python-lsp-tree-sitter")
    (version "0.1.1")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/04/38/b539693b8222ceae26ef532f229d9ca57f294ed4dcb64dc771e082eec9a7/lsp_tree_sitter-0.1.1.tar.gz")
        (sha256
         (base32 "05k8vm2nwmk9x7bf20mjvm39abykklcmfg0rp34qai3f4wnmj4lc"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://pypi.org/project/lsp-tree-sitter/")
    (synopsis "a library to create language servers")
    (description "Python package lsp-tree-sitter.")
    (license license:expat)))

(define-public python-torrequest
  (package
    (name "python-torrequest")
    (version "0.1.0")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/a3/d2/00538e47a2c80979231313c346a0abc3927c7b230d69eb923bb5b221ec62/torrequest-0.1.0.tar.gz")
        (sha256
         (base32 "0ds5skm3zzd9imx06hv3qy3svcvsmdvvvas01554v4vkjb6lvbl2"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "http://github.com/erdiaker/torrequest")
    (synopsis "A simple interface for HTTP(s) requests over Tor")
    (description "Python package torrequest.")
    (license license:expat)))

(define-public python-pyamdgpuinfo
  (package
    (name "python-pyamdgpuinfo")
    (version "2.1.7")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/80/15/2ff925c0776c7a2aaab3d03b0e477d1a24b0637600b7e2e928cbcc25034f/pyamdgpuinfo-2.1.7.tar.gz")
        (sha256
         (base32 "15dlymhqqckiz5gdxy711pdgi6hkl38yvfq3pp85v3sajc5a29dh"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://github.com/mark9064/pyamdgpuinfo")
    (synopsis "AMD GPU stats")
    (description "Python package pyamdgpuinfo.")
    (license license:expat)))

(define-public python-diagrams
  (package
    (name "python-diagrams")
    (version "0.25.1")
    (source
      (origin
        (method url-fetch)
        (uri "https://files.pythonhosted.org/packages/49/91/af38c647ba20a7b74c23ebb0b56e000f5f8fe80fefb21251e1d0445ac5b5/diagrams-0.25.1.tar.gz")
        (sha256
         (base32 "11s81fhb5lk9hyk9yzam7ahcn77by506mp03zvvh66yzzw16pz2i"))))
    (build-system pyproject-build-system)
    (native-inputs (list python-setuptools python-wheel))
    (arguments (list #:tests? #f))
    (home-page "https://diagrams.mingrammer.com")
    (synopsis "Diagram as Code")
    (description "Python package diagrams.")
    (license license:expat)))

