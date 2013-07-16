;;
;; Matt Renaud's Emacs24 Config
;; mrenaud92@gmail.com

(defvar mrr-dir (file-name-directory load-file-name)
  "The root dir of my emacs config.")

(defvar mrr-modules-dir (concat mrr-dir "modules/")
  "This directory contains all of the built-in MRR module.")

(defvar mrr-vendor-dir (concat mrr-dir "vendor/")
  "This directory has Emacs Lisp packages that are not yet available in
package managers.")

(defvar mrr-personal-dir (concat mrr-dir "personal/")
  "Directory to keep personal configuration options in.")

(defvar elpa-dir (concat mrr-dir "elpa/")
  "Directory where elpa files reside.")

(defvar theme-dir (concat mrr-dir "themes/")
  "Directory where themes reside.")

;; Tell emacs where to look for stuff...
(add-to-list 'load-path mrr-modules-dir)
(add-to-list 'load-path mrr-vendor-dir)
(add-to-list 'load-path mrr-personal-dir)
(add-to-list 'load-path elpa-dir)

(add-to-list 'custom-theme-load-path theme-dir)

;; Add all subdirectories of ~/.emacs.d/elpa to the load path.
(let ((default-directory elpa-dir))
  (normal-top-level-add-subdirs-to-load-path))

;; Config changes made through the customize UI will be store here
(setq custom-file (concat mrr-personal-dir "custom.el"))
(setq mrr-functions-file (concat mrr-personal-dir "mrr-functions.el"))


;; Package manager.
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (mapc
   (lambda (repo) (add-to-list 'package-archives repo) t)
   '(("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))


;; Google Chrome plugin to allow editing of text fields with Emacs.
(require 'edit-server)
(edit-server-start)


;; Core configuration.
(require 'mrr-core)
(require 'mrr-editor)
(require 'mrr-erc)
(require 'mrr-ui)
(require 'mrr-global-keybindings)

;; Programming and markup configuration.
(require 'mrr-arch-linux)
(require 'mrr-auctex)
(require 'mrr-programming)
(require 'mrr-c)
(require 'mrr-ebuild)
;(require 'mrr-groovy)
;(require 'mrr-haskell)
;(require 'mrr-jade)
(require 'mrr-js)
(require 'mrr-latex)
(require 'mrr-lisp)
(require 'mrr-markdown)
;(require 'mrr-nxhtml)
;(require 'mrr-nxml)
(require 'mrr-org)
;(require 'mrr-scala)
(require 'mrr-zsh)

;; Utilities
(require 'ps-ccrypt)
;(require 'mrr-yasnippet)
