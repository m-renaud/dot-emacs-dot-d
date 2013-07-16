;; mrr-editor.el
;;
;; Enhancements to the editing experience...

;; Some nice electric settings...
(electric-pair-mode 0)
(electric-indent-mode t)
(electric-layout-mode t)

;; Don't autosave files.
(setq auto-save-interval 0)

;; Don't show region.
(setq transient-mark-mode nil)

;; Never ring the bell.
(setq ring-bell-function #'ignore)

;; Don't save desktops right now.
(desktop-save-mode 0)

;; Turn on auto-fill for some modes.
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'html-mode-hook 'turn-off-auto-fill)

;; Much much better buffer switching.
(iswitchb-mode 1)

;; unzip .gz files automatically
(auto-compression-mode 1)

;; Display the current line number in the mode-line
(custom-set-faces
 '(linum ((t (:inherit (shadow default) :foreground "#DDDDDD")))))


;; Give buffers unique names when there are 2 with the same name.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*") ; Don't muck with special buffers


;; Saveplace remembers your location in a file when saving files.
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "saveplace"))
(setq-default save-place t)


;; Savehist keeps track of some history.
(setq savehist-additional-variables
      '(search ring regexp-search-ring)
      savehist-autosave-interval 60
      savehist-file (concat user-emacs-directory "savehist"))
(savehist-mode t)


;; Time-stamps
;; When there's "Time-stamp: <>" in the first 10 lines of the file.
(setq time-stamp-active t
      ;; Check first 10 buffer lines for Time-stamp: <>
      time-stamp-line-limit 10
      time-stamp-format "%04y-%02m-%02d %02H:%02M:%02S (%U)")

(add-hook 'write-file-hooks 'time-stamp)

;; Show me where the matching parenthesies are, don't wait and highlight it.
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)


(eval-after-load "tramp"
  '(progn
     ;; Keep in mind known issues with zsh - see emacs wiki
     (setq tramp-default-method "ssh")))

;; Auto-completion in minibuffer.
(icomplete-mode t)

(set-default 'imenu-auto-rescan t)

;; Enabled Advanced Editing Commands.
(put 'upcase-region 'disabled nil)        ; C-x C-u
(put 'downcase-region 'disabled nil)      ; C-x C-l
(put 'narrow-to-region 'disabled nil)     ; C-x n n

;; Avoid accidentally nuking Emacs.
(put 'save-buffers-kill-emacs 'disabled t)
(put 'save-buffers-kill-terminal 'disabled t)

;; Much better than dabbrev-expand.
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Never cycle completions.
(setq completion-cycle-threshold 0)

;; Add support for php in speedbar.
(eval-after-load "speedbar" '(speedbar-add-supported-extension ".xsl"))

;; Load the `custom-file'
(load-file custom-file)
(load-file mrr-functions-file)


;; Use google-chrome as the default browser.
(defun browse-url-google-chrome (url &optional new-window)
  "Ask the google chrome WWW browser to load URL.
Default to the URL around or before point.  The strings in
variable `browse-url-google-chrome-arguments' are also passed to
google chrome."
  (interactive (browse-url-interactive-arg "URL: "))
  (setq url (browse-url-encode-url url))
  (let* ((process-environment (browse-url-process-environment)))
    (apply 'start-process
	   (concat "google-chrome " url) nil
	   browse-url-google-chrome-program
	   (append
	    browse-url-chromium-arguments
	    (list url)))))

(defcustom browse-url-google-chrome-program
  (let ((candidates '("google-chrome")))
    (while (and candidates (not (executable-find (car candidates))))
      (setq candidates (cdr candidates)))
    (or (car candidates) "google-chrome"))
  "The name by which to invoke google chrome."
  :type 'string
  :version "24.1"
  :group 'browse-url)


;; Configure whitespace style.
(setq whitespace-style
      '(face tabs spaces trailing lines space-before-tab newline
             empty space-mark tab-mark newline-mark))


(provide 'mrr-editor)
