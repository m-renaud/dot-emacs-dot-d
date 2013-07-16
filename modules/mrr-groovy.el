(add-to-list 'load-path (concat mrr-vendor-dir "Emacs-Groovy-Mode/"))

(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gv$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

(provide 'mrr-groovy)
