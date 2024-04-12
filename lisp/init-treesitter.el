;;; init-treesitter.el --- init-treesitter.el
;;; Commentary:
;;; Code:

(setq major-mode-remap-alist
      '((sh-mode . bash-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (python-mode . python-ts-mode)))


(provide 'init-treesitter)

;;; init-treesitter.el ends here
