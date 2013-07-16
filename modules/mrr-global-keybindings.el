(global-unset-key "\C-z")
(global-unset-key (kbd "C-x f"))
(global-unset-key (kbd "C-x i"))

(global-set-key (kbd "C-M-d") 'mrr-kill-whole-word)
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-\\") 'toggle-selective-display)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "M-a") 'eval-region)
(global-set-key (kbd "M-h") 'bury-buffer)
(global-set-key (kbd "M-i") 'mrr-ido-goto-symbol)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x f f") 'ffap)
(global-set-key (kbd "C-x f k") 'ffap-copy-string-as-kill)
(global-set-key (kbd "C-x f t") 'tags-search)
(global-set-key (kbd "C-x i f") 'insert-file)
(global-set-key (kbd "C-x i h") 'html-basic-template)
(global-set-key (kbd "C-x i m") 'c-command-line-main)
(global-set-key (kbd "C-x i s") 'c-systems-programming-headers)
(global-set-key (kbd "<s-tab>") 'other-window)
(global-set-key "\C-x\M-c" 'compile)
(global-set-key "\C-x\M-f" 'set-selection-to-filename)
(global-set-key "\C-x\M-k" 'mrr-kill-buffer-other-window)
(global-set-key "\C-x\M-o" 'occur)
(global-set-key "\C-x\M-r" 'revert-buffer)
(global-set-key "\C-x\M-t" 'transpose-function-args)
(global-set-key "\C-x\M-v" 'vi-mode)
(global-set-key "\C-[\C-[b" 'mrr-bikeride-outline)       ; esc-esc b
(global-set-key "\C-[\C-[c" 'clone-indirect-buffer)      ; esc-esc c
(global-set-key "\C-[\C-[n" 'mrr-insert-full-name)       ; esc-esc n
(global-set-key "\C-[\C-[s" 'server-start)               ; esc-esc s
(global-set-key "\C-[\C-[u" 'browse-url)                 ; esc-esc u
(global-set-key "\C-[\C-[v" 'vi-mode)
(global-set-key "\C-[\C-[w" 'fk)                         ; esc-esc w
(global-set-key "\C-[\C-[y" 'iy-insert-year-month-date)  ; esc-esc y
(global-set-key [f4] 'undo)
(global-set-key [home] 'beginning-of-buffer)             ; instead of beginning-of-line
(global-set-key [end] 'end-of-buffer)			 ; instead of end-of-line
(global-set-key [C-return] 'mrr-30-dash-newline)
(global-set-key [M-return] 'mrr-50-dash-newline-date)
(global-set-key [Scroll_Lock] 'mrr-scratch-buffer)
(global-set-key [pause] 'mrr-shell-buffer)
(global-set-key [print] 'mrr-open-config)
(global-set-key [key-20] 'sb-scratch-buffer)
(global-set-key (kbd "C-c h") 'hide-lines)

(global-set-key "\M-N" 'page-delimiter-selector)
(global-set-key "\M-\[" 'backward-page-to-top)
(global-set-key "\M-\]" 'forward-page-to-top)

(global-set-key "\M-n" 'senator-next-tag)
(global-set-key "\M-p" 'senator-previous-tag)

(global-set-key (kbd "C-M-v") 'vi-mode)
(global-set-key (kbd "C-M-s") 'speedbar)

(global-set-key
 (kbd "C-c C-g")
 '(lambda ()
    (interactive)
    (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))


(provide 'mrr-global-keybindings)
