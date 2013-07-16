;; mrr-core.el --- Core config

;; Bring in the functions from Common Lisp.
(require 'cl)
(require 'cl-lib)

;; Setup the spell checker.
(eval-after-load "ispell"
  '(progn
     (setq ispell-program-name "aspell")
     (setq ispell-list-command "list")
     (setq ispell-dictionary "english")))

;; Turn off auto-fill globally, only enable for specific modes.
(auto-fill-mode -1)

;; Don't make backup files.
(setq make-backup-files nil)

;; Allow local variables for setting modes...
(setq safe-local-variable-values
      '((eval haskell-mode)
        (eval conf-mode)
        (eval shell-script-mode)))

(provide 'mrr-core)
