;; init-appearance.el --- Customize appearance

;;; Commentary:
;; Make Emacs looks pretty.
;; Configures various packages that control theming, look, and feel.

;;; Code:
(require 'init-ui)

;; Themes
(use-package spacemacs-theme
  :ensure t
  :defer t)

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(use-package kaolin-themes)

;; Set theme
(load-theme 'kaolin-bubblegum t)

;; Misc theming

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package all-the-icons)

;; Colorful dired
(use-package diredfl
  :init (diredfl-global-mode 1))

(use-package all-the-icons-dired
    :diminish
    :hook (dired-mode . all-the-icons-dired-mode)
    :init (setq all-the-icons-dired-monochrome nil))

;; Use line numbers
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;; Set font
(defvar my/font-family "Fira Code" "Font family to be used within Emacs.")
(defvar my/font-size "13" "Font size to be used within Emacs.")
(when (string-equal system-type "darwin" )
  (setq my/font-family "Menlo")
  (setq my/font-size "16"))
(set-frame-font (concat my/font-family "-" my/font-size) nil t)
;; Set modeline font size
(setq doom-modeline-height 1)
(set-face-attribute 'mode-line nil :height (* 10 (string-to-number my/font-size)))
(set-face-attribute 'mode-line-inactive nil :height (* 10 (string-to-number my/font-size)))

(setq-default tab-width 4)

(provide 'init-appearance)

;;; init-appearance.el ends here
