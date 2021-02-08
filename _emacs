;; -*-no-byte-compile: t; -*-

;;(defconst local-debug-on nil)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst custom-file "~/.emacs.d/custom.el")
(defconst local-lisp-file "~/.emacs.d/vendetta-local.el")
(defconst local-load-path "~/.emacs.d/lisp/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-font-lock-mode t)
 '(help-enable-auto-load nil)
 '(load-dangerous-libraries nil)
 '(load-prefer-newer t)
 '(mouse-wheel-progressive-speed nil)
 '(package-enable-startup nil)
 '(show-paren-mode t))

(defconst local-bytecode-path "~/.emacs.d/bytecode/")
(defconst custom-theme-directory "~/.emacs.d/")
(defconst local-theme-file "vendetta-theme")
(defconst local-theme "vendetta")

(defun local-init()
  (if (file-exists-p custom-file)
      (load custom-file))
  (if (file-exists-p local-lisp-file)
      (load local-lisp-file))
;;  (load local-theme-file)
  (load-theme 'vendetta))

(local-init)

(put 'upcase-region 'disabled nil)

