;;; init-whitespace.el --- init-whitespace.el
;;; Commentary:
;;; Code:

(use-package whitespace
  :init
  (dolist (hook '(prog-mode-hook text-mode-hook))
    (add-hook hook #'whitespace-mode))
  :config
  (setq whitespace-style '(face tabs empty trailing)))

(use-package whitespace-cleanup-mode
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-whitespace-cleanup-mode))


(provide 'init-whitespace)

;;; init-whitespace.el ends here
