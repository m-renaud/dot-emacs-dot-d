
(load "~/.emacs.d/vendor/nxhtml/autostart.el")
(setq mumamo-background-colors nil)
;;(setq auto-mode-alist (append '(("/*.\.xslt?$" . nxhtml-mode)) auto-mode-alist))
(add-to-list 'auto-mode-alist '("/*.\.xslt?$" . nxhtml-mode))

(require 'nxhtml-autostart)

;; nxhtml
;; Mumamo is making emacs 23.3 freak out:
(when (and (equal emacs-major-version 24)
	   (equal emacs-minor-version 3))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
		  'syntax-begin-function))
  ;; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
    '(add-to-list 'byte-compile-not-obsolete-vars
		  'syntax-begin-function))

   (eval-after-load "mumamo"
     '(setq mumamo-per-buffer-local-vars
            (delq 'buffer-file-name mumamo-per-buffer-local-vars))))

(setq mumamo-background-colors nil)

(setq auto-mode-alist
      (append '(("/*.\.xslt?$" . nxhtml-mode)) auto-mode-alist))

(add-hook 'nxml-mode-hook
	  '(lambda ()
             (auto-fill-mode -1)
	     (define-key nxml-mode-map "\C-c\C-c"
	       'nxml-complete)))

(add-hook 'nxhtml-mode-hook
	  '(lambda ()
             (auto-fill-mode nil)))

(provide 'mrr-nxhtml)
