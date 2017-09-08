;; -*-no-byte-compile: t; -*-

;; customizations for [c] programming

(defconst vendetta-zero-c-style
  '((c-electric-flag t)
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
                                              c-lineup-assignments
                                              c-lineup-string-cont
                                              c-lineup-cascaded-calls
                                              c-lineup-arglist-operators
                                              c-lineup-arglist
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
;;          (cond ((search-forward-regexp ":[[:space:]]*[^[:space:][;{]]" nil t)
;;                 ;; did we find non-whitespace (and not just an open brace or
;;                 ;; semicolon) after the colon on the case line?
;;                 (if (and (> (point) anchor)
;;                          (= anchor-line (line-number-at-pos)))
;;                     (setq new-offset (- (point) anchor 1))))
;;                ((search-forward-regexp ":[[:space:]]*" nil t)
;;                 ;; colon followed by whitespace
;;                 (setq new-offset '++)))))
;;    new-offset))

(defun vendetta-set-c-mode-defaults()
;;  (add-hook 'c-special-indent-hook 'delete-trailing-whitespace)
  (set-buffer-file-coding-system 'iso-latin-1-unix t)
  (define-key c-mode-base-map "\C-TAB" 'newline-and-indent)
  (define-key c-mode-base-map [ret] 'newline-and-indent))

(defun vendetta-init-c-font-lock-style()
  (font-lock-add-keywords 'c-mode
			  '(("FIXME" 1 font-lock-warning-face prepend)
                            ("TODO" 1 font-lock-warning-face prepend)
                            ("NOTE" 1 font-lock-doc-face prepend)
                            ("REFERENCE" 1 font-lock-constant-face prepend)
                            ("NOTREACHED" 1 font-lock-warning-face prepend))))

(defun vendetta-init-c-style()
  (setq indent-tabs-mode nil)
  (setq tab-always-indent t)
  (c-toggle-electric-state t)
;;  (c-toggle-auto-hungry-state t)
  (c-add-style "zero" vendetta-zero-c-style)
  (c-set-style "zero")
  (vendetta-set-c-mode-defaults)
  (vendetta-init-c-font-lock-style))

(defun vendetta-c-mode()
  (vendetta-init-c-style))

;;(add-to-list 'auto-mode-alist "\\.[ch]\\" 'c-mode)
(add-to-list 'auto-mode-alist "\\.ino$\\" 'c-mode)

