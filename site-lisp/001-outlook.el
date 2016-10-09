;;; 001-outlook.el --- Emacs outlook

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
;;   (require '001-outlook)

;;; Code:

(eval-when-compile
  (require 'cl))

;; frame size setting
(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if (display-graphic-p)
      (progn
        ;; use 120 char wide window for largeish displays
        ;; and smaller 80 column windows for smaller displays
        ;; pick whatever numbers make sense for you
        (if (> (x-display-pixel-width) 1280)
            (add-to-list 'default-frame-alist (cons 'width 120))
          (add-to-list 'default-frame-alist (cons 'width 80)))
        ;; for the height, subtract a couple hundred pixels
        ;; from the screen height (for panels, menubars and
        ;; whatnot), then divide by the height of a char to
        ;; get the height we want
        (add-to-list 'default-frame-alist
                     (cons 'height (/ (- (x-display-pixel-height) 200)
                                      (frame-char-height)))))))
(set-frame-size-according-to-resolution)

;;; Font Setting
(set-frame-font "DejaVu Sans Mono-9")
;; (set-frame-font "Consolas-12")
;; ;; (set-frame-font "Comic Sans MS-13")
;; ;; (set-frame-font "Lucida Grande-12")
(set-fontset-font "fontset-default"
		  'han '("SimSun" . "unicode-bmp"))

;; google C style
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(load-file "~/.emacs.d/site-lisp/google-c-style.el")
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
	   (and (not current-prefix-arg)
		(member major-mode '(emacs-lisp-mode lisp-mode
						     clojure-mode    scheme-mode
						     haskell-mode    ruby-mode
						     rspec-mode      python-mode
						     c-mode          c++-mode
						     objc-mode       latex-mode
						     plain-tex-mode))
		(let ((mark-even-if-inactive transient-mark-mode))
		  (indent-region (region-beginning) (region-end) nil))))))

;;; Color-Theme
(load-theme 'solarized-dark t)

;;; Set by hand
;; (load-file "~/.emacs.d/site-lisp/color-theme-blackboard.el")
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-blackboard)))

;; (require 'color-theme-autoload "color-theme-autoloads")
;; (setq color-theme-is-global t)
;; (color-theme-robin-hood)

;;; Powerline setting
(require 'powerline)
(powerline-default-theme)

(provide '001-outlook)
;;; 001-outlook.el ends here
