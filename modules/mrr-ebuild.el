;; Colour ebuilds with `shell-script-mode'.
(add-to-list 'auto-mode-alist '("/*.\.ebuild?$" . shell-script-mode))

(defun insert-ebuild-skeleton ()
  "Insert a minimal ebuild skeleton at point."
  (interactive)
  (insert-file "/home/matt/.emacs.d/files/ebuild-skeleton.ebuild"))

(defun insert-ebuild-make-skeleton()
  "Insert a Makefile package rule to create a tar.gz file for source."
  (interactive)
  (insert-file "/home/matt/.emacs.d/files/make-package-skeleton"))

(provide 'mrr-ebuild)


