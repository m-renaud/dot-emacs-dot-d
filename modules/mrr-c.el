;;; mrr-c.el --- Emacs MRR: cc-mode configuration.
;; This file contains configuration for c-style languages.

;;; Correct indentation for template arguments.
(defun c++-template-args-cont (langelem)
  "Control indentation of template parameters handling the special case of '>'.
Possible Values:
0   : The first non-ws character is '>'. Line it up under 'template'.
nil : Otherwise, return nil and run next lineup function."
  (save-excursion
    (beginning-of-line)
    (if (re-search-forward "^[\t ]*>" (line-end-position) t)
        0)))

;;;; Set 
;;(add-hook 'c++-mode-hook
;;          (lambda ()
;;            (c-set-offset 'template-args-cont
;;                          '(c++-template-args-cont c-lineup-template-args +))))


(defun mrr-c-mode-common-hook ()
  (flymake-mode t)
  (add-hook 'before-save-hook 'whitespace-cleanup nil t)
  (hs-minor-mode t)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 2)
  (setq tab-width 2)
  (c-set-offset 'innamespace 0)
  (cppcm-reload-all))

(add-hook 'c-mode-common-hook 'mrr-c-mode-common-hook)

(setq c-offsets-alist
      '((substatement-open . c-indent-one-line-block)
        (inline-open . c-indent-one-line-block)
	(arglist-intro . +)
        (statement-cont . +)
	(arglist-close . 0)
	(brace-list-close . c-lineup-close-paren)
        (template-args-cont . (c++-template-args-cont c-lineup-template-args +))))


;; Some preferences for makefiles.
(defun mrr-makefile-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 4))

(add-hook 'makefile-mode-hook 'mrr-makefile-mode-hook)


;; Set major mode for CMake files.
(setq auto-mode-alist
      (append '(("CMakeLists.txt" . cmake-mode)) auto-mode-alist))


;; Make the compilation window vanish after 0.5 seconds,
;; unless there is an error.
(setq compilation-window-height 8)
(setq compilation-finish-functions
     (lambda (buf str)
       (if (string-match "exited abnormally" str)
	   ;; There were errors.
	   (message "compilation errors, press C-x ` to visit")
	 ;; No errors, make the compilation window go away in 0.5 seconds.
	 (run-at-time 0.5 nil 'delete-windows-on buf)
	 (message "NO COMPILATION ERRORS!"))))




(defun my-c-mode-font-lock-if (limit)
  "Comment out everything between #if 0 and #else/#endif."
  (save-restriction
    (widen)
    (save-excursion
      (goto-char (point-min))
      (let ((depth 0) token comment-start comment-start-depth if-stack)
        (cl-flet ((start-comment
                ()
                ;; Check if a comment can be started now and if so, do it.
                (when (null comment-start)
                  (setq comment-start (match-end 0))
                  (setq comment-start-depth depth)))

               (finish-comment
                ()
                ;; Check if a comment is being closed off now, if so, close it
                ;; and do the font trickery.
                (when (and
                       (not (null comment-start))
                       (= depth comment-start-depth))
                  (c-put-font-lock-face
                   comment-start
                   (match-beginning 0)
                   'font-lock-comment-face)
                  (setq comment-start nil))))

          (while (re-search-forward
                  "^\\s-*#\\s-*\\(if\\|else\\|endif\\)"
                  limit
                  'move)
            (setq token (match-string 1))

            (cond ((string= token "if")
                   (setq depth (1+ depth))
                   (cond ((looking-at "\\s-+0") ;; Found an #if 0
                          (push 0 if-stack)
                          (start-comment))
                         ((looking-at "\\s-+1") ;; Found an #if 1
                          (push 1 if-stack))
                         (t
                          (push 2 if-stack)))) ;; Found an #if cond

                  ((string= token "else")
                   (let ((stack-top (pop if-stack)))
                     (cond ((= 0 stack-top) ;; Closing an #if 0
                            (finish-comment)
                            (push 1 if-stack))
                           ((= 1 stack-top) ;; Closing an #if 1
                            (start-comment)
                            (push 0 if-stack))
                           (t ;; Closing any other cond
                            (push stack-top if-stack)))))

                  ((string= token "endif")
                   (finish-comment)
                   (setq depth (1- depth))
                   (pop if-stack))))

	  (when (and comment-start (> depth 0))
	    (c-put-font-lock-face
	     comment-start (point)
	     'font-lock-comment-face))))))
  nil)


;; Add font face modifications for c++11 keywords and some other operators.
(add-hook
 'c-mode-common-hook
 (lambda ()
   (font-lock-add-keywords
    nil
    '(
      (my-c-mode-font-lock-if (0 font-lock-comment-face prepend))
      ("\\bconstexpr\\b" . font-lock-keyword-face)
      ("\\boverride\\b" . font-lock-keyword-face)
      ("\\bfinal\\b" . font-lock-keyword-face)
      ("\\bnoexcept\\b" . font-lock-keyword-face)
      ("\\bstatic_assert\\b" . font-lock-keyword-face)
      ("\\bnullptr\\b" . font-lock-constant-face)
      ("&" . font-lock-negation-char-face)
      ("|" . font-lock-negation-char-face)))))






;;; SmartTabsMode
(smart-tabs-insinuate 'c 'c++ 'java)

(provide 'mrr-c)

