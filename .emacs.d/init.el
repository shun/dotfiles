; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ------------------------------------------------------------------------
;; @ load-path

(setq load-path (append
				 '("~/.emacs.d"
				   "~/.emacs.d/elisp")
				 load-path))

;; ------------------------------------------------------------------------
;; @ auto-install
(when (require 'auto-install nil t)
	(setq auto-install-directory "~/.emacs.d/elisp/")
	(auto-install-update-emacswiki-package-name t)
	(auto-install-compatibility-setup))

;; ------------------------------------------------------------------------
;; @ sudo-ext

;(server-start)
;(require 'sudo-ext)

;; ------------------------------------------------------------------------
;; @ ruby debuging with emacs

;;(autoload 'rubydb "rubydb3x" "run rubydb on program file in buffer" t)


;; ------------------------------------------------------------------------
;; @ popwin

;;(require 'popwin)
;;(setq display-buffer-function 'popwin:display-buffer)

;; ------------------------------------------------------------------------
;; @ appearance

;; no text on scratch
(setq initial-scratch-message "")

;;; display row and col nunber
;(line-number-mode 1)
;(column-number-mode 1)

;; highlite bracket
(show-paren-mode 1)

;; hide splash screen
(setq inhibit-startup-message t)

;; bgcolor and fgcolor
;(set-background-color "black")
;(set-foreground-color "white")

; frame size
;;(set-frame-width (selected-frame) 140)
;;(set-frame-height (selected-frame) 40)

; linenumber
(require 'linum)
(global-linum-mode)
(setq linum-format " %5d ")

; TAB setting
(setq-default tab-width 4)
(setq c-default-style
	'((java-mode . "java") (other . "linux")))
(setq c-basic-offset 4)
(add-hook 'html-mode-hook
	(lambda()
		(setq sgml-basic-offset 4)
		(setq indent-tabs-mode t)))

;; frame transparency
;(set-frame-parameter (selected-frame) 'alpha '(85 50))

;; hide toolbar
(tool-bar-mode -1)

;; disable backup
(setq backup-inhibited t)

;; don't distinguish catial letter
;(setq completion-ignore-case t)
;(setq read-file-name-completion-ignore-case t)

;; partial matching completion
;(partial-completion-mode t)

;; ------------------------------------------------------------------------
;; @ font

(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

(when (eq system-type 'darwin)
	(set-face-attribute 'default nil
	:family "Melo"
	:height 300))

;	(set-fontset-font
;	 nil 'japanese-jisx0208
;	 (font-spec :family "Hiragino Kaku Gothic ProN" :size 16)))

(when (eq system-type 'gnu/linux)
	(set-face-attribute 'default nil
	:family "Anonymous Pro"
	:height 160)

;	(set-fontset-font
;	 nil 'japanese-jisx0208
;	 (font-spec :family "DejaVu Sans Mono" :size 16)))
	)
;; ------------------------------------------------------------------------
;; @ keybind

;; original keybind
;; C-j
;; C-k
;; C-l
;; C-;
;; C-h						help

;;(define-key global-map (kbd "C-j") 'backward-char)							; ←
;;(define-key global-map (kbd "C-k") 'next-line)								; ↓
;;(define-key global-map (kbd "C-l") 'forward-char)								; →
;;(Define-key global-map (kbd "C-;") 'previous-line)							; ↑
;; 
(define-key global-map (kbd "C-h") 'delete-backward-char)						; delete
(define-key global-map (kbd "M-?") 'help-for-help)								; help
(define-key global-map (kbd "C-u") 'undo)										; undo
(define-key global-map (kbd "C-c i") 'indent-region)							; indent
(define-key global-map (kbd "C-c C-i") 'hippie-expand)							; 
(define-key global-map (kbd "C-c ;") 'comment-dwim)								; comment out
(define-key global-map (kbd "M-C-g") 'grep)										; grep
(define-key global-map (kbd "C-[ M-C-g") 'goto-line)							;  goto line
;;
(global-set-key (kbd "C-x C-b") 'buffer-menu)
;(global-set-key (kbd "C-_") nil)												; disable C-_
(global-set-key [f1] 'help-for-help)											; help
(global-set-key (kbd "C-m") 'newline-and-indent)								; 
;;(setq kill-whole-line t)														; kill line including line feed

;; scroll one line at a time (less "jumpy" than defaults)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))								;; one line at a time
(setq mouse-wheel-progressive-speed nil)										;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)												;; scroll window under mouse
(setq scroll-step 1)															;; keyboard scroll one line at a time

;; ------------------------------------------------------------------------
;; @ reopen as root 

(defun reopen-with-sudo ()
  "Reopen current buffer-file with sudo using tramp."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (find-alternate-file (concat "/sudo::" file-name))
      (error "Cannot get a file name"))))

(defun th-rename-tramp-buffer ()
  (when (file-remote-p (buffer-file-name))
    (rename-buffer
     (format "%s:%s"
             (file-remote-p (buffer-file-name) 'method)
             (buffer-name)))))

(add-hook 'find-file-hook
          'th-rename-tramp-buffer)

(defadvice find-file (around th-find-file activate)
  "Open FILENAME using tramp's sudo method if it's read-only."
  (if (and (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat "File "
                             (ad-get-arg 0)
                             " is read-only.  Open it as root? ")))
      (th-find-file-sudo (ad-get-arg 0))
    ad-do-it))

(defun th-find-file-sudo (file)
  "Opens FILE with root privileges."
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))

;; ------------------------------------------------------------------------
;; @ color
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-comment-tag ((t (:foreground "cyan"))))
 '(custom-face-tag ((t (:inherit custom-variable-tag))))
 '(font-lock-comment-face ((t (:foreground "Green"))))
 '(font-lock-function-name-face ((t (:foreground "brightcyan"))))
 '(font-lock-string-face ((t (:foreground "brightred"))))
 '(minibuffer-prompt ((t (:foreground "cyan")))))
