;;; init.el --- init.el  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-editor)
(require 'init-frame)
(require 'init-whitespace)
(require 'init-minibuffer)
(require 'init-projectile)
(require 'init-consult)
(require 'init-recentf)
(require 'init-corfu)
(require 'init-vc)
(require 'init-emacs-lisp)
(require 'init-rust)
(require 'init-markdown)


(when (and (require 'treesit nil t)
           (fboundp 'treesit-available-p)
           (treesit-available-p)
           (require 'init-treesitter)))


;;; 在 windows 平台上不加载 init-lsp 和 init-cpp
(unless (eq system-type 'windows-nt)
  (require 'init-lsp)
  (require 'init-cpp))


(require 'init-custom)


(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
