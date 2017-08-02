(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(org-babel-load-file "~/.emacs.d/configuration.org")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
