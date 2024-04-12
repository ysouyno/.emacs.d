;;; init-emacs-lisp.el --- init-emacs-lisp.el
;;; Commentary:
;;; Code:

(require-package 'elisp-slime-nav)
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq mode-name "elisp")))


(provide 'init-emacs-lisp)

;;; init-emacs-lisp.el ends here
