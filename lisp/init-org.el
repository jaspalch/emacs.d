;; init-org.el --- Configure org-mode

;;; Commentary:
;; Setup org-mode and other org-mode related packages

;;; Code:

;; Define org-babel languages
(defvar load-language-list '((emacs-lisp . t)
							   (python . t)
							   (js . t)
							   (java . t)
							   (shell . t)))

(use-package ob-go
    :init (cl-pushnew '(go . t) load-language-list))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :config
  ;;; Titles and Sections
  ;; hide #+TITLE:
  (setq org-hidden-keywords '(title))
  ;; set basic title font
  (set-face-attribute 'org-level-8 nil :family "Fira Sans" :weight 'light :inherit 'default)
  ;; Low levels are unimportant => no scaling
  (set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
  (set-face-attribute 'org-level-4 nil :inherit 'org-level-8)
  ;; Top ones get scaled the same as in LaTeX (\large, \Large, \LARGE)
  (set-face-attribute 'org-level-3 nil :inherit 'org-level-8 :height 1.2) ;\large
  (set-face-attribute 'org-level-2 nil :inherit 'org-level-8 :height 1.44) ;\Large
  (set-face-attribute 'org-level-1 nil :inherit 'org-level-8 :height 1.728) ;\LARGE
  ;; Only use the first 4 styles and do not cycle.
  (setq org-cycle-level-faces nil)
  (setq org-n-level-faces 4)
  ;; Document Title, (\huge)
  (set-face-attribute 'org-document-title nil
					  :height 2.074
					  :foreground 'unspecified
					  :inherit 'org-level-8))

(use-package org
  :config
  ;; Babel
  (setq org-confirm-babel-evaluate nil)
  (org-babel-do-load-languages 'org-babel-load-languages load-language-list))

(provide 'init-org)

;;; init-org.el ends here
