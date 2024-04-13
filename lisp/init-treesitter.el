;;; init-treesitter.el --- init-treesitter.el
;;; Commentary:
;;; Code:

(setq major-mode-remap-alist
      '((c-or-c++-mode . c-or-c++-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (sh-mode . bash-ts-mode)
        (python-mode . python-ts-mode)
        (rust-mode . rust-ts-mode)))


(provide 'init-treesitter)

;;; init-treesitter.el ends here
