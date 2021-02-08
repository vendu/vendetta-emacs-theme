(defconst local-bytecode-path "~/.emacs.d/bytecode/")
(defconst local-theme "vendetta")
(defconst local-theme-path "~/.emacs.d/themes/")
(defconst local-theme-dir "~/.emacs.d/themes/vendetta-theme/")
(defconst local-theme-file "vendetta-theme")
(defconst local-theme "vendetta")

(defun local-init()
  (add-to-list 'load-path local-theme-path)
  (add-to-list 'load-path local-theme-dir)
  (if (file-exists-p custom-file)
      (load custom-file))
  (load local-theme-file))

(local-init)

