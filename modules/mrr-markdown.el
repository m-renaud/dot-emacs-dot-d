;;; mrr-markdown.el --- Emacs MRR: markdown-mode configuration.

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'mrr-markdown)
