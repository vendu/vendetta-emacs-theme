;; -*-no-byte-compile: t; -*-

(defun vendetta-asm-mode-hook()
  (setq tab-always-indent nil)
  (setq indent-tabs-mode nil)
  (setq indent-line-function 'insert-tab)
  (local-unset-key (vector asm-comment-char)))

