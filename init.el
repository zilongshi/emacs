(setq user-full-name "ShiZilong")
(setq user-mail-address "zilongshi@gmail.com")
(show-paren-mode t)
;; (column-number-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-fill-column 60)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
;; (global-font-lock-mode t)
(setq frame-title-format "%b")
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-scroll-bar-mode nil)
(blink-cursor-mode 0)
(mouse-avoidance-mode 'exile)
(setq mouse-avoidance-threshold 10)
;; (setq-default cursor-type 'bar)
(global-set-key (kbd "C-SPC") nil)
;;; Display Time
(display-time-mode 1)
;;; (setq display-time-24hr-format t)
(setq display-time-day-and-date t)


;;; High Light Setting
(require 'hl-line)
(global-hl-line-mode 1)
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))


;;; Set Path
(add-to-list 'load-path 
	     "/usr/share/emacs/site-lisp")

;; (setq load-path (cons (expand-file-name "~/.emacs.d/elpa") load-path))

;;; use ELPA package management 
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; shell setting
(load-file "~/.emacs.d/site-lisp/003-shell.el")

;; flyspell setting
;; (dolist (hook '(text-mode-hook))
;;   (add-hook hook (lambda () (flyspell-mode 1))))
;; (dolist (hook '(change-log-mode-hook log-edit-mode-hook))
;;   (add-hook hook (lambda () (flyspell-mode -1))))
(setq-default ispell-program-name "aspell")
(ispell-change-dictionary "american" t)

;; hippie-expand setting
(global-set-key "\M- " 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

;; ido setting
(require 'ido)
(ido-mode t)

;; smex setting
(load-file "~/.emacs.d/site-lisp/009-smex.el")

(load-file "~/.emacs.d/site-lisp/010-move.el")

;; undo tree setting
;; (load-file "~/.emacs.d/elpa/undo-tree-20160922.853/undo-tree.el")
(require 'undo-tree)
(global-undo-tree-mode)

;; linum setting
(load-file "~/.emacs.d/site-lisp/007-linum.el")
;; deactive linum-mode
(defun deactivate-linum ()
  (linum-mode 0))
(add-hook 'org-mode-hook 'deactivate-linum)
(add-hook 'shell-mode-hook 'deactivate-linum)
(add-hook 'text-mode-hook 'deactivate-linum)

;; Fullscreen binding 
(load-file "~/.emacs.d/site-lisp/006-fullscreen.el")

;; comment setting
(load-file "~/.emacs.d/site-lisp/004-comment.el")

;; copy line
(load-file "~/.emacs.d/site-lisp/005-copy.el")

;; emacs outlook settin
(load-file "~/.emacs.d/site-lisp/001-outlook.el")

;;; use popup menu for yas-choose-value
(require 'popup)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20160827.649/dict")
(ac-config-default)

;;; yasnippet setting
(require 'yasnippet)
(yas-global-mode 1)
(add-to-list 'yas/root-directory
             "~/.emacs.d/snippets")

;; org-mode setting
;; (load-file "~/.emacs.d/site-lisp/002-org-mode.el")

;; LaTeX and AUCTeX setting
;; (load-file "~/.emacs.d/site-lisp/008-LaTeX.el")

;;; cedet setting
(load-file "~/.emacs.d/site-lisp/minimial-cedet-config.el")

;;; programming language mode settings
(load-file "~/.emacs.d/site-lisp/012-programming-mode.el")
