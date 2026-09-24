;;; init-custom.el --- init-custom.el  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:


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
(use-package glsl-mode
  :ensure t
  :config
  (setq auto-mode-alist
        (append
         '(("\\.vs\\'" . glsl-mode))
         '(("\\.fs\\'" . glsl-mode))
         '(("\\.gs\\'" . glsl-mode))
         auto-mode-alist)))

;; 关闭 C-M-\ 时自动插入 tab 字符
(setq-default indent-tabs-mode nil)

;; 右键打开带中文文件名的乱码问题
(when (eq system-type 'windows-nt)
  (setq file-name-coding-system 'gb18030))


;;; 来自 custom.el 中不通用的设置
(cond ((equal emacs-version "29.4")
       (setq find-function-C-source-directory "D:/dnld/emacs-29.4/src"))
      ((equal emacs-version "30.2")
       (setq find-function-C-source-directory "D:/dnld/emacs-30.2/src"))
      ((equal emacs-version "31.1")
       (setq find-function-C-source-directory "D:/dnld/emacs-31.1/src")))

(global-set-key "\C-s" 'swiper)
(global-display-line-numbers-mode)
;; (add-hook 'org-mode-hook #'valign-mode)
;; (load-theme 'modus-operandi-tritanopia)
(setq backup-directory-alist '(("." . "F:/tmp/emacs_backups")))
(setq make-backup-files t)
(setq version-control t)

;; for disable prompt "Delete excess backup versions of %s"
(setq delete-old-versions t)

(setq auto-mode-alist
      (append
       '(("\\.vertex\\'" . glsl-mode))
       '(("\\.fragment\\'" . glsl-mode))
       auto-mode-alist))

(load-theme 'leuven)


(provide 'init-custom)

;;; init-custom.el ends here
