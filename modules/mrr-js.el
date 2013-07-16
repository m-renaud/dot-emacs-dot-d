;;; mrr-js.el --- Emacs MRR: js-mode configuration.

;(add-to-list 'load-path (concat mrr-vendor-dir "js2-mode/"))
;(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("/*.\.js?$" . js2-mode))


(provide 'mrr-js)
