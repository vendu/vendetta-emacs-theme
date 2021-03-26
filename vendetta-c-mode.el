;; customizations for [c] programming

(defconst vendetta-c-style
  '((c-basic-offset . 4)
    (c-label-minimum-indentation . +)
    ;;    (c-tab-always-indent . nil)
    ;;    (indent-tabs-mode . nil)
    (c-electric-flag t)
    (c-progress interval 1)
    (c-tab-always-indent . t)
    (c-syntactic-indentation . t)
    (c-syntactic-indentation-in-macros . t)
    (c-echo-syntactic-information-p . t)
    (c-indent-comments-syntactically-p . t)
    (c-strict-syntax-p . nil)
    (c-backslash-column fill-column)
    (c-max-oneliner-length fill-column)
    (c-backslash-column . 72)
    (c-auto-align-backslashes . t)
    (c-electric-pound-behavior . 'alignleft)
    (c-comment-only-line-offset . 0)
    (c-label-minimum-indentation . +)
    (c-hanging-semi&comma-criteria .
                                   (c-semi&comma-no-newlines-before-nonblanks
                                    c-semi&comma-inside-parenlist))
    (c-offsets-alist .
                     ((string . 0)
                      (c . (c-lineup-C-comments 0))
                      ;;                      (comment-intro . (c-lineup-knr-region-comment
                      ;;                                        c-comment-only-line-offset
                      ;;                                        [0]))
                      (comment-intro . (c-lineup-knr-region-comment
                                        c-comment-only-line-offset
                                        [0]))
                      (cpp-macro . [0])
                      (cpp-macro-cont . 0)
                      ;;                      (cpp-macro-cont . (c-lineup-assignments
                      ;;                                         c-lineup-string-cont
                      ;;                                         c-lineup-cascaded-calls
                      ;;                                         c-lineup-math
                      ;;                                         [0]))
                      (cpp-define-intro . (c-lineup-cpp-define +))
                      (defun-block-intro . +)
                      (defun-close . (c-lineup-close-paren))
                      (block-open . 0)
                      (block-close . 0)
                      (topmost-intro . 0)
                      (topmost-intro-cont . 0)
                      (statement . 0)
                      ;;                      (statement .
                      ;;                                 (vendetta-indent-c-label-intro
                      ;;                                  0))
                      (statement-case-open . +)
                      (statement-case-intro . +)
                      ;;                      (statement-case-intro .
                      ;;                                            (vendetta-indent-c-label-intro
                      ;;                                             +))
                      (statement-block-intro . +)
                      ;;                      (statement-block-intro .
                      ;;                                             (vendetta-indent-c-label-intro
                      ;;                                              +))
                      (statement-cont . (c-lineup-assignments
                                         c-lineup-string-cont
                                         c-lineup-cascaded-calls
                                         c-lineup-math
                                         0))
                                        ;                                         +))
                      (substatement . +)
                      (substatement-open . 0)
                      (substatement-label . +)
                      (case-label . +)
                      (label . +)
                      (member-init-intro . ++)
                      (member-init-cont . +)
                      (brace-list-open . 0)
                      (brace-list-intro . +)
                      (brace-list-entry . 0)
                      (brace-list-close . 0)
                      ;;                      (brace-list-close .
                      ;;                                        (c-lineup-arglist-close-under-paren -))
                      (arglist-intro .
                                     (c-lineup-arglist-intro-after-paren +))
                      (arglist-cont .
                                    (c-lineup-gcc-asm-reg
                                     c-lineup-assignments
                                     c-lineup-argcont
                                     c-lineup-string-cont
                                     c-lineup-cascaded-calls
                                     c-lineup-arglist-operators
                                     c-lineup-math
                                     0))
                      (arglist-cont-nonempty .
                                             (c-lineup-gcc-asm-reg
                                              c-lineup-arglist
                                              c-lineup-assignments
                                              c-lineup-string-cont
                                              c-lineup-cascaded-calls
                                              c-lineup-arglist-operators
                                              c-lineup-math
                                              0))
                      (arglist-close . (c-lineup-arglist-close-under-paren 0))
                      (func-decl-cont . (c-lineup-assignments
                                         c-lineup-string-cont
                                         c-lineup-cascaded-calls
                                         c-lineup-math
                                         0))
                      (inclass . +)
                      (knr-argdecl-intro . -)
                      (knr-argdecl . 0)
                      (extern-lang-open . 0)
                      (inextern-lang . 0)
                      (extern-lang-close . 0)))
    (c-hanging-braces-alist .
                            ((defun-open before after)
                             (defun-close before after)
                             (brace-list-open after)
                             (brace-entry-open after)
                             (substatement-open after)
                             (block-close . c-snug-do-while)
                             (extern-lang-open after)))
    (c-hanging-colons-alist .
                            ((label after)
                             (case-label after)
                             (member-init-intro before)))
    (c-cleanup-list .
                    (brace-else-brace
                     brace-elseif-brace
                     list-close-comma
                     empty-defun-braces
                     defun-close-semi
                     comment-close-slash
                     scope-operator
                     one-liner-defun)))
  "Vendetta C Style")
