(require 'asm-mode)

(defun vendetta-init-asm-font-lock-style()
  (font-lock-add-keywords 'asm-mode
                          '(("\\<\\(\%*\\)\\>" 1 font-lock-register-face))
                          '((("\\<\\(\$*\\)\\>" 1 font-lock-constant-face)))))

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

(defun vendetta-calculate-asm-indentation()
  (or
   ;; flush preprocessor directives to the left margin
   (and (looking-at "\\(\\\#\\(\sw\\|\\s_\\)\\)") 0)
   ;; Flush labels to the left margin.
   (and (looking-at "\\(\\sw\\|\\s_\\)+:") 0)
   ;; Same thing for `;;;' comments.
   (and (looking-at "\\s<\\s<\\s<") 0)
   ;; Simple `;' comments go to the comment-column.
   (and (looking-at "\\s<\\(\\S<\\|\\'\\)") comment-column)
   ;; The rest goes at the first tab stop.
   (or (indent-next-tab-stop 0))))

(defun vendetta-indent-asm-line()
  "Auto-indent the current line."
  (interactive)
  (let* ((savep (point))
         (indent (condition-case nil
                     (save-excursion
                       (forward-line 0)
                       (skip-chars-forward " \t")
                       (if (>= (point) savep) (setq savep nil))
                       (max (vendetta-calculate-asm-indentation) 0))
                   (error 0))))
    (if savep
        (save-excursion (indent-line-to indent))
      (indent-line-to indent))))

(defun vendetta-asm-mode-hook()
  (setq tab-width 4)
  (setq tab-always-indent t)
  (setq indent-tabs-mode nil)
  ;;  (setq asm-comment-column 4)
  (setq indent-line-function 'vendetta-indent-asm-line))
;;  (local-unset-key (vector asm-comment-char))

