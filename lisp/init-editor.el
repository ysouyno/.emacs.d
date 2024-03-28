;;; init-editor.el --- init-editor.el
;;; Commentary:
;;; Code:


(when (fboundp 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 3)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(when (boundp 'display-fill-column-indicator)
  (setq-default indicate-buffer-boundaries 'left)
  (setq-default display-fill-column-indicator-character ?┊)
  (add-hook 'prog-mode-hook 'display-fill-column-indicator-mode))


;;; Page break lines
;;; `M-x quoted-insert RET C-l'(or `C-q') insert `^L'
(ysouyno-install-a-package 'page-break-lines)
(add-hook 'after-init-hook 'global-page-break-lines-mode)


(ysouyno-install-a-package 'which-key)
(add-hook 'after-init-hook 'which-key-mode)
(setq-default which-key-idle-delay 1.5)


(provide 'init-editor)

;;; init-editor.el ends here
