;; -*-no-byte-compile: t; -*-

;; customizations for [c] programming

(defconst vendetta-c-style "zero")

(defconst vendetta-zero-c-style
  '((c-basic-offset . 4)
    (c-label-minimum-indentation . +)
    (c-tab-always-indent . nil)
    (indent-tabs-mode . nil)
    (c-syntactic-indentation . t)
    (c-syntactic-indentation-in-macros . t)
    (c-echo-syntactic-information-p . t)
    (c-indent-comments-syntactically-p . t)
    (c-strict-syntax-p . nil)
    (c-backslash-column . fill-column)
    (c-max-oneliner-length . fill-column)
    (c-auto-align-backslashes . t)
    (c-hanging-semi&comma-criteria .
                                   (c-semi&comma-no-newlines-before-nonblanks
                                    c-semi&comma-inside-parenlist))
    (c-offsets-alist .
                     ((string . 0)
                      (c . (c-lineup-C-comments 0))
                      (comment-intro . (c-lineup-knr-region-comment
                                        c-comment-only-line-offset
                                        0))
                      (cpp-macro . 0)
                      (cpp-macro-cont . +)
                      (cpp-define-intro . (c-lineup-cpp-define +))
                      (defun-block-intro . (c-lineup-arglist-intro-after-paren))
                      (defun-close . (c-lineup-close-paren))
                      (block-open . 0)
                      (block-close . 0)
                      (topmost-intro . +)
                      (topmost-intro-cont . (c-lineup-assignments
                                             c-lineup-string-cont
                                             c-lineup-cascaded-calls
                                             c-lineup-math
                                             +))
                      (statement . 0)
                      (statement-case-open . +)
                      (statement-case-intro . +)
                      (statement-block-intro . (vendetta-indent-c-after-label +))
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
                      (brace-list-entry . +)
                      (brace-list-close .
                                        (c-lineup-arglist-close-under-paren 0))
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
                      (func-decl-cont . 0)
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
                            ((label)
                             (case-label)))
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
(c-add-style "zero" vendetta-zero-c-style)

;;(defconst zero-user-c-style-vars
;;  '((c-basic-offset 4)
;;    (tab-width 8)
;;    (c-statement-offset '(c-lineup-runin-statements 0))
;;    (c-brace-list-entry-offset '(c-lineup-whitesmith-blocks))
;;    (c-brace-entry-open-offset '(c-lineup-whitesmith-blocks))
;;    (c-statement-offset '(c-lineup-whitesmith-blocks))
;;    (c-arglist-cont-offset '(c-lineup-whitesmith-blocks))
;;    (c-defun-block-intro-offset '(c-lineup-whitesmith-in-block +))
;;    (c-defun-close-offset '(c-lineup-whitesmith-in-block 0))
;;    (c-block-close-offset '(c-lineup-whitesmith-in-block 0))
;;    (c-brace-list-intro-offset '(c-lineup-whitesmith-in-block +))
;;    (c-brace-list-close-offset '(c-lineup-whitesmith-in-block 0))
;;    (c-statement-block-intro-offset '(c-lineup-whitesmith-in-block
;;                                      vendetta-indent-c-after-label +))
;;    (c-arglist-intro-offset '(c-lineup-whitesmith-in-block +))
;;    (c-arglist-cont-nonempty-offset '(c-lineup-whitesmith-in-block +))
;;    (c-arglist-close-offset '(c-lineup-whitesmith-in-block 0))
;;    (c-require-final-newline t)))

;; this routine was modified from one donated by stack_pivot on reddit :)
(defun vendetta-indent-c-after-label(symbol-and-anchor)
  (let* ((new-offset '++)
         (anchor (cdr symbol-and-anchor))
         (anchor-line (line-number-at-pos anchor)))
    (save-excursion
      (goto-char anchor)
      (search-forward-regexp ":[[:space:]]*[^[:space:]{]" nil t)
      (if (and (> (point) anchor)
               (= anchor-line (line-number-at-pos)))
          (setq new-offset (- (point) anchor 1)))
      new-offset)))

(defun vendetta-set-c-mode-defaults()
  (add-hook 'c-special-indent-hook 'delete-trailing-whitespace)
  (set-buffer-file-coding-system 'iso-latin-1-unix t)
  (define-key c-mode-base-map "\C-TAB" 'newline-and-indent)
  (define-key c-mode-base-map [ret]  'newline-and-indent))

(defun vendetta-init-c-font-lock-style()
  (font-lock-add-keywords 'c-mode
			  '(("FIXME" 1 font-lock-warning-face prepend)
                            ("TODO" 1 font-lock-warning-face prepend)
                            ("NOTE" 1 font-lock-doc-face prepend)
                            ("REFERENCE" 1 font-lock-constant-face prepend)
                            ("NOTREACHED" 1 font-lock-warning-face prepend))))

(defun vendetta-init-c-style()
  (c-set-style vendetta-c-style)
  (vendetta-set-c-mode-defaults)
  (vendetta-init-c-font-lock-style))

(defun vendetta-c-mode()
  (vendetta-init-c-style))

(add-to-list 'auto-mode-alist "\\.[ch]\\" 'vendetta-c-mode)
(add-to-list 'auto-mode-alist "\\.ino$\\" 'vendetta-c-mode)

