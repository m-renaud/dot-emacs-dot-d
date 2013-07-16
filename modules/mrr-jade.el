(add-to-list 'load-path (concat mrr-vendor-dir "jade-mode/"))

(require 'jade-mode)
(require 'stylus-mode)

(eval-after-load "speedbar" '(speedbar-add-supported-extension ".jade"))

(provide 'mrr-jade)
