;;---------------------------------------------------------
;; @load path

(setq load-path (append
                 '("~/.emacs.d")
                 load-path))

;;---------------------------------------------------------
;; @cask

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;---------------------------------------------------------
;; @helm

(require 'helm-config)
(helm-mode 1)

;;---------------------------------------------------------
;; @auto-config

(require 'auto-complete-config)
(ac-config-default)

;;---------------------------------------------------------
;; @appearance

(require 'linum)
(global-linum-mode)
(setq linum-format " %5d ")

;; highlighte bracket
(show-paren-mode 1)

;;---------------------------------------------------------
;; @key bindings

(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-t") 'other-window)               ; toggle other window
(define-key global-map (kbd "<f5>") 'revert-buffer)             ; reload file
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)  ; direx


;; ------------------------------------------------------------------------
;; @ popwin

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(setq popwin:popup-window-position 'bottom)
(setq popwin:popup-window-height '30)

;; ------------------------------------------------------------------------
;; @ setting for Mac

(when (eq system-type 'darwin)
;;---------------------------------------------------------
;; @font

  ;; English
  (set-face-attribute 'default nil
                      :family "Anonymous Pro"   ;; font
                      :height 140)              ;; font size
  ;; Japanese
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font

;;  (xterm-mouse-mode t)
  (mouse-wheel-mode t)
  (global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
  (global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))

;;---------------------------------------------------------
;; @appearance

  (load-theme 'tango-dark)
)


;; ------------------------------------------------------------------------
;; @ setting for Linux
(when (eq system-type 'gnu/linux)
)
