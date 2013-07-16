;; enable AUCTeX

;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)

(defun tab-and-align()
  "Indent and align table."
  (interactive)
  (LaTeX-indent-line)
  (align-current))


(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; With AUCTeX LaTeX mode.
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; With Emacs latex mode.
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook
          (lambda()
            (local-set-key (kbd "TAB") 'tab-and-align)))

;; make AUCTeX aware of multi-file documents
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; start in PDF mode
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (setq TeX-master 'dwim)
             (TeX-PDF-mode-on)))

;; outline mode
;;(defun turn-on-outline-minor-mode () (outline-minor-mode 1))
;;(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
;;(setq outline-minor-mode-prefix "\C-c\C-o")



;; Ref-TeX
;(require 'tex-site)
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
;; (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq LaTeX-eqnarray-label "eq"
      LaTeX-equation-label "eq"
      LaTeX-figure-label "fig"
      LaTeX-table-label "tab"
      LaTeX-myChapter-label "chap"
      TeX-auto-save t
      TeX-newline-function 'reindent-then-newline-and-indent
      TeX-electric-sub-and-superscript t
      TeX-parse-self t
      reftex-vref-is-default t
      reftex-toc-split-windows-horizontally t
      reftex-toc-split-windows-fraction 0.5
      TeX-style-path
      '("style/" "auto/"
	"/usr/share/emacs21/site-lisp/auctex/style/"
	"/var/lib/auctex/emacs21/"
	"/usr/local/share/emacs/site-lisp/auctex/style/")
      LaTeX-section-hook
      '(LaTeX-section-heading
	LaTeX-section-title
	LaTeX-section-toc
	LaTeX-section-section
	LaTeX-section-label))


(provide 'mrr-auctex)
