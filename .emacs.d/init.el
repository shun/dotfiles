; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ------------------------------------------------------------------------
;; @ load-path

(setq load-path (append
		 '("~/.emacs.d"
		   "~/.emacs.d/elisp")
		 load-path))

(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))

;; ------------------------------------------------------------------------
;; @ system setting

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; disable backup
(setq backup-inhibited t)

;; no text on scratch
(setq initial-scratch-message "")

;; yes or no -> y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; disable splash screen
(setq inhibit-splash-screen t)

(setq hl-line-face 'underline)

;; hilight current line
;;(global-hl-line-mode 1)

;;; disable menu bar, tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

(defface hlline-face
  '((((class color)
      (background dark))
     (:background "grey10"))
    (((class color)
      (background light))
     (:background "grey10"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
; (setq hl-line-face 'underline) ;
(global-hl-line-mode)


;; ------------------------------------------------------------------------
;; @ auto-install

(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))

;; ------------------------------------------------------------------------
;; @ markdown-mode

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)

;; ------------------------------------------------------------------------
;; @ mode-line with extention

(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.nas\\'" . asm-mode))

;; ------------------------------------------------------------------------
;; @ google ime


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
(setq popwin:popup-window-height '30)

;; ------------------------------------------------------------------------
;; @ direx

(require 'direx)
(push '(direx:direx-mode :position left :width 50 :dedicated t)
    popwin:special-display-config)

(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")

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
(custom-set-variables '(tab-width 4))
(add-hook 'c-mode-hook '(lambda () (setq tab-width 4)))
(add-hook 'c++-mode-hook '(lambda () (setq tab-width 4)))
(add-hook 'asm-mode-hook '(lambda () (setq tab-width 4)))

;; ------------------------------------------------------------------------
;; @ keybind

(define-key global-map (kbd "C-h") 'delete-backward-char)		; delete
(define-key global-map (kbd "C-x b") 'anything)					; anything
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)	; direx

;; ------------------------------------------------------------------------
;; @ face
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "White" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Anonymous Pro"))))
 '(custom-comment-tag ((t (:foreground "cyan"))))
 '(custom-face-tag ((t (:inherit custom-variable-tag))))
 '(dired-directory ((t (:inherit font-lock-function-name-face :foreground "White"))))
 '(font-lock-comment-face ((t (:foreground "Green"))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :foreground "salmon"))))
 '(font-lock-function-name-face ((t (:foreground "Cyan"))))
 '(font-lock-string-face ((t (:foreground "salmon"))))
 '(markdown-header-delimiter-face ((t (:inherit font-lock-function-name-face :foreground "White" :weight bold))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :foreground "white" :weight bold))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :foreground "white"))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :foreground "white"))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :foreground "white"))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :foreground "white"))))
 '(markdown-header-face-5 ((t (:inherit markdown-header-face :foreground "white"))))
 '(markdown-header-face-6 ((t (:inherit markdown-header-face :foreground "white"))))
 '(markdown-header-rule-face ((t (:inherit font-lock-function-name-face :foreground "white" :weight bold))))
 '(minibuffer-prompt ((t (:foreground "cyan")))))

;; ------------------------------------------------------------------------
;; @ setting for Mac

(when (eq system-type 'darwin)
  ;; English
  (set-face-attribute 'default nil
					  :family "Anonymous Pro"	;; font
					  :height 140)				;; font size
  ;; Japanese
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

  (xterm-mouse-mode t)
  (mouse-wheel-mode t)
  (global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
  (global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1))))
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
