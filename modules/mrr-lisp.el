;; Highlight defsystem from ASDF.
(add-hook
      'lisp-mode-hook
      (lambda ()
        (auto-complete-mode t)))

(eval-after-load "slime"
  '(progn
     (setq inferior-lisp-program "sbcl")
     (add-to-list 'load-path "~/.emacs.d/elpa/slime-20130626.1151/")
     (add-to-list 'load-path "~/.emacs.d/elpa/slime-20130626.1151/contrib")
     (slime-setup '(slime-repl))
     (slime-setup '(slime-asdf))))


(eval-after-load "speedbar" '(speedbar-add-supported-extension ".el"))
(eval-after-load "speedbar" '(speedbar-add-supported-extension ".lisp"))
(eval-after-load "speedbar" '(speedbar-add-supported-extension ".asd"))


(provide 'mrr-lisp)
