;;; mrr-programming.el --- Emacs MRR: prog-mode configuration

(require 'imenu)
(semantic-mode)
(global-ede-mode)


;; Some local keybindings for cedet-mode
;; Originally from Emacs 23, some of these do not work.
;; Not used anymore, see mrr-prog-mode-hook below...
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c+" 'semantic-tag-folding-show-block)
  (local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
  (local-set-key "\C-c\C-c+" 'semantic-tag-folding-show-all)
  (local-set-key "\C-c\C-c-" 'semantic-tag-folding-fold-all)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-c\C-r" 'semantic-symref))


(defun mrr-prog-mode-hook ()
  "Default coding hook, useful with any programming language."
  (setq indent-tabs-mode nil)
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key [return] 'newline-and-indent)
  (subword-mode 1)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-symref-symbol)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle))


;; In Emacs 24 programming major modes generally derive
;; from a common mode named prog-mode
(add-hook 'prog-mode-hook 'mrr-prog-mode-hook)

(semantic-mode 1)

(setq-default auto-complete-mode t)
(custom-set-variables
     '(help-at-pt-timer-delay 0.0)
     '(help-at-pt-display-when-idle '(flymake-overlay)))

;; Use semantic for `speedbar'.
(require 'semantic/sb)

(provide 'mrr-programming)
