(setq make-backup-files nil) ; prevent the creation of backup files everywhere
(electric-indent-mode t)
(setq auto-save-interval 0)
(setq transient-mark-mode nil)
(setq visible-bell 1)
(iswitchb-mode 1)
(auto-compression-mode 1)

;; Give buffers unique names when there are 2 with the same name...
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; For remote ssh access
(require 'tramp)
(setq tramp-default-method "ssh")

;; Avoid accidental nuking...
(put 'save-buffers-kill-emacs 'disabled t)
(put 'save-buffers-kill-terminal 'disabled t)

;; I know who makes this wonderful piece of software
(setq inhibit-startup-message 1)

(blink-cursor-mode 0)

(scroll-bar-mode 0)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(semantic-mode)

(defun mrr-prog-mode-hook ()
  "Default coding hook, useful with any programming language."
  (setq indent-tabs-mode nil)
  (local-set-key [return] 'newline-and-indent)
  (subword-mode 1))

(add-hook 'prog-mode-hook 'mrr-prog-mode-hook)

(global-semantic-highlight-func-mode t)


(defun mrr-c-mode-common-hook ()
  (add-hook 'before-save-hook 'whitespace-cleanup nil t)
  (hs-minor-mode t)
  (setq c-basic-offset 2)
  (c-set-offset 'innamespace 0))

(add-hook 'c-mode-common-hook 'mrr-c-mode-common-hook)

(setq c-offsets-alist
      '((statement-cont . 0)
	(template-args-cont . c-lineup-dont-change)
	(substatement-open . 0)
	(arglist-intro . +)
	(arglist-close . 0)
	(brace-list-close . c-lineup-close-paren)
	(topmost-intro-cont . c-lineup-dont-change)
	))

;; Some preferences for makefiles...
(defun mrr-makefile-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 4))

(add-hook 'makefile-mode-hook 'mrr-makefile-mode-hook)

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))


(global-set-key "\C-x\C-b" 'electric-buffer-list)
