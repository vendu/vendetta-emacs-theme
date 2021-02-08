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
          (goto-char (begin))
          (while (re-search-forward "[ \t]+\n" nil "move")
            (replace-match "\n")))
        (progn
          (goto-char (begin))
          (while (re-search-forward "\n\n\n+" nil "move")
            (replace-match "\n\n")))
        (progn
          (goto-char (end))
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

;; thanks to jordonbiondo from github for the 80-column editor functions :)

(defun edit-80-columns-mode()
  "Set the right window margin so the edittable space is only 80 columns."
  (interactive)
  (let ((margins (window-margins)))
    (if (or (car margins) (cdr margins))
        (set-window-margins nil 0 0)
      (set-window-margins nil 0 (max (- (window-width) 80) 0)))))

(defun edit-80-columns-mode-balanced()
  "Set both window margins so the editable space is only 80 columns."
  (interactive)
  (let ((margins (window-margins)))
    (if (or (car margins) (cdr margins))
        (set-window-margins nil 0 0)
      (let* ((change (max (- (window-width) 80) 0))
             (left (/ change 2))
             (right (- change left)))
        (set-window-margins nil left right)))))
