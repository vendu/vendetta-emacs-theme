;; -*-no-byte-compile: t; -*-

(defun vendetta-indent-asm()
;;  (insert-tab)
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
  (setq tab-width 4)
  (setq tab-always-indent nil)
  (setq indent-tabs-mode t)
  (setq indent-line-function 'vendetta-indent-asm)
  (local-unset-key (vector asm-comment-char)))

(add-to-list 'auto-mode-alist "\\.s$\\" 'asm-mode)   ;; unpreprocessed assembly
(add-to-list 'auto-mode-alist "\\.S$\\" 'asm-mode)   ;; c-preprocessed assembly
(add-to-list 'auto-mode-alist "\\.asm$\\" 'asm-mode) ;; vpu/v0 assembly source
(add-to-list 'auto-mode-alist "\\.def$\\" 'asm-mode) ;; vpu/v0 assembly header

