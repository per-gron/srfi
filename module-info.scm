;;;  --------------------------------------------------------------  ;;;
;;;                                                                  ;;;
;;;                     Module info data structure                   ;;;
;;;                                                                  ;;;
;;;  --------------------------------------------------------------  ;;;

;; Previous definition: (TODO remove this)
;;  
;; (define-type module-info
;;   id: 726DB40B-AB18-4396-A570-BB715B602DB9
;;  
;;   (symbols read-only:)
;;   (exports read-only:)
;;   (imports read-only:)
;;   (uses read-only:)
;;  
;;   (options read-only:)
;;   (cc-options read-only:)
;;   (ld-options-prelude read-only:)
;;   (ld-options read-only:)
;;   (force-compile? read-only:)
;;  
;;   (environment read-only:))

(define-type module-info
  id: 726DB40B-AB18-4396-A570-BB715B602DB9
  constructor: make-module-info/internal

  (symbols read-only:)
  (exports read-only:)
  (imports read-only:)
  
  ;; A list of module references, possibly relative
  (runtime-dependencies read-only:)
  ;; A list of module references, possibly relative
  (compiletime-dependencies read-only:)
  
  ;; A list with Gambit compiler options
  (options read-only:)
  ;; A string with options for the C compiler
  (cc-options read-only:)
  ;; A string with options for the linker
  (ld-options-prelude read-only:)
  ;; A string with options for the linker
  (ld-options read-only:)
  ;; A boolean
  (force-compile read-only:)

  (namespace-string read-only:)

  (environment read-only:))

(define (make-module-info #!key
                          (symbols '())
                          (exports '())
                          (imports '())
                          (runtime-dependencies '())
                          (compiletime-dependencies '())
                          (options '())
                          (cc-options "")
                          (ld-options-prelude "")
                          (ld-options "")
                          (force-compile #f)
                          namespace-string
                          environment)
  (make-module-info/internal symbols
                             exports
                             imports
                             runtime-dependencies
                             compiletime-dependencies
                             options
                             cc-options
                             ld-options-prelude
                             ld-options
                             force-compile
                             namespace-string
                             environment))

(define (module-info-dependencies info)
  (append (module-info-runtime-dependencies info)
          (module-info-compiletime-dependencies info)))

(define (module-info-alist->module-info module-info-alist)
  (error "TODO To be implemented"))
