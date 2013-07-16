;;; mrr-latex.el --- Emacs MRR: Sane setup for LaTeX writers.

(add-hook 'latex-mode-hook 'turn-off-auto-fill)

;; AUCTeX configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)

(setq TeX-output-view-style
      '(("^pdf$" "." "okular %o")
        ("^html?$" "." "google-chrome %o")))

;; This adds the command sage when in LaTeX mode (to invoke type C-C C-c sage)

;;(eval-after-load 'tex
;;  (add-to-list 'TeX-command-list
;;               '("Xelatex"
;;                 "xelatex %s" 'TeX-run-command nil t :help
;;                 "Run Xelatex on Tex file.")))

(provide 'mrr-latex)
