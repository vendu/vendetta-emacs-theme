;; -*-no-byte-compile: t; -*-

(deftheme vendetta "vendetta theme for programmers")

(defconst vendetta-autoload-file "~/.emacs.d/loaddefs.el")
(defconst vendetta-util-file "util")
(defconst vendetta-init-file "init")
(defconst vendetta-emacs-lisp-mode-file "emacs-lisp-mode")
(defconst vendetta-c-mode-file "c-mode")
(defconst vendetta-asm-mode-file "asm-mode")
(defconst vendetta-tex-mode-file "tex-mode")
(defconst vendetta-verilog-mode-file "verilog-mode")
(defconst vendetta-custom-file "custom")

(custom-theme-set-variables
 'vendetta
 '(vendetta-c-style "zero")
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil)
 '(fill-column 72)
 '(column-number-mode 1)
 '(comment-multi-line nil)
 '(filladapt-mode 1))

(custom-theme-set-faces
 'vendetta
 '(font-lock-builtin-face
   ((t (:foreground "medium spring green"))))
 '(font-lock-comment-delimiter-face
   ((t (:foreground "dark salmon" :slant italic))))
 '(font-lock-comment-face
   ((t (:foreground "light goldenrod" :slant italic))))
 '(font-lock-constant-face
   ((t (:foreground "light slate blue"))))
 '(font-lock-doc-face
   ((t (:foreground "light salmon" :slant italic))))
 '(font-lock-function-name-face
   ((t (:foreground "forest green"))))
 '(font-lock-keyword-face
   ((t (:foreground "deep sky blue"))))
 '(font-lock-preprocessor-face
   ((t (:foreground "magenta"))))
;; '(font-lock-preprocessor-face
;;   ((t (:foreground "gold"))))
 '(font-lock-string-face
   ((t (:foreground "orange"))))
 '(font-lock-type-face
   ((t (:foreground "lime green"))))
 '(font-lock-variable-name-face
   ((t (:foreground "dark orange"))))
 '(font-lock-warning-face
   ((t (:foreground "pink" :slant italic)))))

(defun vendetta-init-hooks()
;;  (custom-set-variables
;;   '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
;;  (add-hook 'after-save-hook 'vendetta-emacs-lisp-after-save-hook)
;;  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'before-save-hook 'xah-clean-whitespace)
  (add-hook 'emacs-lisp-mode-hook 'vendetta-emacs-lisp-mode-hook)
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'asm-mode-hook 'vendetta-asm-mode-hook)
  (add-hook 'tex-mode-hook 'vendetta-tex-mode-hook)
  (add-hook 'tex-mode-hook 'visual-line-mode)
  (add-hook 'verilog-mode-hook 'vendetta-verilog-mode-hook))
  (add-hook 'c-mode-hook 'vendetta-c-mode)

(defun vendetta-theme-init()
;;  (load vendetta-init-file)
;;  (load vendetta-custom-file)
;; make return key also do indent, globally
  (load vendetta-util-file)
  (load vendetta-emacs-lisp-mode-file)
  (load vendetta-c-mode-file)
  (load vendetta-asm-mode-file)
  (load vendetta-tex-mode-file)
  (load vendetta-verilog-mode-file)
  (xah-init-whitespace)
  (vendetta-init-hooks))

(vendetta-theme-init)

;;(add-to-list 'auto-mode-alist "\\.[sS]\\" asm-mode)
;(add-to-list 'auto-mode-alist "\\.tex\\" tex-mode)

(provide-theme 'vendetta)

