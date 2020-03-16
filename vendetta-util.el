;; -*-no-byte-compile: t; -*-

(defun xah-clean-whitespace()
  "Delete trailing whitespace, and replace repeated blank lines into just 1.
Only space and tab is considered whitespace here.
Works on whole buffer or text selection, respects `narrow-to-region'.
Saves the file if it is a file.

URL `http://ergoemacs.org/emacs/elisp_compact_empty_lines.html'
Version 2016-07-30"
  (interactive)
  (save-excursion
	(save-restriction
	  (widen)
	  (progn
		(goto-char (point-min))
		(while (re-search-forward "[ \t]+\n" nil "move")
		  (replace-match "\n")))
	  (progn
		(goto-char (point-min))
		(while (re-search-forward "\n\n+" nil "move")
		  (replace-match "\n")))
	  (progn
		(goto-char (point-max))
		(while (equal (char-before) 32)
		  (delete-char -1)))))
	(message "white spaced cleaned"))

;;(defun flush-blank-lines (start end)
;;  (interactive "r") (flush-lines "^\\s-*$"
;;                                 start end nil))

;;(defun strip-trailing-whitespace ()
;;  "Collapse multiple blank lines from buffer or region into a single blank line"
;;  (interactive "r")
;;  (delete-trailing-whitespace))

;;(defun flush-blank-lines (start end)
;;  (interactive "r") (flush-lines "^\\s-*$" start end nil))

(defun collapse-blank-lines ()
  "Collapse multiple blank lines from buffer or region into a single blank line"
  (interactive "r")
  (save-excursion
	(let (min max)
	  (if (equal (region-active-p) nil)
		  (mark-whole-buffer))
	  (setq min (region-beginning) max (region-end))
	  (replace-regexp "^
\\{2,\\}" "
" nil min max))))

(defun reverse-list-with-dolist (list)
  "Using dolist, reverse the order of LIST."
  (let (value)  ; make sure list starts empty
	(dolist (element list value)
	  (setq value (cons element value)))))

