;; -*-no-byte-compile: t; -*-

;; verilog stuff

(defun vendetta-init-zero-verilog-style()
  (setq verilog-align-ifelse t)
  (setq verilog-tab-always-indent t)
  (setq verilog-auto-newline nil)
  (setq verilog-auto-indent-on-newline t)
  (setq verilog-indent-begin-after-if nil)
  (setq verilog-auto-delete-trailing-whitespace t)
  (setq verilog-auto-read-includes t)
  (setq verilog-auto-template-warn-unused t)
  (setq verilog-auto-undef t)
  (setq verilog-auto-unused t)
  (setq verilog-auto-lineup nil)
  (setq verilog-auto-endcomments nil)
  (setq verilog-tab-to-comment nil)
  (setq verilog-date-scientific-format t)
  (setq verilog-indent-level 4)
  (setq verilog-indent-level-behavioral 4)
  (setq verilog-indent-level-directive 4)
  (setq verilog-indent-level-declaration 4)
  (setq verilog-indent-level-module 4)
  (setq verilog-cexp-indent 4)
  (setq verilog-case-indent 4)
  (setq verilog-indent-begin-after-if 4)
  (setq verilog-indent-declaration-macros nil)
  (setq verilog-indent-lists t)
  (setq verilog-minimum-comment-distance 8))

(defun vendetta-init-verilog-style()
  (vendetta-init-zero-verilog-style))

(add-to-list 'auto-mode-alist "\\.v\\'" 'verilog-mode)
(add-to-list 'auto-mode-alist "\\.vh\\'" 'verilog-mode)
(add-to-list 'auto-mode-alist "testfixture.verilog" 'verilog-mode)
(add-to-list 'auto-mode-alist "testfixture.template" 'verilog-mode)

(defun vendetta-verilog-mode-hook()
  (vendetta-init-verilog-style))