(c-add-style "vendetta" vendetta-c-style)

;; this routine was modified from one donated by stack_pivot on reddit :)
(defun vendetta-indent-c-after-label(symbol-and-anchor)
  (let* ((new-offset '++))))
;; this routine was edited from one donated by stack_pivot on reddit :)
(defun vendetta-indent-c-label-intro(symbol-and-anchor)
  (let* ((new-offset nil)
         (anchor (cdr symbol-and-anchor))
         (anchor-line (line-number-at-pos anchor)))
    (save-excursion
      (goto-char anchor)
      (setq word (current-word))
      (message "word: %s" 'word)
      (if (or (eq word 'case-label)
              (eq word 'label))
          (setq new-offset '++)))
    new-offset))

(defun vendetta-set-c-mode-defaults()
  ;;  (add-hook 'c-special-indent-hook 'delete-trailing-whitespace)
  (set-buffer-file-coding-system 'iso-latin-1-unix t)
  (define-key c-mode-base-map "\C-TAB" 'newline-and-indent)
  (define-key c-mode-base-map [ret] 'newline-and-indent))

(defun vendetta-init-faces()
  ;; c keywords
  ;; (font-lock-add-keywords 'c-mode
  ;;                         '(("\\<\\(float\\)\\>" 0 font-lock-float-type-face t)
  ;;                           ("\\<\\(double\\)\\>" 0 font-lock-float-type-face t)
  ;;                           ("\\<\\(\"long double\"\\)\\>" o font-lock-float-type-face t)
  ;;                           ("\\<\\(\"fenv_t\"\\)\\>" 0 font-lock-float-type-face t)
  ;;                           ("\\<\\(\"fexcept_t\"\\)\\>" 0 font-lock-float-type-face t)))
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\*:\\>" 1 font-lock-label-face)))
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(void\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(signed\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(unsigned\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(char\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(short\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(int\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(\"long long\"\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(long\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(int*_t\\)\\>" 1 font-lock-native-type-face)
                            ("\\<\\(uint*_t\\)\\>" 1 font-lock-native-type-face)
                            ("\\<\\(intptr_t\\)\\>" 1 font-lock-native-type-face)
                            ("\\<\\(uintptr_t\\)\\>" 1 font-lock-native-type-face)
                            ("\\<\\(ptrdiff_t\\)\\>" 1 font-lock-native-type-face)
                            ("\\<\\(*_t\\)\\>" 1 font-lock-type-face)))
  ;; deprecated/hazardous constructs
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(gets\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(sprintf\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(vsprintf\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(div\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(ldiv\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(lldiv\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(lldiv\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(alloca\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(setjmp\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(longjmp\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(goto\\)\\>" 1 font-lock-warning-face)))
  ;; type specifiers, operators, macros, and such
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(_Alignas\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(_Alignof\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(_Noreturn\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(_Generic\\)\\>" 1 font-lock-function-face)))
  ;; c types
  ;;(font-lock-add-keywords 'c-mode
  ;;'(("\\<struct\\>" 1 font-lock-aggregate-type-face)
  ;;("\\<union\\>" 1 font-lock-aggregate-type-face)))
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(int\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(long\\)\\>" 1 font-lock-type-face)))
  ;; c floating-point types
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(float\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(double\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(long double\\)\\>" 1 font-lock-type-face)))
  ;; preprocessor stuff
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(C_INLINE\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(C_NOINLINE\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(C_FASTCALL\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(C_PURE\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(C_CONST\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(C_NORETURN\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(C_THREADLOCAL\\)\\>" 1 font-lock-thread-face)
                            ("\\<\\(C_VLA\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(C_ALIGNED\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(C_PACKED\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(C_REGPARM\\)\\>" 1 font-lock-register-face)
                            ("\\<\\(C_ASMLINK\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(__asm__\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(__volatile__\\)\\>" 1 font-lock-volatile-face)))
  ;; type qualifiers
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(register\\)\\>" 1 font-lock-register-face)
                            ("\\<\\(static\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(const\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(extern\\)\\>" 1 font-lock-extern-face)
                            ("\\<\\(volatile\\)\\>" 1 font-lock-volatile-face)))
  ;; compiler features
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(_Thread_local\\)\\>" 1 font-lock-thread-face)
                            ("\\<\\(__thread\\)\\>" 1 font-lock-thread-face)
                            ("\\<\\(__attribute__\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(__inline__\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(__always_inline__\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(__noreturn__\\)\\>" 1 font-lock-attribute-face)
                            ("\\<\\(__declspec\\)\\>" 1 font-lock-attribute-face)))
  ;; machine-specific routines
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(setjmp\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(sigsetjmp\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(longjmp\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(siglongjmp\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(alloca\\)\\>" 1 font-lock-warning-face)))
  ;; memory management
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(malloc\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(free\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(realloc\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(calloc\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(aligned_alloc\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(posix_memalign\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(mmap\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(sbrk\\)\\>" 1 font-lock-warning-face)
                            ("\\<\\(valloc\\)\\>" 1 font-lock-memory-face)
                            ("\\<\\(pvalloc\\)\\>" 1 font-lock-memory-face)))
  ;; error-related things
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(errno\\)\\>" 1 font-lock-error-face)))
  ;; debugging
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(assert\\)\\>" 1 font-lock-debug-face)
                            ("\\<\\(pthread_*\\)\\>" 1 font-lock-type-face)))
  ;; POSIX threads
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(pthread*_t\\)\\>" 1 font-lock-type-face)
                            ("\\<\\(pthread_*\\)\\>" 1 font-lock-type-face)))
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(FIXME\\)\\>" 0 font-lock-warning-face t)
                            ("\\<\\(TODO\\)\\>" 0 font-lock-warning-face t)
                            ("\\<\\(QUESTION\\)\\>" 0 font-lock-warning-face t)
                            ("\\<\\(REQUEST\\)\\>" 0 font-lock-warning-face t)
                            ("\\<\\(WONTFIX\\)\\>" 0 font-lock-warning-face t)
                            ("\\<\\(FALLTHRU\\)\\>" 0 font-lock-warning-face t)
                            ("\\<\\(NOTREACHED\\)\\>" 0 font-lock-warning-face t)
                            ("\\<\\(AUTHOR\\)\\>" 0 font-lock-doc-face t)
                            ("\\<\\(LICENSE\\)\\>" 0 font-lock-doc-face t)
                            ("\\<\\(COPYRIGHT\\)\\>" 0 font-lock-doc-face t)
                            ("\\<\\(NOTE\\)\\>" 0 font-lock-doc-face t)
                            ("\\<\\(NOTES\\)\\>" 0 font-lock-doc-face t)
                            ("\\<\\(REFERENCE\\)\\>" 0 font-lock-doc-face t)))
  ;; library functions
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(signal\\)\\>" 1 font-lock-signal-face)
                            ("\\<\\(SIG*\\)\\>" 1 font-lock-signal-face)
                            ("\\<\\(FE_*\\)\\>" 1 font-lock-signal-face)
                            ("\\<\\(*_s\\)\\>" 1 font-lock-volatile-face)
                            ("\\<\\(*_r\\)\\>" 1 font-lock-thread-face)))
  ;; math library functions
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(feget*\\)\\>" 1 font-lock-float-function-face)
                            ("\\<\\(feset*\\)\\>" 1 font-lock-float-function-face)
                            ("\\<\\(feupdate*\\)\\>" 1 font-lock-float-function-face)
                            ("\\<\\(fe*except*\\)\\>" 1 font-lock-signal-face)
                            ("\\<\\(math_errhandling\\)\\>" 1 font-lock-error-face)))
  ;; math library macros
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(FLT_*\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(DBL_*\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(LDBL_*\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(DECIMAL_*\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(HUGE_VAL*\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(fe*except*\\)\\>" 1 font-lock-signal-face)))
  ;; other stuff
  (font-lock-add-keywords 'c-mode
                          '(("\\<\\(E*\\)\\>" 1 font-lock-error-face)
                            ("\\<\\(SIG*\\)\\>" 1 font-lock-signal-face)
                            ("\\<\\(*_MIN\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(*_MAX\\)\\>" 1 font-lock-machine-face)
                            ("\\<\\(*_s\\)\\>" 1 font-lock-volatile-face)
                            ("\\<\\(*_r\\)\\>" 1 font-lock-thread-face))))

(defun vendetta-init-c-style()
  ;;  (c-toggle-electric-state 1)
  ;;  (c-toggle-auto-hungry-state t)
  (vendetta-init-faces)
  (c-set-style "vendetta")
  (vendetta-set-c-mode-defaults))
;;  (add-hook 'local-write-file-hook
  ;;          (lambda() (untabify (point-min) (point-max)))))

;;(defun vendetta-c-initialization-hook
;;  (setq c-basic-offset 4))

(defun vendetta-c-mode-hook()
  (set-foreground-color "white")
  (set-background-color "black")
  (c-add-style "vendetta" vendetta-c-style)
  (vendetta-init-c-style))
