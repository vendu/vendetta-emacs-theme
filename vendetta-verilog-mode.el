;; verilog stuff

(defun vendetta-init-velho-verilog-style()
  (custom-set-variables
   '(verilog-align-ifelse t)
   '(verilog-indent-tabs-mode nil)
   '(verilog-tab-always-indent t)
   '(verilog-indent-level 4)
   '(verilog-indent-level-module 4)
   '(verilog-indent-level-declaration 4)
   '(verilog-indent-level-behavioral 4)
   '(verilog-indent-level-directive 0)
   '(verilog-cexp-indent 4)
   '(verilog-case-indent 4)
   '(verilog-indent-begin-after-if 0)
   '(verilog-indent-declaration-macros nil)
   '(verilog-indent-lists t)
   '(verilog-auto-newline t)
   '(verilog-auto-indent-on-newline t)
   '(verilog-indent-begin-after-if nil)
   '(verilog-auto-delete-trailing-whitespace t)
   '(verilog-auto-read-includes t)
   '(verilog-auto-template-warn-unused t)
   '(verilog-auto-undef t)
   '(verilog-auto-unused t)
   '(verilog-auto-lineup '(all))
   '(verilog-auto-endcomments t)
   '(verilog-tab-to-comment nil)
   '(verilog-date-scientific-format t)
   '(verilog-minimum-comment-distance 8)
   '(verilog-highlight-grouping-keywords nil)
   '(verilog-highlight-modules nil)
   '(verilog-highlight-includes nil)
   '(verilog-highlight-p1800-keywords nil)))

(defun vendetta-init-velho-verilog-font-lock-style()
  (font-lock-add-keywords 'verilog-mode
                          '(("\\(module\\)" 1 font-lock-block-face)
                            ("\\(endmodule\\)" 1 font-lock-block-face)
                            ("\\(function\\)" 1 font-lock-block-face)
                            ("\\(endfunction\\)" 1 font-lock-block-face)
                            ("\\(config\\)" 1 font-lock-config-face)
                            ("\\(cell\\)" 1 font-lock-block-face)
                            ("\\(initial\\)" 1 font-lock-preprocessor-face)
                            ("\\(assign\\)" 1 font-lock-function-face)
                            ("\\(deassign\\)" 1 font-lock-function-face)
                            ("\\(posedge\\)" 1 font-lock-block-face)
                            ("\\(negedge\\)" 1 font-lock-block-face)
                            ("\\(edge\\)" 1 font-lock-block-face)
                            ("\\(begin\\)" 1 font-lock-block-face)
                            ("\\(if\\)" 1 font-lock-block-face)
                            ("\\(else\\)" 1 font-lock-block-face)
                            ("\\(do\\)" 1 font-lock-block-face)
                            ("\\(begin\\)" 1 font-lock-block-face)
                            ("\\(end\\)" 1 font-lock-block-face)
                            ("\\(mem\\)" 1 font-lock-mamory-face)
                            ("\\(always\\)" 1 font-lock-block-face)
                            ("\\(case\\)" 1 font-lock-block-face)
                            ("\\(casex\\)" 1 font-lock-block-face)
                            ("\\(casez\\)" 1 font-lock-block-face)
                            ("\\(default\\)" 1 font-lock-keyword-face)
                            ("\\(endcase\\)" 1 font-lock-block-face)
                            ("\\(wire\\)" 1 font-lock-wire-face)
                            ("\\(automatic\\)" 1 font-lock-memory-face)
                            ("\\(input\\)" 1 font-lock-memory-face)
                            ("\\(output\\)" 1 font-lock-memory-face)
                            ("\\(reg\\)" 1 font-lock-register-face)
                            ("\\(cell\\)" 1 font-lock-preprocessor-face)
                            ("\\(config\\)" 1 font-lock-preprocessor-face)
                            ("\\(endconfig\\)" 1 font-lock-preprocessor-face)
                            ("\\(defparam\\)" 1 font-lock-macro-face)
                            ("\\(design\\)" 1 font-lock-register-face)
                            ("\\(disable\\)" 1 font-lock-warning-face)
                            ("\\(reg\\)" 1 font-lock-register-face)
                            ("\\(V0*\\)" 1 font-lock-function-face)
                            ("\\(generate\\)" 1 font-lock-preprocessor-face)
                            ("\\(endgenerate\\)" 1 font-lock-preprocessor-face)
                            ("\\(primitive\\)" 1 font-lock-block-face)
                            ("\\(endprimitive\\)" 1 font-lock-block-face)
                            ("\\(specify\\)" 1 font-lock-debug-face)
                            ("\\(endspecify\\)" 1 font-lock-debug-face)
                            ("\\(table\\)" 1 font-lock-macro-face)
                            ("\\(endtable\\)" 1 font-lock-macro-face)
                            ("\\(specify\\)" 1 font-lock-document-face)
                            ("\\(endspecify\\)" 1 font-lock-document-face)
                            ("\\(task\\)" 1 font-lock-thread-face)
                            ("\\(endtask\\)" 1 font-lock-thread-face)
                            ("\\b\\w'`'\\b" 1 font-lock-preprocessor-face))))

(defun vendetta-verilog-mode-hook()
  (vendetta-init-velho-verilog-style)
  (vendetta-init-velho-verilog-font-lock-style)
  (add-hook 'local-write-file-hooks
            (lambda() (untabify (point-min) (point-max)))))
