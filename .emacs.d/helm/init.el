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

(load-theme 'tango-dark)

;;---------------------------------------------------------
;; @key bindings

(define-key global-map (kbd "C-h") 'delete-backward-char)
