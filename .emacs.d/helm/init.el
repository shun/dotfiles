;;---------------------------------------------------------
;; @load path

(setq load-path (append
                 '("~/.emacs.d")
                 load-path))

;;---------------------------------------------------------
;; @general setting

(setq inhibit-splash-screen t)
(setq hl-line-face 'underline)
(fset 'yes-or-no-p 'y-or-n-p)
(setq backup-inhibited t)
(setq delete-auto-save-files t)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(icomplete-mode 1)

(setq-default c-basic-offset 4
              c-default-style "linux"
              tab-width 4
              shift-width 4
              indent-tabs-mode t
              )


;;---------------------------------------------------------
;; @cask

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;---------------------------------------------------------
;; @helm

(require 'helm-config)
(helm-mode 1)
(setq helm-buffer-max-length 50)

(setq helm-idle-delay             0.3
      helm-input-idle-delay       0.3
      helm-candidate-number-limit 200)

;;---------------------------------------------------------
;; @auto-complete

(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-comphist t)
(setq ac-use-menu-map t)
(define-key ac-menu-map (kbd "C-n")         'ac-next)
(define-key ac-menu-map (kbd "C-p")         'ac-previous)

;;---------------------------------------------------------
;; @appearance

(require 'linum)
(global-linum-mode)
(setq linum-format " %5d ")

;; highlighte bracket
(show-paren-mode 1)

;;(global-hl-line-mode)
(menu-bar-mode -1)
(column-number-mode t)
(line-number-mode t)
(which-function-mode 1)

;;---------------------------------------------------------
;; @key bindings

(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-t") 'other-window)               ; toggle other window
(define-key global-map (kbd "<f5>") 'revert-buffer)             ; reload file
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)  ; direx
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;; ------------------------------------------------------------------------
;; @ popwin

(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(setq popwin:popup-window-position 'bottom)
(setq popwin:popup-window-height '30)

;; ------------------------------------------------------------------------
;; @ ifdef face

(defun cpp-highlight-if-0/1 ()
  "Modify the face of text in between #if 0 ... #endif."
  (interactive)
  (setq cpp-known-face '(foreground-color . "olive drab")
        cpp-unknown-face 'default
        cpp-face-type 'dark
        cpp-known-writable 't
        cpp-unknown-writable 't)

  (setq cpp-edit-list
        '((#("1" 0 1
             (fontified nil))
           nil
           (foreground-color . "olive drab")
           both nil)
          (#("0" 0 1
             (fontified nil))
           (foreground-color . "olive drab")
           nil
           both nil)))
  (cpp-highlight-buffer t))

(add-hook 'c-mode-common-hook
  (lambda ()
    (cpp-highlight-if-0/1)
    (add-hook 'after-save-hook 'cpp-highlight-if-0/1 'append 'local)))

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

  (load-theme 'tango-dark t)
)


;; ------------------------------------------------------------------------
;; @ setting for Linux

(when (eq system-type 'gnu/linux)
;;---------------------------------------------------------
;; @appearance

  (load-theme 'solarized-dark t)
)
