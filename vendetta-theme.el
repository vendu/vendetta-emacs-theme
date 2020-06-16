(require 'whitespace)

(deftheme vendetta "vendetta theme for programmers")
(defconst vendetta-autoload-file "~/.emacs.d/loaddefs.el")
(defconst vendetta-util-file "vendetta-util")
;; (defconst vendetta-init-file "vendetta-init")
(defconst vendetta-prog-mode-file "vendetta-prog-mode")
(defconst vendetta-emacs-lisp-mode-file "vendetta-emacs-lisp-mode")
(defconst vendetta-c-mode-file "vendetta-c-mode")
(defconst vendetta-asm-mode-file "vendetta-asm-mode")
(defconst vendetta-sh-mode-file "vendetta-sh-mode")
(defconst vendetta-tex-mode-file "vendetta-tex-mode")
(defconst vendetta-verilog-mode-file "vendetta-verilog-mode")
(defconst vendetta-custom-file "custom")

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
 '(font-lock-aggregate-type-face
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

(custom-theme-set-variables
 'vendetta
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil)
 ;; '(tab-width 4)
 '(tab-always-indent t)
 '(column-number-mode t)
 '(fill-column 72)
 '(auto-fill-mode nil)
 '(column-number-mode 1)
 '(comment-multi-line nil)
 '(filladapt-mode 1)
 '(whitespace-display-mappings
   ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
   '(
     (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
     (newline-mark 10 [182 10]) ; 10 LINE FEED
     (tab-mark 9 [9655 9] [92 9]))) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
 '(whitespace-line-column 80)
 '(whitespace-style '(tab-mark lines-tail))
 '(whitespace-action 'auto-cleanup)
 '(show-trailing-whitespace t))

(defun vendetta-init-autoloads()
  (autoload 'whitespace-mode "whitespace" "Toggle whitespace visualization." t))
;;  (autoload 'verilog-mode "verilog-mode" "Verilog mode" t))
;;  (autoload 'asm-mode "asm-mode" "Assembly mode" t))

(defun vendetta-init-file-extensions()
  (add-to-list 'auto-mode-alist "\\.sh$\\'" 'sh-mode) ;; shell scripts
  (add-to-list 'auto-mode-alist "\\.s$\\" 'asm-mode) ;; unpreprocessed assembly
  (add-to-list 'auto-mode-alist "\\.S$\\" 'asm-mode) ;; c-preprocessed assembly
  (add-to-list 'auto-mode-alist "\\.asm$\\" 'asm-mode) ;; vpu/v0 assembly source
  (add-to-list 'auto-mode-alist "\\.def$\\" 'asm-mode) ;; vpu/v0 assembly header
  (add-to-list 'auto-mode-alist "\\.[ch]$\\" 'c-mode) ;; c source/headers
  (add-to-list 'auto-mode-alist "\\.ino$\\" 'c-mode) ;; arduino projects?
  (add-to-list 'auto-mode-alist "\\.vh$\\" 'c-mode) ;; arduino projects?
;;  (add-to-list 'auto-mode-alist '"\\.[ds]?va?h?$\\" . verilog-mode) ;; verilog
  (add-to-list 'auto-mode-alist "testfixture.verilog" 'verilog-mode)
  (add-to-list 'auto-mode-alist "testfixture.template" 'verilog-mode)
  (add-to-list 'auto-mode-alist "\\.tex$\\" 'tex-mode)) ;; (La)Tex

(defun vendetta-init-hooks()
;;  (add-hook 'focus-in-hook 'redraw-display)
  (add-hook 'whitespace-mode-hook 'vendetta-whitespace-hook)
  (add-hook 'before-save-hook 'whitespace-cleanup)
  ;; (add-hook 'before-save-hook 'vendetta-clean-whitespace)
  ;;  (add-hook 'before-save-hook 'xah-clean-whitespace)
  (add-hook 'before-save-hook 'collapse-blank-lines)
  (add-hook 'emacs-lisp-mode-hook 'vendetta-emacs-lisp-mode-hook)
  ;;  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'prog-mode-hook 'vendetta-prog-mode-hook)
  (add-hook 'c-mode-hook 'vendetta-c-mode-hook)
  (add-hook 'asm-mode-hook 'vendetta-asm-mode-hook)
  (add-hook 'sh-mode-hook 'vendetta-prog-mode-hook)
  (add-hook 'tex-mode-hook 'vendetta-tex-mode-hook)
  (add-hook 'tex-mode-hook 'visual-line-mode)
  (add-hook 'verilog-mode-hook 'vendetta-verilog-mode-hook))

;; NOTE: we limit text display to max 80 columns (set window-margins)
(defun vendetta-theme-init()
  (load vendetta-util-file)
  (load vendetta-prog-mode-file)
  (load vendetta-emacs-lisp-mode-file)
  (load vendetta-c-mode-file)
  (load vendetta-asm-mode-file)
  (load vendetta-tex-mode-file)
  (load vendetta-verilog-mode-file)
  (set-window-margins nil 0 (max (- (window-width) 80) 0))
  (vendetta-init-autoloads)
;;  (vendetta-init-modes)
  (vendetta-init-file-extensions)
  (vendetta-init-hooks))

(vendetta-theme-init)

(provide-theme 'vendetta)

