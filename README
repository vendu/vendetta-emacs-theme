To use this theme, make sure you have [local.el](https://github.com/vendu/vendetta-emacs-theme/blob/master/local.el) somewhere in your load path such
as under the ~/.emacs.d/lisp/ directory.

Here is my ~/.emacs configuration file

----8<----

;; -*-no-byte-compile: t; -*-

;;(defconst local-debug-on nil)
(defconst custom-file "~/.emacs-custom")
(defconst local-load-path "~/.emacs.d/lisp/")
(defconst local-lisp-file "local")

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
  (add-to-list 'load-path local-load-path)
  ;;  (load-file local-init-file-path)
  (load local-lisp-file))

(personal-init)

----8<----

Screenshots
-----------

![c-mode screenshot #1](https://github.com/vendu/vendetta-emacs-theme/blob/master/img/vendetta-c-mode-001.png)
![c-mode screenshot #2](https://github.com/vendu/vendetta-emacs-theme/blob/master/img/vendetta-c-mode-002.png)

