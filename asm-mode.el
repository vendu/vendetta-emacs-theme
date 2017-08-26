;; -*-no-byte-compile: t; -*-

(defun my-asm-mode-hook()
  (local-unset-key (vector asm-comment-char))
  (setq tab-always-indent nil))

