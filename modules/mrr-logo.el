(autoload 'logo-mode "logo")
(setq auto-mode-alist (append '(("\\.lgo?$" . logo-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.nlogo?$" . logo-mode)) auto-mode-alist))
(setq logo-binary-name "/usr/bin/logo")
(setq logo-tutorial-path "~/.emacs.d/logo/")
(setq logo-help-path "~/.emacs.d/logo/helpfiles/")
(setq logo-info-file "~/.emacs.d/logo/docs/ucblogo.info")

(provide 'mrr-logo)
