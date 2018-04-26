;; -*-no-byte-compile: t; -*-

(defun reverse-list-with-dolist (list)
  "Using dolist, reverse the order of LIST."
  (let (value)  ; make sure list starts empty
    (dolist (element list value)
      (setq value (cons element value)))))

;; this one was shared by abo-abo on stackexchange.com :)

(defun update-all-autoloads ()
  (interactive)
  (let* (generated-autoload-file (concat vendetta-autoload-file)
    (when (not (file-exists-p generated-autoload-file))
      (with-current-buffer (find-file-noselect generated-autoload-file)
	(insert ";;")
	(save-buffer)))
    (mapc #'update-directory-autoloads
	  '("~" "~/.emacs.d/lisp/" "~/.elisp/" "/tmp/")))))

;; whitespace cleaning routines from Xah Lee

;; "Replace repeated blank lines to just 1.
;; Works on whole buffer or text selection, respects `narrow-to-region'.
;; *N is the number of newline chars to use in replacement.
;; If 0, it means lines will be joined.
;; By befault, *N is 2. It means, 1 visible blank line.

;; URL `http://ergoemacs.org/emacs/elisp_compact_empty_lines.html'
;; Version 2017-01-27"

(defun xah-clean-empty-lines (&optional @begin @end @n)
  (interactive
   (if (region-active-p)
       (list (region-beginning) (region-end))
     (list (point-min) (point-max))))
  (when (not @begin)
    (setq @begin (point-min) @end (point-max)))
  (save-excursion
    (save-restriction
      (narrow-to-region @begin @end)
      (progn
        (goto-char (point-min))
        (while (re-search-forward "\n\n\n+" nil "NOERROR")
          (replace-match (make-string (if @n @n 2) 10)))
        (if (re-search-forward "[[:space:]]+" nil "NOERROR")
            (replace-match "\n\n"))))))

;;"Delete trailing whitespace, and replace repeated blank lines to just 1.
;; Only space and tab is considered whitespace here.
;; Works on whole buffer or text selection, respects `narrow-to-region'.
;; Version 2016-10-15"

(defun xah-clean-whitespace (&optional @begin @end)
  (interactive
   (if (region-active-p)
       (list (region-beginning) (region-end))
     (list (point-min) (point-max))))
  (when (not @begin)
    (setq @begin (point-min) @end (point-max)))
  (save-excursion
    (save-restriction
      (narrow-to-region @begin @end)
      (progn
        (goto-char (point-min))
        (while (re-search-forward "[ \t]+\n" nil "NOERROR")
          (replace-match "\n")))
      (xah-clean-empty-lines (point-min) (point-max))
      (progn
        (goto-char (point-max))
        (while (equal (char-before) 32) ; char 32 is space
          (delete-char -1))))))

(defun xah-init-whitespace()
  (progn
    ;;  Make whitespace-mode with very basic background coloring for whitespaces.
    ;; http://ergoemacs.org/emacs/whitespace-mode.html
    (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
    ;; Make whitespace-mode and whitespace-newline-mode use “¶” for end of line
    ;; char and “▷” for tab.
    (setq whitespace-display-mappings
          ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
          '(
            (space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
            (newline-mark 10 [182 10]) ; LINE FEED,
            (tab-mark 9 [9655 9] [92 9]) ; tab
            ))))

