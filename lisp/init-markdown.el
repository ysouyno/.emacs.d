;;; init-markdown.el --- init-markdown.el
;;; Commentary:
;;; Code:

(use-package markdown-mode
  :ensure t
  :init
  (add-hook 'markdown-mode-hook 'turn-on-orgtbl)
  (prefer-coding-system 'utf-8)
  (add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode)))

(use-package markdown-toc
  :ensure t)


(provide 'init-markdown)

;;; init-markdown.el ends here
