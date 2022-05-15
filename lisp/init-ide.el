;; init-ide.el --- IDE packages

;;; Commentary:
;; Configure packages that provide IDE features in Emacs

;;; Code:

(require 'init-prog)

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (add-hook 'after-init-hook #'global-company-mode))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))


(use-package deadgrep
  :config
  (setq deadgrep-display-buffer-function 'switch-to-buffer))

(use-package lsp-mode
  :config
  (fset 'lsp-command-map lsp-command-map)
  ;; Go LSP settings
  ;; Install gopls if not found
  (unless (executable-find "gopls")
	(message "Attempting to install gopls")
    (shell-command "go install golang.org/x/tools/gopls@latest"))

  (defun lsp-go-install-save-hooks ()
	(add-hook 'before-save-hook #'lsp-format-buffer t t)
	(add-hook 'before-save-hook #'lsp-organize-imports t t))

  (lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "~/go/bin/gopls")
                     :major-modes '(go-mode)
                     :remote? t
                     :server-id 'gopls-remote))

  :hook ((go-mode . lsp-deferred)
		 (go-mode . lsp-go-install-save-hooks)
		 (lsp-mode . lsp-enable-which-key-integration)))

(use-package lsp-ui)

(provide 'init-ide)

;;; init-ide.el ends here
