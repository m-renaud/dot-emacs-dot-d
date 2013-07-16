;; Automatically apply `shell-script-mode' to PKGBUILDs and *.install files.
(add-to-list 'auto-mode-alist '("PKGBUILD" . shell-script-mode))
(add-to-list 'auto-mode-alist '("/*.\.install$" . shell-script-mode))

(provide 'mrr-arch-linux)
