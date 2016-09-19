;; -*- emacs-lisp -*-

;; turn off splash screen messages

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-echo-area-message t
      inhibit-startup-screen t)

;; no window chrome!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("15835b9d167f29341a0ef018ee05a888621a192588ce31b2b2e9a677252c014c" "67ca766b07ce92be5c0a0111930378d724e9927c890675d4847a774daabc8eaa" "53fc4871f519e34fd25604a5391272527b2dbb4e365b97615615e5bb8c9f16b6" default)))
 '(fci-rule-color "#ECEFF1")
 '(hl-sexp-background-color "#efebe9")
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (yaml-mode visual-regexp undo-tree tuareg smex smartparens slime-company skewer-mode robe restclient rainbow-mode processing-mode pretty-symbols powerline parenface-plus paredit pallet motion-mode markdown-mode magit json-mode js2-refactor ido-ubiquitous highlight haml-mode geiser fringe-helper flymake-ruby flymake-coffee find-file-in-project expand-region elisp-slime-nav diminish company-inf-ruby company-go company-ghc color-theme coffee-mode cider bundler aggressive-indent ag ack-and-a-half ace-jump-mode)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))

;; I have loads of RAM, don't start GC until I've used a decent chunk
;; of it.
(setq gc-cons-threshold 20000000)

;;; utf-8 all the time
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq slime-net-coding-system 'utf-8-unix)

;; I'll be sending files from the command line
(server-start)

;;; local lisp packages for this configuration live here
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

;;; Use Cask for ELPA-style packages
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;; Like /etc/rc.d, all startup filenames begin with a number and get
;;; loaded in numerical order.
(mapc #'load-file (directory-files (concat user-emacs-directory "modules") t "[0-9]*.el"))

;;; PER-USER CUSTOMIZATIONS

;; Here's a hook to load "~/.emacs.d/lisp/<username>-local.el" if such
;; a file exists on the load path.  Place personal extensions to this
;; configuration in that file to avoid merge hassles later.
(let ((per-user-file (concat (user-login-name) "-local.el")))
  (when (locate-library per-user-file) (load per-user-file)))

;; TODO bring in latex customizations from old .emacs

;; TODO bring in org-mode customizations from old .emacs, and add some

;; Mac OS X capture mode scripting for grabbing bits and pieces from
;; outside emacs (via Automator).

;;(setq org-default-notes-file (concat org-directory "/notes.org"))
;;(define-key global-map "<s-E>" 'org-capture)

;; TODO bring in more web development stuff
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#2f2f2f"))))
 '(company-scrollbar-fg ((t (:background "#222222"))))
 '(company-tooltip ((t (:inherit default :background "#1b1b1b"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-common-selection ((t (:inherit font-lock-keyword-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-keyword-face)))))

;; enable line numbers
(global-linum-mode t)

;; load material design theme
(load-theme 'material-light t)
