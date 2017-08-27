;; -*-no-byte-compile: t; -*-

(defun vendetta-asm-mode-hook()
  (setq indent-tabs-mode nil)
  (setq tab-always-indent nil)
  (setq indent-line-function 'insert-tab)
  (local-unset-key (vector asm-comment-char)))

