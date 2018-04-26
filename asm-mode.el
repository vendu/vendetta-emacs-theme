;; -*-no-byte-compile: t; -*-

(defun vendetta-indent-asm()
  (insert-tab)
  (let* ((new-offset 0)
         (anchor (cdr symbol-and-anchor))
         (anchor-line (line-number-at-pos anchor)))
    (save-excursion
      (goto-char anchor)
      (search-forward-regexp ":[[:space:]]*[^[:space:];/\*]" nil t)
      (if (and (> (point) anchor)
               (= anchor-line (line-number-at-pos)))
          (setq new-offset (- (point) anchor 1)))
      new-offset)))

(defun vendetta-asm-mode-hook()
  (setq tab-always-indent nil)
  (setq indent-tabs-mode t)
  (setq indent-line-function 'vendetta-indent-asm)
  (local-unset-key (vector asm-comment-char)))

