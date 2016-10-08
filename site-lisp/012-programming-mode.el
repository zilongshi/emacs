;;; 012-programming-mode.el --- programming language mode settings

;; Copyright (C) 2014 Free Software Foundation, Inc.
;;
;; Author: ShiZilong <def4macro@gmail.com>
;; Maintainer: ShiZilong <def4macro@gmail.com>
;; Created: 21 Oct 2014
;; Version: 0.01
;; Keywords

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require '013-programming-mode)

;;; Code:

(eval-when-compile
  (require 'cl))

;; irony-mode setting
(defun company-my-backend (command &optional arg &rest ignored)
  (pcase command
    (`prefix (when (looking-back "foo\\>")
               (match-string 0)))
    (`candidates (list "foobar" "foobaz" "foobarbaz"))
    (`meta (format "This value is named %s" arg))))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's asynchronous function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)

;; common-lisp setting
(add-to-list 'load-path "~/.emacs.d/elpa/slime-20161006.1520")
(require 'slime-autoloads)
(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup '(slime-fancy))

;; C Perl mode setting
;; cperl-mode is preferred to perl-mode                                        
;; (defalias 'perl-mode 'cperl-mode)
;; (add-to-list 'auto-mode-alist '("\\.t\\'" . perl-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ep$" . web-mode))

;; emacs-plsense setting
;; (require 'plsense)
;; Key binding
;; (setq plsense-popup-help-key "C-:")
;; (setq plsense-display-help-buffer-key "M-:")
;; (setq plsense-jump-to-definition-key "C->")
;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "plsense")
;; Do setting recommemded configuration
;; (plsense-config-default)

;; Perl Tidy Elisp

;; markdown-mode setting
;; (autoload 'markdown-mode "markdown-mode"
;;   "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; PDE setting
;; (add-to-list 'load-path "~/.emacs.d/pde")
;; (load "pde-load")
;; (defun pde-perl-mode-hook ()
;;   (abbrev-mode t)
;;   (add-to-list 'cperl-style-alist
;;                '("PDE"
;;                  ;; (cperl-auto-newline                         . nil)
;;                  (cperl-brace-offset                         . 0)
;;                  (cperl-close-paren-offset                   . -4)
;;                  (cperl-continued-brace-offset               . 0)
;;                  (cperl-continued-statement-offset           . 4)
;;                  (cperl-extra-newline-before-brace           . nil)
;;                  (cperl-extra-newline-before-brace-multiline . nil)
;;                  (cperl-indent-level                         . 4)
;;                  (cperl-indent-parens-as-block               . t)
;;                  (cperl-label-offset                         . -4)
;;                  (cperl-merge-trailing-else                  . t)
;;                  (cperl-tab-always-indent                    . t)))
;;   (cperl-set-style "PDE"))

;; python-mode setting
;; enable Elpy
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(elpy-use-ipython)

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; lua-mode setting
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; Javascript development environment settings
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)
(require 'react-snippets)
;; jade-mode settings
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl\\'" . sws-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide '013-programming-mode)
;;; 013-programming-mode.el ends here