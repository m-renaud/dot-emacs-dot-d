;; Most of this is just me screwing around with elisp...

(defun mrr-scratch-buffer ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun mrr-shell-buffer ()
  (interactive)
  (switch-to-buffer "*shell*"))

(defun mrr-open-config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


(defun iy-insert-year-month-date ()
  "insert the date in the format yy/mm/dd at point"
  (interactive)
    ; from time-stamp.el defun time-stamp-yy/mm/dd
    (insert (format-time-string "%Y-%m-%d")))


(defun mrr-kill-whole-word()
  "Kills the whole word currently under the cursor, not just to the end or beginning"
  (interactive)
  (forward-word 1)
  (backward-kill-word 1))

(defun mrr-kill-buffer-other-window ()
  "Function that kills the non-active buffer in the other window of the
current frame.  This is useful when a help menu is displayed but not active.
Instead of switching to the help buffer, killing it, switching back to the
buffer in which you were working and calling delete-other-windows, simply
call this function.

Written By: Matt Renaud
Date: 10/07/09"
  (interactive)
  (if (equal (length (window-list nil nil nil)) 2)
      (progn
	(kill-buffer (other-window -1))
	(other-window -1)
	(delete-other-windows))
    (error "Incorrect number of windows: 2 required.")))


;; Replaced by timestamp hook in
(defun xx_idate (start end)
  "insert the Time-stamp string"
  (interactive "r")
    ; (kill-region start end)
    (insert "Time-stamp: <>"))

(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
	 (1+ (current-column))))))

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
	      (hs-toggle-hiding)
	    (error t))
	  (hs-show-all))
    (toggle-selective-display column)))

;; written by Richard Sharman
(defun set-selection-to-filename ()
 "If running under X, set the primary X selection to the filename of
the current buffer (nil if there is no filename associated with the
buffer).  Otherwise, save it in the kill ring.
Under Windows this saves it in the clipboard (as long as variable
interprogram-cut-function is set)."
 (interactive)
 ;; (x-set-selection 'PRIMARY (buffer-file-name))
 (or (buffer-file-name)
     (error "There is no filename associated with this buffer"))
 (if (eq window-system 'x)
     (x-set-selection 'PRIMARY (buffer-file-name))
   (kill-new  (buffer-file-name)))
 (message (buffer-file-name))
 (kill-new (buffer-file-name)))


(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun decrement-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1- (string-to-number (match-string 0))))))

(setq last-kbd-macro
   "\C-s[0-9]\C-x")


;;; page delimiters - from uncle roland
(defun forward-page-to-top ()
  "Move page boundary to the top of the screen."
  (interactive)
  (forward-page)
  (recenter 1))

(defun backward-page-to-top ()
  "Move page boundary to the top of the screen."
  (interactive)
  (backward-page)
  (recenter 1))



; This is used for command backward-page, called by backward-page-to-top
(set-variable 'page-delimiter "^[0-9]") ; default


(setq page-delimiters-commented '(
""
"'^\f'           (emacs default)"
"'//m         '  (c++ sections)"
"'template'      (c++ templates)"
"'/**!'          (doxygen comments)"
"'^#if 0'        (#if 0)"
"'^---'          (for FAQ style)"
"'^[0-9]'        (for calendar style)"
"'^sub '         (for perl)"
"'^function '    (for php)"
"'^(defun '      (for lisp)"
"()              (for shell)"
"'  '            (blank line)"
"//c"
"'/*m'           (css)"
))

(setq page-delimiters '(
""
"^\f"
"//m"
"template"
"/[*][*]!"
"^#if 0"
"^---"
"^[0-9]"
"^sub "
"^function"
"^(defun "
"()"
"\n\n"
"//c"
"/[*]m"
))

(defun page-delimiter-selector (&optional arg)
  "select page delimiter
   This sets the variable page-delimiter and works in conjunction with
   defun backward-page-to-top and forward-page-to-top.
   - delimiter is local to the buffer
   - using prefix arg sets it to be the default - NYI
"
  (interactive)
;  (interactive "p")
;    (if arg
;	(set (make-local-variable 'page-delimiter) (nth arg page-delimiters))
      (save-window-excursion
	(delete-other-windows)
	(let ((pop-up-windows t))
	  (pop-to-buffer "*page delimiters*"))
	(insert (concat "Current page delimiter is '" page-delimiter "'\n"))
	(insert "Select a page delimiter")
	(setq num 1)
	(while (< num (length page-delimiters))
	  (insert (format "\n%2d %s" num (nth num page-delimiters-commented)))
	  (setq num (1+ num)))
	(other-window -1)
	(setq tst (read-string "select one (control G to cancel):"))
	(kill-buffer "*page delimiters*")
	(set (make-local-variable 'page-delimiter)
	     (nth (string-to-number tst) page-delimiters))))

(provide 'mrr-functions)
