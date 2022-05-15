;;; init.el --- Entrypoint for Emacs config

;;; Commentary:
;; Main Emacs config file
;; Most configs are in emacs.d/lisp/ directory

;;; Code:

;; Set package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Add lisp to load-path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Load configs from lisp/ dir
(require 'init-misc)
(require 'init-ui)
(require 'init-appearance)
(require 'init-organization)
(require 'init-org)
(require 'init-vc)
(require 'init-prog)
(require 'init-ide)
;; Always load these last in this order
(require 'init-custom)
(require 'init-keybindings)

(provide 'init)

;;; init.el ends here
