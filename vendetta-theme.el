;; -*-no-byte-compile: t; -*-
(deftheme vendetta "vendetta theme for programmers")
(defconst vendetta-autoload-file "~/.emacs.d/loaddefs.el")
(defconst vendetta-util-file "vendetta-util")
;; (defconst vendetta-init-file "vendetta-init")
(defconst vendetta-emacs-lisp-mode-file "vendetta-emacs-lisp-mode")
(defconst vendetta-c-mode-file "vendetta-c-mode")
(defconst vendetta-asm-mode-file "vendetta-asm-mode")
(defconst vendetta-sh-mode-file "vendetta-sh-mode")
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
 '(filladapt-mode 1)
 '(verilog-align-ifelse t)
 '(verilog-indent-tabs-mode nil)
 '(verilog-tab-always-indent t)
 '(verilog-indent-level 4)
 '(verilog-indent-level-module 4)
 '(verilog-indent-level-declaration 4)
 '(verilog-indent-level-behavioral 4)
 '(verilog-indent-level-directive 0)
 '(verilog-cexp-indent 4)
 '(verilog-case-indent 4)
 '(verilog-indent-begin-after-if 0)
 '(verilog-indent-declaration-macros nil)
 '(verilog-indent-lists t)
 '(verilog-auto-newline t)
 '(verilog-auto-indent-on-newline t)
 '(verilog-indent-begin-after-if nil)
 '(verilog-auto-delete-trailing-whitespace t)
 '(verilog-auto-read-includes t)
 '(verilog-auto-template-warn-unused t)
 '(verilog-auto-undef t)
 '(verilog-auto-unused t)
 '(verilog-auto-lineup '(all))
 '(verilog-auto-endcomments t)
 '(verilog-tab-to-comment nil)
 '(verilog-date-scientific-format t)
 '(verilog-minimum-comment-distance 8)
 '(verilog-highlight-grouping-keywords t)
 '(verilog-highlight-modules t)
 '(verilog-highlight-includes t)
 '(verilog-highlight-p1800-keywords t))
;; '(recenter-display font-lock-fontify-buffer))
(custom-theme-set-faces
 'vendetta
 '(font-lock-builtin-face
   ((t (:foreground "deep pink"))))
 '(font-lock-comment-delimiter-face
   ((t (:foreground "dark orange"))))
 '(font-lock-comment-face
   ((t (:foreground "orange"))))
 '(font-lock-document-face
   ((t (:foreground "yellow"))))
 '(font-lock-constant-face
   ((t (:foreground "salmon"))))
 '(font-lock-doc-face
   ((t (:foreground "forest green"))))
 '(font-lock-doc-string-face
   ((t (:foreground "forest green"))))
 '(font-lock-function-name-face
   ((t (:foreground "deep sky blue"))))
 '(font-lock-block-face
   ((t (:foreground "lime green"))))
 '(font-lock-macro-face
   ((t (:foreground "light slate blue"))))
 '(font-lock-label-face
   ((t (:foreground "light blue"))))
 '(font-lock-keyword-face
   ((t (:foreground "green"))))
 '(font-lock-operator-face
   ((t (:foreground "light green"))))
 '(font-lock-preprocessor-face
   ((t (:foreground "light sky blue"))))
 '(font-lock-string-face
   ((t (:foreground "light salmon"))))
 '(font-lock-type-face
   ((t (:foreground "orange"))))
 '(font-lock-native-type-face
   ((t (:foreground "light orange"))))
 '(font-lock-aggregate-face
   ((t (:foreground "violet red"))))
 '(font-lock-variable-name-face
   ((t (:foreground "light goldenrod"))))
 '(font-lock-negation-char-face
   ((t (:foreground "orange"))))
 '(font-lock-qualifier-face
   ((t (:foreground "light pink"))))
 '(font-lock-extern-face
   ((t (:foreground "hot pink"))))
 '(font-lock-attribute-face
   ((t (:foreground "deep pink"))))
 '(font-lock-register-face
   ((t (:foreground "medium sea green"))))
 '(font-lock-memory-face
   ((t (:foreground "indian red"))))
 '(font-lock-wire-face
   ((t (:foreground "orange red"))))
 '(font-lock-machine-face
   ((t (:foreground "light sea green"))))
 '(font-lock-float-type-face
   ((t (:foreground "sea green"))))
 '(font-lock-float-function-face
   ((t (:foreground "dark sea green"))))
 '(font-lock-thread-face
   ((t (:foreground "cyan"))))
 '(font-lock-debug-face
   ((t (:foreground "magenta"))))
 '(font-lock-warning-face
   ((t (:foreground "light red"))))
 '(font-lock-signal-face
   ((t (:foreground "light coral"))))
 '(font-lock-error-face
   ((t (:foreground "red")))))

(defun vendetta-init-hooks()
  (add-hook 'focus-in-hook 'redraw-display)
  ;;  (add-hook 'before-save-hook 'strip-trailing-whitespace)
  (add-hook 'before-save-hook 'xah-clean-whitespace)
  ;;  (add-hook 'before-save-hook 'xah-clean-whitespace)
  (add-hook 'before-save-hook 'collapse-blank-lines)
  (add-hook 'emacs-lisp-mode-hook 'vendetta-emacs-lisp-mode-hook)
  ;;  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'c-mode-hook 'vendetta-c-mode-hook)
  (add-hook 'asm-mode-hook 'vendetta-asm-mode-hook)
  (add-hook 'sh-mode-hook 'vendetta-sh-mode-hook)
  (add-hook 'tex-mode-hook 'vendetta-tex-mode-hook)
  (add-hook 'tex-mode-hook 'visual-line-mode)
  (add-hook 'verilog-mode-hook 'vendetta-verilog-mode-hook))

;; NOTE: we limit text display to max 80 columns (set window-margins)
(defun vendetta-theme-init()
  (unless (fboundp 'font-lock-ensure)
    (defalias 'font-lock-ensure 'font-lock-fontify-buffer))
  (load vendetta-util-file)
  (load vendetta-emacs-lisp-mode-file)
  (load vendetta-c-mode-file)
  (load vendetta-asm-mode-file)
  (load vendetta-tex-mode-file)
  (load vendetta-verilog-mode-file)
  (set-window-margins nil 0 (max (- (window-width) 80) 0))
  (vendetta-init-hooks))

(vendetta-theme-init)

(provide-theme 'vendetta)

