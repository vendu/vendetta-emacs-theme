;; -*-no-byte-compile: t; -*-

(defconst local-bytecode-path "~/.emacs.d/bytecode/")
(defconst local-theme "vendetta")
(defconst local-theme-path "~/.emacs.d/themes/")
(defconst local-theme-dir "~/.emacs.d/themes/vendetta/")
(defconst local-theme-file "vendetta-theme")
(defconst local-theme "vendetta")

(defun local-add-load-dir(path)
  normal-top-level-add-to-load-path(path))

(defun local-add-load-tree(path)
  (let* lisp-dir 'path)
  (setq default-directory 'lisp-dir)
  (orig-load-path load-path)
  (setq load-path (cons lisp-dir nil))
  (normal-top-level-add-subdirs-to-load-path)
  (nconc load-path orig-load-path))

(defun local-add-tree-to-load-path(path)
  (if (or (eq path nil)
	  (eq path ""))
      ((local-add-load-tree local-path)
       (local-add-load-tree local-theme-path))
    (local-add-load-tree path)))

(defun local-init()
  (add-to-list 'load-path local-theme-path)
  (add-to-list 'load-path local-theme-dir)
  (if (file-exists-p custom-file)
      (load custom-file))
  (message "loading theme %s" local-theme-file)
  (load local-theme-file))

(local-init)

