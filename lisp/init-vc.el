;; init-vc.el --- Version control configs

;;; Commentary:
;; Configure magit and other VC-related packages

;;; Code:

(use-package magit
  :ensure t
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package diff-hl
  :ensure t
  :config
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (global-diff-hl-mode))

;; Always follow symlinks
(setq vc-follow-symlinks t)

(provide 'init-vc)

;;; init-vc.el ends here
