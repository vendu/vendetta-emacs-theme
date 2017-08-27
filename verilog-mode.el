;; -*-no-byte-compile: t; -*-

;; verilog stuff

;;;###autoload
(defun vendetta-init-verilog-style()
  (custom-set-variables
   '((verilog-align-ifelse nil)
     (verilog-tab-always-indent t)
     (verilog-auto-newline nil)
     (verilog-auto-indent-on-newline t)
     (verilog-indent-level 4)
     (verilog-indent-level-behavioral 4)
     (verilog-indent-level-directive 4)
     (verilog-indent-level-declaration 4)
     (verilog-indent-level-module 4)
     (verilog-cexp-indent 4)
     (verilog-case-indent 4)
     (verilog-indent-begin-after-if nil)
     (verilog-auto-newline t)
     (verilog-auto-delete-trailing-whitespace t)
     (verilog-auto-read-includes t)
     (verilog-auto-template-warn-unused t)
     (verilog-auto-undef t)
     (verilog-auto-unused t)
     (verilog-minimum-comment-distance 16)
     (verilog-indent-begin-after-if t)
     (verilog-auto-lineup t)
     (verilog-align-ifelse t)
     (verilog-auto-endcomments t)
     (verilog-tab-to-comment nil)
     (verilog-date-scientific-format t)
     (verilog-indent-level-module 4))))

;;(defun vendetta-verilog-mode-hook())

(add-to-list 'auto-mode-alist "\\.v\\'" verilog-mode)
(add-to-list 'auto-mode-alist "\\.vh\\'" . verilog-mode)
(add-to-list 'auto-mode-alist "testfixture.verilog" verilog-mode)
(add-to-list 'auto-mode-alist "testfixture.template" verilog-mode)

(defun vendetta-verilog-mode-hook()
  (vendetta-init-verilog-style))

