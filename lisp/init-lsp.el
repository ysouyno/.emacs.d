;;; init-lsp.el --- init-lsp.el
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t)

(require 'lsp-ui)
(require 'lsp-ui-imenu)

(setq lsp-ui-sideline-enable t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-peek-enable t)
(setq lsp-ui-peek-always-show t)


(provide 'init-lsp)

;;; init-lsp.el ends here
