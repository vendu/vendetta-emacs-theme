;; -*-no-byte-compile: t; -*-

;;(defun flush-blank-lines (start end)
;;  (interactive "r") (flush-lines "^\\s-*$"
;;                                 start end nil))

(defun strip-trailing-whitespace ()
  "Collapse multiple blank lines from buffer or region into a single blank line"
  (interactive "r")
  (delete-trailing-whitespace))

(defun flush-blank-lines (start end)
  (interactive "r") (flush-lines "^\\s-*$" start end nil))

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

