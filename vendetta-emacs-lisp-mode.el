;; -*-no-byte-compile: t; -*-

;; emacs lisp functionality

(defun vendetta-emacs-lisp-mode-hook()
  ;;	    (define-key flyspell-mode-map "\M-\t" nil)
  (setq indent-tabs-mode nil)
  (define-key emacs-lisp-mode-map "\C-x\C-e" 'pp-eval-last-sexp)
  (define-key emacs-lisp-mode-map [ret] 'reindent-then-newline-and-indent)
  (font-lock-fontify-buffer))

