;;; init-cpp.el --- init-cpp.el
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((c-mode c++-mode c-ts-mode c++-ts-mode) . lsp))


(provide 'init-cpp)

;;; init-cpp.el ends here
