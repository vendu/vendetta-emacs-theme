;; -*-no-byte-compile: t; -*-

(deftheme vendetta "vendetta theme for programmers")

(defconst vendetta-autoload-file "~/.emacs.d/loaddefs.el")
(defconst vendetta-util-file "vendetta-util")
;; (defconst vendetta-init-file "vendetta-init")
(defconst vendetta-emacs-lisp-mode-file "vendetta-emacs-lisp-mode")
(defconst vendetta-c-mode-file "vendetta-c-mode")
(defconst vendetta-asm-mode-file "vendetta-asm-mode")
(defconst vendetta-tex-mode-file "vendetta-tex-mode")
(defconst vendetta-verilog-mode-file "vendetta-verilog-mode")
(defconst vendetta-custom-file "custom")

(custom-theme-set-variables
 'vendetta
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil)
 '(tab-width 4)
 '(fill-column 72)
 '(auto-fill-mode nil)
 '(column-number-mode 1)
 '(comment-multi-line nil)
 '(filladapt-mode 1))

(custom-theme-set-faces
 'vendetta
 '(font-lock-builtin-face
   ((t (:foreground "deep pink"))))
 '(font-lock-comment-delimiter-face
   ((t (:foreground "dark orange"))))
 '(font-lock-comment-face
   ((t (:foreground "orange"))))
 '(font-lock-constant-face
   ((t (:foreground "salmon"))))
 '(font-lock-doc-face
   ((t (:foreground "forest green"))))
 '(font-lock-function-name-face
   ((t (:foreground "deep sky blue"))))
 '(font-lock-keyword-face
   ((t (:foreground "green"))))
 '(font-lock-preprocessor-face
   ((t (:foreground "dodger blue"))))
 '(font-lock-string-face
   ((t (:foreground "light salmon"))))
 '(font-lock-type-face
   ((t (:foreground "orange"))))
 '(font-lock-variable-name-face
   ((t (:foreground "gold"))))
 '(font-lock-warning-face
   ((t (:foreground "red"))))
 '(font-lock-attribute-face
   ((t (:foreground "dark orange"))))
 '(font-lock-register-face
   ((t (:foreground "medium sea green"))))
 '(font-lock-memory-face
   ((t (:foreground "indian red"))))
 '(font-lock-machine-face
   ((t (:foreground "light sea green"))))
 '(font-lock-thread-face
   ((t (:foreground "cyan"))))
 '(font-lock-extern-face
   ((t (:foreground "hot pink")))))

(defun vendetta-init-hooks()
;;  (custom-set-variables
;;   '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
  ;;  (add-hook 'after-save-hook 'vendetta-emacs-lisp-after-save-hook)
;;  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'before-save-hook 'xah-clean-whitespace)
  (add-hook 'emacs-lisp-mode-hook 'vendetta-emacs-lisp-mode-hook)
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'c-mode-hook 'vendetta-c-mode-hook)
  (add-hook 'asm-mode-hook 'vendetta-asm-mode-hook)
  (add-hook 'tex-mode-hook 'vendetta-tex-mode-hook)
  (add-hook 'tex-mode-hook 'visual-line-mode)
  (add-hook 'verilog-mode-hook 'vendetta-verilog-mode-hook))

(defun vendetta-theme-init()
  (load vendetta-util-file)
  (load vendetta-emacs-lisp-mode-file)
  (load vendetta-c-mode-file)
  (load vendetta-asm-mode-file)
  (load vendetta-tex-mode-file)
  (load vendetta-verilog-mode-file)
  (xah-init-whitespace)
  (vendetta-init-hooks))

(vendetta-theme-init)

(provide-theme 'vendetta)

