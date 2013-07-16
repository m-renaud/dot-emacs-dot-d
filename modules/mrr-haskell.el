;;; mrr-haskell.el --- Emacs MRR: Nice config for Haskell programming.

(defun mrr-haskell-mode-hook ()
  (mrr-prog-mode-hook)
  (subword-mode t)
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation))

(add-hook 'haskell-mode-hook 'mrr-haskell-mode-hook)

(provide 'mrr-haskell)
