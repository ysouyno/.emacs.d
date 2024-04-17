;;; init-projectile.el --- init-projectile.el
;;; Commentary:
;;; Code:

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden 0"))

  (with-eval-after-load 'projectile
    (define-key
     projectile-mode-map (kbd "C-c p") 'projectile-command-map)))


;; projectile-ripgrep: Packages ‘ripgrep’ and ‘rg’ are not available
(when (maybe-require-package 'rg)
  (global-set-key (kbd "M-?") 'rg-project))


(provide 'init-projectile)

;;; init-projectile.el ends here
