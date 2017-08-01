(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;;; Base Emacs settings ;;;;
(setq-default
 scroll-conservatively most-positive-fixnum
 scroll-margin 5
 ;; show-trailing-whitespace t
 tab-width 4)
(fset 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)

;; set default font
(set-face-attribute 'default nil
                    :family "DejaVu Sans Mono for Powerline"
                    :foundry "PfEd"
                    :height 127
                    :weight 'bold)


;;;; Dashboard ;;;;
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-items '((bookmarks)
						(projects)
						(recents . 5)
						(agenda . 5)))


;; Title
(setq dashboard-banner-logo-title "Good to see ya bruh ;)")

;; Banner
(setq dashboard-startup-banner 'logo)
;; (setq dashboard-startup-banner "path/to/image")


;;;; Tabbar ;;;;
;; (require 'tabbar)
;; (tabbar-mode)


;;;; Flycheck ;;;;
(add-hook 'after-init-hook #'global-flycheck-mode)


;;;; Company ;;;;
(require 'company)
(setq company-begin-commands '(self-insert-command)
      company-echo-delay 0
      company-idle-delay 0.3
      company-minimum-prefix-length 2
	  company-require-match nil
	  company-tooltip-align-annotations t)

(add-hook 'after-init-hook 'global-company-mode)


;;;; Simpleclip ;;;;
(require 'simpleclip)
(simpleclip-mode 1)


;;;; EVIL mode ;;;;
(global-evil-leader-mode)
(evil-mode 1)
(key-chord-mode 1)

;; EVIL key mappings
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; EVIL Leader
(evil-leader/set-leader ",")
(evil-leader/set-key
 "cc" 'evilnc-comment-or-uncomment-lines
 "y" 'simpleclip-copy
 "p" 'simpleclip-paste
 "le" 'flycheck-list-errors
 "dd" 'delete-other-windows
 "dw" 'delete-window
 "book" 'bookmark-bmenu-list
)


;;;; Org Mode ;;;;
(add-to-list 'load-path "~/.emacs.d/plugins/evil-org")
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))


;;;; Spaceline ;;;;
(require 'spaceline-config)

(setq powerline-default-separator 'wave)
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
(spaceline-toggle-major-mode-on)
(spaceline-toggle-minor-modes-off)
(spaceline-spacemacs-theme)


;;;; Ido ;;;;
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
    (define-key ido-completion-map (kbd "M-n") 'ido-next-match)
    (define-key ido-completion-map (kbd "M-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(define-key evil-normal-state-map (kbd "C-f") 'find-file)
(define-key evil-normal-state-map (kbd "C-b") 'ido-switch-buffer)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)


;;;; Projectile ;;;;
(projectile-mode 1)
(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)


;;;; Android Mode ;;;;
(require 'android-mode)
(custom-set-variables '(android-mode-sdk-dir "~/opt/android"))


;;;; Linum-relative ;;;;
;; (require 'linum-relative)
;; (linum-relative-global-mode)
;; nlinum

;;;; Beaty corner ;;;;
;; (load-theme 'monokai t)
;; (load-theme 'dracula t)

;; Theme
(setq spacemacs-theme-comment-bg nil)
(setq spacemacs-theme-comment-italic t)
(load-theme 'spacemacs-dark t)

;; Indent
;; (global-aggressive-indent-mode 1)

;; (add-hook 'prog-mode-hook #'whitespace-turn-on)
;; (add-hook 'text-mode-hook #'whitespace-turn-on)
;; (setq-default whitespace-style '(face empty tab trailing))

