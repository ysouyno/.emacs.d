;;; init.el --- init.el
;;; Commentary:

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(grep-find-template
   "\"D:/cygwin64/bin/find.exe\" -H <D> <X> -type f <F> -exec \"grep\" <C> -nH --null <R> \"{}\" \";\"")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages '(rust-mode tree-sitter-langs htmlize))
 '(tags-table-list
   '("D:/demos/emacs-28.2/cygwin_build/src/TAGS" "D:/demos/emacs-28.2/cygwin_build/lisp/TAGS")))

(cond
 ((version= emacs-version "28.2")
  (setq find-function-C-source-directory "D:/demos/emacs-28.2/src/"))
 ((version= emacs-version "29.2")
  (setq find-function-C-source-directory "D:/demos/emacs-29.2/src/")))

(recentf-mode 1)
(setq recentf-max-saved-items 100)
(setq recentf-max-menu-items 100)
(global-set-key "\C-c\ f" 'recentf-open-files)

(setq major-mode-remap-alist
      '((sh-mode . bash-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (python-mode . python-ts-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
