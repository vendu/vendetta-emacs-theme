;; -*-no-byte-compile: t; -*-

;; customizations for [c] programming

(defconst vendetta-c-style "zero")

(defconst vendetta-zero-c-style
  '((c-basic-offset . 4)
    (c-label-minimum-indentation . +)
    (c-tab-always-indent . nil)
    (indent-tabs-mode . nil)
    (c-electric-flag t)
    (c-progress interval 1)
    (c-tab-always-indent . t)
    (c-syntactic-indentation . t)
    (c-syntactic-indentation-in-macros . t)
    (c-echo-syntactic-information-p . t)
    (c-indent-comments-syntactically-p . t)
    (c-strict-syntax-p . nil)
    ;;    (c-backslash-column fill-column)
    ;;    (c-max-oneliner-length fill-column)
    (c-backslash-column . 72)
    (c-auto-align-backslashes . t)
    (c-electric-pound-behavior . (alignleft))
    (c-basic-offset . 4)
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
                      (statement .
                                 (vendetta-indent-c-label-intro
                                  0))
                      (statement-case-open . 0)
                      (statement-case-intro .
                                            (vendetta-indent-c-label-intro
                                             +))
                      (statement-block-intro .
                                             (vendetta-indent-c-label-intro
                                              +))
                      (statement-cont . (c-lineup-assignments
                                         c-lineup-string-cont
                                         c-lineup-cascaded-calls
                                         c-lineup-math
                                         +))
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
                      (brace-list-close . -)
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
  "ZERO C Style")

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

(defun vendetta-init-c-stdc-font-lock-style()
  ;; compiler features
  (font-lock-add-keywords 'c-mode
                          '(("__thread" 1 font-lock-thread-face prepend)
                            ("__attribute__" 1 font-lock-attribute-face)))
  ;; c qualifiers
  (font-lock-add-keywords 'c-mode
			  '(("volatile" 1 font-lock-memory-face prepend)
                            ("const" 1 font-lock-constant-face prepend)
                            ("extern" 1 font-lock-extern-face prepend)
                            ("register" 1 font-lock-register-face prepend)))
  ;; c scalar types
  (font-lock-add-keywords 'c-mode
			  '(("void" 1 font-lock-type-face prepend)
                            ("signed" 1 font-lock-type-face prepend)
                            ("unsigned" 1 font-lock-type-face prepend)
                            ("char" 1 font-lock-type-face prepend)
                            ("short" 1 font-lock-type-face prepend)
                            ("int" 1 font-lock-type-face prepend)
                            ("long" 1 font-lock-type-face prepend)
                            ("int8_t" 1 font-lock-type-face prepend)
                            ("uint8_t" 1 font-lock-type-face prepend)
                            ("int16_t" 1 font-lock-type-face prepend)
                            ("uint16_t" 1 font-lock-type-face prepend)
                            ("int32_t" 1 font-lock-type-face prepend)
                            ("uint32_t" 1 font-lock-type-face prepend)
                            ("int64_t" 1 font-lock-type-face prepend)
                            ("uint64_t" 1 font-lock-type-face prepend)))
  ;; c floating-point types
  (font-lock-add-keywords 'c-mode
			  '(("float" 1 font-lock-type-face prepend)
                            ("double" 1 font-lock-type-face prepend)))
  ;; machine-specific routines
  (font-lock-add-keywords 'c-mode
                          '(("setjmp" 1 font-lock-machine-face prepend)
                            ("sigsetjmp" 1 font-lock-machine-face prepend)
                            ("longjmp" 1 font-lock-machine-face prepend)
                            ("siglongjmp" 1 font-lock-machine-face prepend)
                            ("alloca" 1 font-lock-memory-face prepend)))
  ;; memory management
  (font-lock-add-keywords 'c-mode
			  '(("malloc" 1 font-lock-memory-face prepend)
                            ("free" 1 font-lock-memory-face prepend)
                            ("realloc" 1 font-lock-memory-face prepend)
                            ("calloc" 1 font-lock-memory-face prepend)
                            ("posix_memalign" 1 font-lock-memory-face prepend)
                            ("valloc" 1 font-lock-memory-face prepend)))
  ;; POSIX threads
  (font-lock-add-keywords 'c-mode
                          '(("pthread_self" 1 font-lock-thread-face prepend)
                            ("pthread_create" 1 font-lock-thread-face prepend)
                            ("pthread_detach" 1 font-lock-thread-face prepend)
                            ("pthread_exit" 1 font-lock-thread-face prepend)
                            ("pthread_kill" 1 font-lock-thread-face prepend)
                            ("pthread_mutex_init" 1 font-lock-thread-face prepend)
                            ("pthread_mutex_trylock" 1 font-lock-thread-face prepend)
                            ("pthread_mutex_lock" 1 font-lock-thread-face prepend)
                            ("pthread_mutex_unlock" 1 font-lock-thread-face prepend)
                            ("pthread_mutex_timedlock" 1 font-lock-thread-face prepend)
                            ("pthread_mutex_init" 1 font-lock-thread-face prepend))))

(defun vendetta-init-c-zero-font-lock-style()
  (font-lock-add-keywords 'c-mode
                          '(("INLINE" 1 font-lock-function-face prepend)
                            ("NOINLINE" 1 font-lock-function-face prepend)
                            ("FASTCALL" 1 font-lock-function-face prepend)
                            ("PURE" 1 font-lock-function-face prepend)
                            ("CONST" 1 font-lock-constant-face prepend)
                            ("NORETURN" 1 font-lock-function-face prepend)
                            ("THREADLOCAL" 1 font-lock-thread-face prepend)
                            ("ALIGNED" 1 font-lock-memory-face prepend)
                            ("PACKED" 1 font-lock-memory-face prepend)
                            ("REGPARM" 1 font-lock-register-face prepend)
                            ("ASMLINK" 1 font-lock-function-face prepend)
                            ("__asm__" 1 font-lock-machine-face prepend)
                            ("__volatile__" 1 font-lock-volatile-face prepend)))
  (font-lock-add-keywords 'c-mode
                          '(("FIXME" 1 font-lock-warning-face prepend)
                            ("TODO" 1 font-lock-warning-face prepend)
                            ("WONTFIX" 1 font-lock-warning-face prepend)
                            ("FALLTHRU" 1 font-lock-doc-face prepend)
                            ("NOTE" 1 font-lock-doc-face prepend)
                            ("REFERENCE" 1 font-lock-constant-face prepend)
                            ("NOTREACHED" 1 font-lock-warning-face prepend))))

(defun vendetta-init-c-font-lock-style()
  (vendetta-init-c-stdc-font-lock-style)
  (vendetta-init-c-zero-font-lock-style))

(defun vendetta-init-zero-c-style()
  (setq indent-tabs-mode nil)
  (setq tab-always-indent t)
  (c-toggle-electric-state t)
  ;;  (c-toggle-auto-hungry-state t)
  (c-add-style "zero" vendetta-zero-c-style)
  (c-set-style "zero")
  (vendetta-set-c-mode-defaults))
;;  (vendetta-init-c-font-lock-style))

(defun vendetta-c-mode()
  (setq tab-always-indent nil)
  (vendetta-init-zero-c-style))

(vendetta-init-zero-c-style)

(add-to-list 'auto-mode-alist "\\.[ch]\\" 'vendetta-c-mode)
(add-to-list 'auto-mode-alist "\\.ino$\\" 'vendetta-c-mode)

;;(add-to-list 'auto-mode-alist "\\.[ch]\\" 'c-mode)
(add-to-list 'auto-mode-alist "\\.ino$\\" 'c-mode)

