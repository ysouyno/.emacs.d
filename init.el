;;; init.el --- init.el
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-editor)
(require 'init-minibuffer)
(require 'init-projectile)
(require 'init-consult)
(require 'init-recentf)
(require 'init-corfu)
(require 'init-vc)
(require 'init-emacs-lisp)
(require 'init-rust)

(when (and (require 'treesit nil t)
           (fboundp 'treesit-available-p)
           (treesit-available-p)
           (require 'init-treesitter)))


;;; Save command history
(add-hook 'after-init-hook 'savehist-mode)


;;; Save cursor position
;; http://xahlee.info/emacs/emacs/emacs_save_cursor_position.html
(cond
 ((< emacs-major-version 25)
  (require 'saveplace)
  (setq-default save-place t))
 ((>= emacs-major-version 25)
  (save-place-mode 1)))


(global-set-key (kbd "C-x C-b") 'ibuffer)

(line-number-mode t)
(column-number-mode t)
;; (size-indication-mode t)


(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
