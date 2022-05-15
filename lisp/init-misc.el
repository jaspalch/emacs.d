;; init-misc.el --- Miscellaneous configs

;;; Commentary:
;; Random settings that idk where else to stick

;;; Code:

(use-package tramp
  :config
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(use-package exec-path-from-shell
  :ensure t
  :config
  (setq exec-path-from-shell-arguments '("-l"))
  (when (memq window-system '(mac ns x))
	(exec-path-from-shell-initialize)))

;; Set encodings
(setq-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Don't litter init file with custom settings
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Enable auto revert mode settings
(global-auto-revert-mode t)

;; Set dir for backups
(setq backup-directory-alist `(("." . "~/.saves")))

(provide 'init-misc)

;;; init-misc.el ends here
