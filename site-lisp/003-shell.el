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

;; (defun alt-shell-dwim (arg)
;;   "Run an inferior shell like `shell'. If an inferior shell as its I/O
;;  through the current buffer, then pop the next buffer in `buffer-list'
;;  whose name is generated from the string \"*shell*\". When called with
;;  an argument, start a new inferior shell whose I/O will go to a buffer
;;  named after the string \"*shell*\" using `generate-new-buffer-name'."
;;   (interactive "P")
;;   (let* ((shell-buffer-list
;;  	  (let (blist)
;;             (dolist (buff (buffer-list) blist)
;;               (when (string-match "^\\*shell\\*" (buffer-name buff))
;; 	 	(setq blist (cons buff blist))))))
;;          (name (if arg
;; 	 	   (generate-new-buffer-name "*shell*")
;; 	 	 (car shell-buffer-list))))
;;     (shell name)))
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
