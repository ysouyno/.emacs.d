;;; init-minibuffer.el --- init-minibuffer.el
;;; Commentary:
;;; Code:

(when (maybe-require-package 'vertico)
  (add-hook 'after-init-hook 'vertico-mode))

(when (maybe-require-package 'marginalia)
  (add-hook 'after-init-hook 'marginalia-mode))


(provide 'init-minibuffer)

;;; init-minibuffer.el ends here
