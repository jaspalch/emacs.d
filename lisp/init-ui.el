;; init-ui.el --- Configure UI elements

;;; Commentary:
;; Setup various UI packages

;;; Code:

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package which-key
  :ensure t
  :defer t
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package vterm)

(use-package multi-vterm)

(use-package neotree
  :ensure t)

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-vcs-max-length 30)
  (setq column-number-mode t)
  (custom-set-faces
	'(mode-line ((t (:family my-font-family :height 0.9))))
	'(mode-line-inactive ((t (:family my-font-family :height 0.9)))))
  (when (string-equal system-type "darwin")
  	(custom-set-faces
		'(mode-line ((t (:family my-font-family :height 0.95))))
		'(mode-line-inactive ((t (:family my-font-family :height 0.95)))))))

(use-package page-break-lines)

(use-package dashboard
  :config
  (setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (bookmarks . 5)
                        (agenda . 5)))

  (setq dashboard-center-content t)
  (setq dashboard-set-navigator t)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-setup-startup-hook))

;; Misc UI settings
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(provide 'init-ui)

;;; init-ui.el ends here
