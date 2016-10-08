;;; 012-common-lisp.el --- Common Lisp stuf

;; Copyright (C) 2014 Free Software Foundation, Inc.
;;
;; Author: ShiZilong <def4macro@gmail.com>
;; Maintainer: ShiZilong <def4macro@gmail.com>
;; Created: 31 Aug 2014
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
;;   (require '012-common-lisp)

;;; Code:

(eval-when-compile
  (require 'cl))

(add-to-list 'load-path "~/.emacs.d/elpa/slime-20140826.39")
(require 'slime-autoloads)
(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup '(slime-fancy))

(provide '012-common-lisp)
;;; 012-common-lisp.el ends here
