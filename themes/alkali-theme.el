;;; alkali-theme.el --- colour theme for GNU Emacs 24

;; Copyright (C) 2011 Matt Renaud

;; Author: Matt Renaud <mrenaud92@gmail.com>
;; URL: http://github.com/mrenaud92
;; Version: 1.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;
;;; Installation:
;;
;; Put this theme in a folder that is on `custom-theme-load-path'
;; and you're good to go!
;;
;; Don't forget that the theme is for Emacs 24!!!
;;
;;; Code

(deftheme alkali "The Alkali color theme")

(custom-theme-set-faces
 'alkali

 ;;; basic colouring
 `(default ((t (:background "#050505" :foreground "#F8F8FF"))))
 `(cursor ((t (:background "#999999" :foreground "black"))))
 `(region ((t (:background "dark slate gray" :foreground "#93AAF2"))))
 `(mode-line ((t (:background "dark cyan" :foreground "black"))))
 `(mode-line-inactive ((t (:background "black" :foreground "dark cyan" :italic t))))
 `(fringe ((t (:background "#222222"))))
 `(minibuffer-prompt ((t (:background "#000000" :foreground "aquamarine"))))

 ;;; compilation


 ;;; Font Locks - explicitly set bold and italic so they won't be left
 ;;;              over from another theme if one was loaded...
 `(font-lock-builtin-face
   ((t (:foreground "#52dcff"     :bold nil :italic nil))))

 `(font-lock-comment-delimiter-face
   ((t (:foreground "cyan"  :bold t :italic nil))))
;   ((t (:foreground "#8a7aed"  :bold t :italic nil))))
   
 `(font-lock-comment-face
   ((t (:foreground "cyan"     :bold t :italic t))))
;   ((t (:foreground "#8a7aed"     :bold nil :italic t))))
 
 `(font-lock-constant-face
   ((t (:foreground "#C17DF1"     :bold nil :italic nil))))

 `(font-lock-function-name-face
   ((t (:foreground "#07A5A8"     :bold nil :italic nil))))

 `(font-lock-keyword-face
   ((t (:foreground "#F14D4F"     :bold t   :italic nil))))

 `(font-lock-negation-char-face
   ((t (:foreground "#BBBBBB"     :bold t   :italic nil))))

 `(font-lock-preprocessor-face
   ((t (:foreground "#F660AB"     :bold t   :italic nil))))

 `(font-lock-string-face
   ((t (:foreground "#7ECF53"     :bold t :italic nil))))
;   ((t (:foreground "#92E683"     :bold nil :italic nil))))

 `(font-lock-type-face
   ((t (:foreground "#FFB774"     :bold t   :italic nil))))

 `(font-lock-variable-name-face
   ((t (:foreground "#93AAF2"     :bold nil :italic nil))))

 `(font-lock-warning-face
   ((t (:foreground "blue"        :bold nil :italic nil))))


 ;;; org-mode
 `(org-level-1  ((t (:foreground "#FFB774"     :bold nil :italic nil))))
 `(org-level-2  ((t (:foreground "#7ECF53"     :bold nil :italic nil))))
 `(org-level-3  ((t (:foreground "#C17DF1"     :bold nil :italic nil))))
 `(org-level-4  ((t (:foreground "#07A5A8"     :bold nil :italic nil))))
 `(org-level-5  ((t (:foreground "#F14D4F"     :bold nil :italic nil))))
 `(org-level-6  ((t (:foreground "slate blue"  :bold nil :italic nil))))
 `(org-todo     ((t (:foreground "#EEEEEE"     :bold t   :italic nil))))
 `(org-tag      ((t (:foreground "#FFB774"     :bold t   :italic nil))))

 `(org-agenda-structure
   ((t (:foreground "#888888" :bold t   :italic nil :underline t))))
 `(org-agenda-current-time
   ((t (:foreground "#52dcff" :bold nil :italic t))))
 `(org-agenda-date
   ((t (:foreground "#C17DF1" :bold nil :italic nil))))
 `(org-agenda-date-today
   ((t (:foreground "#EEEEEE" :bold t   :italic nil))))
 `(org-agenda-calendar-event
   ((t (:foreground "#7ECF53" :bold nil :italic nil))))
 `(org-agenda-diary
   ((t (:foreground "#5EAF33" :bold nil :italic nil))))
 `(org-scheduled
   ((t (:foreground "#F14D4F" :bold nil :italic nil))))
 `(org-upcoming-deadline
   ((t (:foreground "#F14D4F" :bold nil :italic nil))))
 `(org-time-grid
   ((t (:foreground "#BBBBBB" :bold nil :italic nil))))

 `(org-date
   ((t (:foreground "#52dcff" :bold nil :italic nil))))
 `(org-sexp-date
   ((t (:foreground "#52dcff" :bold nil :italic nil))))

 `(org-link
   ((t (:foreground "#52dcff" :bold t   :italic nil :underline t))))

 `(org-warning
   ((t (:foreground "#F14D4F" :bold t   :italic nil))))
 
 ;;; isearch faces
 `(isearch ((t (:background "black" :foreground "hot pink" :bold t))))
 `(lazy-highlight ((t (:background "#3A3333" :foreground "#93AAF2"))))

 `(link ((t (:foreground "cyan" :underline t))))
 `(link-visited ((t (:foreground "cyan" :underline t))))
 `(button ((t (:foreground "#cfc67e" :underline t))))
 `(header-line ((t (:background "#2a0a38" :foreground "#b48fff")))))

(provide-theme 'alkali)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; alkali-theme.el  ends here
