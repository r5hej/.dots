(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(setq vc-follow-symlinks t)                                               ; Follow symbolic links

(defconst custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (write-region "" "" custom-file))

(load custom-file)

(org-babel-load-file "~/.emacs.d/configuration.org")

