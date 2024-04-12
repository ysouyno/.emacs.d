;;; init-vc.el --- init-vc.el
;;; Commentary:
;;; Code:

(when (maybe-require-package 'diff-hl)
  (add-hook 'after-init-hook 'global-diff-hl-mode))


(provide 'init-vc)

;;; init-vc.el ends here
