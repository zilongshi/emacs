;;; 011-mojo.el --- mmm-mode config for Mojolicious::Lite perl file.

;; Copyright (C) 2014 Free Software Foundation, Inc.
;;
;; Author: ShiZilong <def4macro@gmail.com>
;; Maintainer: ShiZilong <def4macro@gmail.com>
;; Created: 28 Jun 2014
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
;;   (require '011-mojo)

;;; Code:

(eval-when-compile
  (require 'cl))

(require 'mmm-auto)
(require 'mmm-compat)
(require 'mmm-vars)

(setq mmm-global-mode 'maybe)

(global-set-key "\M-p" 'mmm-parse-buffer)

                                        ;(mmm-set-major-mode-preference 'cperl-mode 'perl-mojo)
(defun mmm-perl-mojo-get-mode (delimiter)
  (let ((filename (substring delimiter 3 nil)))
    (or (assoc-default filename auto-mode-alist #'string-match)
        'fundamental-mode
        (signal 'mmm-no-matching-submode nil))))

(mmm-add-group 'perl-mojo '((perl-mojo-blocks
                             :match-submode mmm-perl-mojo-get-mode
                             :front "^@@ \\(.+\\)$"
                             :front-offset (end-of-line 1)
                             :back "\\(^@@\\|\\'\\)"
                             :back-offset (beginning-of-line -1)
                             :save-matches t
                             :delimiter-mode nil
                             :end-not-begin nil
                             :face mmm-code-submode-face
                             )))

(mmm-add-mode-ext-class 'perl-mode "\\.pl$" 'perl-mojo)
(setq mmm-submode-mode-line-format "~M[~m]")
(setq mmm-submode-decoration-level 2)

(provide '011-mojo)
;;; 011-mojo.el ends here
