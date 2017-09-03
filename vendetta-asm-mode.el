;; -*-no-byte-compile: t; -*-

(require 'asm-mode)

(defun vendetta-asm-mode-hook()
  (setq tab-width 4)
  (setq tab-always-indent nil)
  (setq indent-tabs-mode nil)
  (setq indent-line-function 'insert-tab)
  (local-unset-key (vector asm-comment-char)))

(add-to-list 'auto-mode-alist "\\.asm$\\" 'asm-mode)

