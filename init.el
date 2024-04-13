;;; init.el --- init.el
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-editor)
(require 'init-minibuffer)
(require 'init-consult)
(require 'init-recentf)
(require 'init-corfu)
(require 'init-vc)
(require 'init-emacs-lisp)

(when (and (require 'treesit nil t)
           (fboundp 'treesit-available-p)
           (treesit-available-p)
           (require 'init-treesitter)))

(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
