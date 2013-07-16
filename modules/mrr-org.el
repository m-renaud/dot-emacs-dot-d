;;; mrr-org.el --- Emacs MRR: Org mode config
;;

(require 'org-install)
(setq org-directory "~/org")
(setq org-agenda-include-diary t)
(setq org-startup-indented t)
(setq org-log-done 'time)
(setq org-enforce-todo-dependencies t)
(setq org-use-speed-commands t)

;; Key Bindings
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;;
(setq org-log-done 'time)

(setq org-agenda-files
      '("~/Dropbox/org/work.org"
        "~/Dropbox/org/school.org"
        "~/Dropbox/org/home.org"
        "~/Dropbox/org/cxx.org"))

;;(setq org-todo-keywords
;;      '((sequence "TODO(t)" "ADVICE(a)" "|" "DONE(d)")
;;        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
;;        (sequence "|" "CANCELED(c)")))

(setq org-todo-keywords
      '((sequence "UPCOMING(u)" "TODO(t)"  "STARTED(s)" "|" "DONE(d)" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("TODO"      . (:foreground "#FFFFFF"       :weight bold))
        ("MAYBE"     . (:foreground "#EEEEEE"       :weight bold))
        ("DONE"      . (:foreground "#00FF00"       :weight bold))
        ("CANCELLED" . (:foreground "forest green"              ))
        ("TASK"      . (:foreground "#CCCCCC"       :weight bold))))

(custom-set-variables
 '(org-priority-faces
   '((65 . "#F14D4F")
     (66 . "#FFCCCC")
     (67 . "#EEBBBB"))))

(provide 'mrr-org)
