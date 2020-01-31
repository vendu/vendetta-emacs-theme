;; -*-no-byte-compile: t; -*-

(defun vendetta-init-tex-style()
  (custom-theme-set-variables
   'vendetta
   '((word-wrap nil)
     (TeX-auto-save t)
     (TeX-parse-self t)
     (TeX-save-query t)
     (indent-tabs-mode t)
     (font-latex-bold ((,class (:inherit bold))))
     (font-latex-warning ((,class (:inherit font-lock-warning))))
     (font-latex-sedate ((,class (:foreground ,yellow :weight bold))))
     (font-latex-string ((,class (:foreground ,green))))
     (font-latex-title-4 ((,class (:inherit variable-pitch :weight bold))))
     (font-latex-sectioning-0 ((,class (:foreground ,blue
                                                    :background ,black
                                                    :scale 1.5))))
     (font-latex-sectioning-1 ((,class (:foreground ,blue
                                                    :background ,black
                                                    :scale 1.5)))))))

(defun vendetta-tex-mode-hook()
  (vendetta-init-tex-style)
  (font-lock-fontify-buffer))

