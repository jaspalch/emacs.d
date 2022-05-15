;; init-organization.el --- Packages for organizing

;;; Commentary:
;; Packages related to projects, workspaces,
;; and general organization, no not that org :)

;;; Code:

(use-package diminish
  :ensure t)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :demand t
  :config
  (setq projectile-mode-line "Projectile")
  (projectile-mode))

(use-package helm
  :ensure t
  :demand t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode))

(use-package helm-swoop)

(use-package perspective
  :init
  (add-hook 'kill-emacs-hook #'persp-state-save)
  :config
  (setq persp-state-default-file (expand-file-name ".persp-state" user-emacs-directory))
  (persp-mode))

(provide 'init-organization)

;;; init-organization.el ends here
