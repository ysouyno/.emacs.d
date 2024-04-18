;;; init-recentf.el --- init-recentf.el
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 99
 recentf-max-menu-items 100
 recentf-exclude `("/tmp/"
                   "/ssh:"
                   ,(concat package-user-dir "/.*-autoloads\\.el\\'")
                   "/TAGS"
                   )
 recentf-auto-cleanup 'nerver)


(if (fboundp 'consult-recent-file)
    (global-set-key "\C-c\ f" 'consult-recent-file)
  (global-set-key "\C-c\ f" 'recentf-open-files))


(provide 'init-recentf)

;;; init-recentf.el ends here
