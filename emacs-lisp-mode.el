;; -*-no-byte-compile: t; -*-

;; emacs lisp functionality

(custom-theme-set-variables
 'vendetta
 '(indent-tabs-mode nil))

;(defun vendetta-emacs-lisp-after-save-hook()
;  (let* file-extension (file-name-extension buffer-file-name))
;  ((if (or (string-equal (downcase file-extension) "elc")
;           (string-equal (downcase file-extension) "el"))
;       (if (not (string-equal (downcase file-extension) "elc"))
;           ((let* new-file (concat buffer-file-name "c"))
;            (if ((file-exists-p new-file)
;                 (delete-file new-file)))
;            (byte-compile-file buffer-file-name)))
;     t)
;   nil))

(defun vendetta-emacs-lisp-mode-hook()
  ;;	    (define-key flyspell-mode-map "\M-\t" nil)
  (define-key emacs-lisp-mode-map "\C-x\C-e" 'pp-eval-last-sexp)
  (define-key emacs-lisp-mode-map [ret] 'reindent-then-newline-and-indent))

