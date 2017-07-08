;;; 003-shell.el --- shell in emacs

;; Copyright (C) 2014 Free Software Foundation, Inc.
;;
;; Author: ShiZilong <def4macro@gmail.com>
;; Maintainer: ShiZilong <def4macro@gmail.com>
;; Created: 27 Jan 2014
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
;;   (require '003-shell)

;;; Code:

(eval-when-compile
  (require 'cl))

;; bash-completion

;; (autoload 'bash-completion-dynamic-complete
;;   "bash-completion"
;;   "BASH completion hook")
;; (add-hook 'shell-dynamic-complete-functions
;;           'bash-completion-dynamic-complete)
;; (add-hook 'shell-command-complete-functions
;;           'bash-completion-dynamic-complete)

;; tab-completion for shell-command

(require 'shell-command)
(shell-command-completion-mode)

;; C-d to kill buffer if process is dead.

(defun comint-delchar-or-eof-or-kill-buffer (arg)
  (interactive "p")
  (if (null (get-buffer-process (current-buffer)))
      (kill-buffer)
    (comint-delchar-or-maybe-eof arg)))

(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map (kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)))


(defun my-shell()
  (interactive)
  (let ((oldbuffer (current-buffer))
        blist)
    (dolist (buff (buffer-list) blist)
      (when (string-match "^\\*shell\\*" (buffer-name buff))
        (setq blist (cons buff blist))))
    (if (car blist)
        (switch-to-buffer-other-window (car blist))
      (progn
        (shell)
        (let ((shellmark (current-buffer)))
          (switch-to-buffer oldbuffer)
          (switch-to-buffer-other-window shellmark))))))
(global-set-key [f1] 'my-shell)

(provide '003-shell)
;;; 003-shell.el ends here
