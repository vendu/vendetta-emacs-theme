;; -*-no-byte-compile: t; -*-

;;(defconst local-debug-on nil)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;(defconst custom-file "~/.emacs-custom")
(defconst local-load-path "~/.emacs.d/lisp/")
(defconst local-lisp-file "vendetta-local")

(custom-set-variables
 '(package-enable-startup nil)
 '(load-prefer-newer t)
 '(mouse-wheel-progressive-speed nil)
 '(global-font-lock-mode t)
 '(transient-mark-mode t)
 '(show-paren-mode t)
 '(help-enable-auto-load nil)
 '(load-dangerous-libraries nil))

(defun personal-init()
  (add-to-list 'load-path local-load-path))
  ;;  (load-file local-init-file-path)
;;  (if (file-exists-p custom-file)
;;      (load local-lisp-file)))

(defconst local-bytecode-path "~/.emacs.d/bytecode/")
(defconst local-theme "vendetta")
(defconst local-theme-path "~/.emacs.d/themes/")
(defconst local-theme-dir "~/.emacs.d/themes/vendetta/")
(defconst local-theme-file "vendetta-theme")
(defconst local-theme "vendetta")

(defun local-init()
  (add-to-list 'load-path local-theme-path)
  (add-to-list 'load-path local-theme-dir)
;;  (if (file-exists-p custom-file)
;;      (load custom-file))
  (load local-theme-file))

(local-init)

(personal-init)

(put 'upcase-region 'disabled nil)
