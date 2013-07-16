(add-hook 'nxml-mode-hook
	  '(lambda ()
	     (define-key nxml-mode-map "\C-c\C-c"
	       'nxml-complete)))

(provide 'mrr-nxml)
