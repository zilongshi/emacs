;; -*- Emacs-Lisp -*-

;; Setting English Font
;(set-face-attribute
; 'default nil :font "DejaVu Sans Mono 12")
;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))
;; Setting Chinese Font
;(dolist (charset '(kana han symbol cjk-misc bopomofo))
;  (set-fontset-font (frame-parameter nil 'font)
;		    charset
;		    (font-spec :family "SimSun" :size 12)))
;(set-default-font "DejaVu Sans Mono-12")
;(set-face-font 'menu "DejaVu Sans Mono-12")
;(set-frame-font "Monaco-12")
;(set-fontset-font (frame-parameter nil 'font)
;		  'han '("Microsoft-YaHei" . "unicode-bmp"))
;(set-default-font "DejaVu Sans Mono :pixelsize=12")
;(set-fontset-font (frame-parameter nil 'font)
;		  'han (font-spec :family "Microsoft-YaHei" :size 12))
;(set-fontset-font (frame-parameter nil 'font)
;		  'symbol (font-spec :family "Microsoft-YaHei" :size 12))
;(set-fontset-font (frame-parameter nil 'font)
;		  'cjk-misc (font-spec :family "Microsoft-YaHei" :size 12))
;(set-fontset-font (frame-parameter nil 'font)
;		  'bopomofo (font-spec :family "Microsoft-YaHei" :size 12))
;(set-default-font "DejaVu Sans Mono-12")
;(set-fontset-font (frame-parameter nil 'font)
;		  'unicode '("DejaVu Sans Mono-12" . "unicode-bmp"))
;(set-fontset-font (frame-parameter nil 'font)
;		  'han '("SimSun" . "unicode-bmp"))
;(set-default-font "DejaVu Sans Mono-12")
;; (set-frame-font "DejaVu Sans Mono-10")
;; (set-frame-font "Consolas-13")
;; (set-frame-font "Comic Sans MS-13")
;; (set-frame-font "Lucida Grande-12")
(set-fontset-font "fontset-default"
		  'han '("SimSun" . "unicode-bmp"))
