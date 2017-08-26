;; -*-no-byte-compile: t; -*-

(defun vendetta-set-tex-mode-defaults()
  (setq-default
   word-wrap nil
   setq TeX-auto-save t
   setq TeX-parse-self t
   setq TeX-save-query t
   setq indent-tabs-mode t)
  )

(defun vendetta-set-latex-fonts()
  (setq font-latex-bold ((,class (:inherit bold))))
  (setq font-latex-warning ((,class (:inherit font-lock-warning))))
  (setq font-latex-sedate ((,class (:foreground ,yellow :weight bold))))
  (setq font-latex-string ((,class (:foreground ,green))))
  (setq font-latex-title-4 ((,class (:inherit variable-pitch :weight bold))))
  (setq font-latex-sectioning-0 ((,class (:foreground ,blue :background ,black :scale 1.5))))
  (setq font-latex-sectioning-1 ((,class (:foreground ,blue :background ,black :scale 1.5)))))

(defun vendetta-tex-mode-hook()
  (vendetta-set-tex-mode-defaults)
  (vendetta-set-latex-fonts))

