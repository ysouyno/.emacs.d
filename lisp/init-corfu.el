;;; init-corfu.el --- init-corfu.el
;;; Commentary:
;;; Code:

(setq tab-always-indent 'complete)


(ysouyno-install-a-package 'orderless)
(with-eval-after-load 'vertico
  (require 'orderless)
  (setq completion-styles '(orderless basic)))
(setq completion-category-overrides nil
      completion-category-defaults nil)
(setq completion-cycle-threshold 4)


(ysouyno-install-a-package 'corfu)
(setq-default corfu-auto t)
(setq-default corfu-quit-no-match 'separator)
(add-hook 'after-init-hook 'global-corfu-mode)

(with-eval-after-load 'corfu
  (corfu-popupinfo-mode))


(provide 'init-corfu)

;;; init-corfu.el ends here
