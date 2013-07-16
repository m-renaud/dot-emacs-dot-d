;;; mrr-ui.el --- Emacs MRR: UI optimizations and tweaks.

;; I know who makes it.
(setq inhibit-startup-message 1)

;; Turn off that damn blinking cursor.
(blink-cursor-mode 0)

;; Get rid of those GUIs!
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Set the fringe.
(set-fringe-mode '(4 . 4))

;; Turn off "nice" scrolling.
(setq scroll-margin 0
      scroll-conservatively 0
      scroll-preserve-screen-position nil)

;; Mode line settings...
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; enable y/n answers...
(fset 'yes-or-no-p 'y-or-n-p)

;; Default color theme...
(load-theme 'alkali t)

;; I prefer to split the window in half if possible.
(setq split-width-threshold 140)

;; Paste where point is, I don't want to play whack-a-mole.
(setq mouse-yank-at-point t)

;; Set the default frame font.
(set-frame-font "Monospace-10" t)

(provide 'mrr-ui)
