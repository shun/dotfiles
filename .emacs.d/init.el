; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ------------------------------------------------------------------------
;; @ load-path

(setq load-path (append
		 '("~/.emacs.d"
		   "~/.emacs.d/elisp")
		 load-path))

;; ------------------------------------------------------------------------
;; @ system setting

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; disable backup
(setq backup-inhibited t)

;; no text on scratch
(setq initial-scratch-message "")

;; ------------------------------------------------------------------------
;; @ auto-install

(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))

;; ------------------------------------------------------------------------
;; @ anything
(when (require 'anything nil t)
  (setq
   anything-idle-delay 0.3
   anything-input-idle-delay 0.2
   anything-candidate-number-limit 100
   anything-quick-update t
   anything-enable-shortcuts 'alphabet)

  (when (require 'anything-config nil t)
	(setq anything-su-or-sudo "sudo"))

  (require 'anything-match-plugin nil t)

  (when (and (executable-find "cmigemo")
			 (require 'migemo nil t))
	(require 'anything-migemo nil t))

  (when (require 'anything-complete nil t)
	(anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completetion nil t)

  (when (require 'auto-install nil t)
	(require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
	(descbinds-anything-install)))


;; ------------------------------------------------------------------------
;; @ popwin

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(setq popwin:popup-window-position 'bottom)

;; ------------------------------------------------------------------------
;; @ appearance

; linenumber
(require 'linum)
(global-linum-mode)
(setq linum-format " %5d ")

;; highlite bracket
(show-paren-mode 1)


; TAB setting
(setq-default tab-width 4)

;; ------------------------------------------------------------------------
;; @ keybind

(define-key global-map (kbd "C-h") 'delete-backward-char)		; delete
(define-key global-map (kbd "C-x b") 'anything)					; anything


;; ------------------------------------------------------------------------
;; @ face
(custom-set-faces
 '(custom-comment-tag			((t (:foreground "cyan"))))
 '(custom-face-tag				((t (:inherit custom-variable-tag))))
 '(font-lock-comment-face		((t (:foreground "Green"))))
 '(font-lock-function-name-face	((t (:foreground "brightcyan"))))
 '(font-lock-string-face		((t (:foreground "brightred"))))
 '(minibuffer-prompt			((t (:foreground "cyan")))))

;; ------------------------------------------------------------------------
;; @ setting for Mac

(when (eq system-type 'darwin)
  (xterm-mouse-mode t)
  (mouse-wheel-mode t)
  (global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
  (global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1))))
  
