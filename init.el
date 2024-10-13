;;; init.el --- init.el
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-editor)
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


;;; Personal settings
;; org 模式下设置自动断行
(add-hook 'org-mode-hook (lambda ()
                           (setq-local truncate-lines nil)))

;; 正在编辑的文件内容有修改时自动更新
(global-auto-revert-mode)

;; 鼠标滚动时保持光标相对位置不变
(setq scroll-preserve-screen-position 'always)
(global-hl-line-mode +1)

;; 以下后缀名使用 glsl-mode
(setq auto-mode-alist
      (append
       '(("\\.vs\\'" . glsl-mode))
       '(("\\.fs\\'" . glsl-mode))
       '(("\\.gs\\'" . glsl-mode))
       auto-mode-alist))

;; 关闭 C-M-\ 时自动插入 tab 字符
(setq-default indent-tabs-mode nil)


(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
