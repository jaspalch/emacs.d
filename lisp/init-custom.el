;; init-custom.el --- Define custom stuff

;;; Commentary:
;; Custom helper functions

;;; Code:

(require `init-ide)

;; Random helpers
(defun my/open-init-file ()
  "Open the init file."
  (interactive)
  (find-file user-init-file))

(defun my/open-deadgrep (str)
  "Opens deadgrep, STR used in search."
  (interactive "sString to find: ")
  (deadgrep-kill-all-buffers)
  (deadgrep str))

(provide 'init-custom)

;;; init-custom.el ends here
