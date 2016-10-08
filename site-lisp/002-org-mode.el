;;; 002-org-mode.el --- Org-mode settings

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
;;   (require '002-org-mode)

;;; Code:

(eval-when-compile
  (require 'cl))

(setq inhibit-splash-screen t)
(transient-mark-mode 1)
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (setq truncate-lines nil)))

;; Htmlize -- highlight code region
(setq org-src-fontify-natively t)
(defadvice htmlize-buffer-1 (around ome-htmlize-buffer-1 disable)
  (rainbow-delimiters-mode -1)
  ad-do-it
  (rainbow-delimiters-mode t))
(defun ome-htmlize-setup ()
  (if (el-get-read-package-status 'rainbow-delimiters)
      (progn
        (ad-enable-advice 'htmlize-buffer-1 'around 'ome-htmlize-buffer-1)
        (ad-activate 'htmlize-buffer-1))))

;; (require 'org-latex)

(setq org-tag-alist '((:startgroup . nil)
                      ("C" . ?c)
                      ("Cpp" . ?d)
                      ("eLisp" . ?e)
                      ("Python" . ?p)
                      ("Perl" . ?l)
                      ("Kernel" . ?k)
                      (:endgroup . nil)
                      ("Easy" . ?1)
                      ("Medium" . ?2)
                      ("Hard" . ?3)))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

;; (setq org-agenda-files (list "~/Org/work.org"
;;                              "~/Org/school.org" 
;;                              "~/Org/home.org"))
(setq org-agenda-files (file-expand-wildcards "~/Org/*.org"))

;; beamer setting
;; (require 'ox-latex)
;; (add-to-list 'org-latex-classes
;;              '("beamer"
;;                "\\documentclass\[presentation\]\{beamer\}"
;;                ("\\section\{%s\}" . "\\section*\{%s\}")
;;                ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
;;                ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

;; HTML5 Presentation templete
(add-to-list 'load-path "~/.emacs.d/site-lisp/org-html5presentation")
(require 'ox-html5presentation)

(provide '002-org-mode)
;;; 002-org-mode.el ends here
