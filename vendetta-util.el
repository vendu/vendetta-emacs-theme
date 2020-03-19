(defun vendetta-clean-whitespace()
  "delete trailing whitespace, trim maximum number of contiguous empty lines to
just one"
  (let ($begin $end)
    (if (region-active-p)
        (setq $begin (region-beginning) $end (region-end))
      (setq $begin (point-min) $end (point-max)))
    (save-excursion
      (save-restriction
        ;;        (narrow-to-region $begin $end)
        (widen)
        (progn
          (goto-char (point-min))
          (while (re-search-forward "[ \t]+\n" nil "move")
            (replace-match "\n")))
        (progn
          (goto-char (point-min))
          (while (re-search-forward "\n\n\n+" nil "move")
            (replace-match "\n\n")))
        (progn
          (goto-char (point-max))
          (while (equal (char-before) 32) ; char 32 is space
            (delete-char -1))))))
  nil)

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
