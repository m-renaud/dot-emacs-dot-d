(defvar yasnippet-root-dir (concat elpa-dir "yasnippet-20130505.2115/"))
(defvar yasnippet-source-file (concat yasnippet-root-dir "yasnippet.el"))
(defvar yasnippet-snippets-dir (concat yasnippet-root-dir "snippets/"))

(add-to-list 'load-path yasnippet-source-file)

(require 'yasnippet)

(setq yas/root-directory yasnippet-snippets-dir)
(yas/load-directory yas/root-directory)
(setq yas-snippet-dirs '("~/.emacs.d/personal/snippets/"))
(yas/global-mode 1)

(provide 'mrr-yasnippet)
