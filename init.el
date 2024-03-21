(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(make-backup-files nil)
 '(grep-find-template
   "\"D:/cygwin64/bin/find.exe\" -H <D> <X> -type f <F> -exec \"grep\" <C> -nH --null <R> \"{}\" \";\"")
 '(inhibit-startup-screen t)
 '(tags-table-list
   '("D:/demos/emacs-28.2/cygwin_build/src/TAGS" "D:/demos/emacs-28.2/cygwin_build/lisp/TAGS"))
 '(indent-tabs-mode nil))

(cond
 ((version= emacs-version "28.2")
  (setq find-function-C-source-directory "D:/demos/emacs-28.2/src/"))
 ((version= emacs-version "29.2")
  (setq find-function-C-source-directory "D:/demos/emacs-29.2/src/")))

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/") t)
(package-initialize)
;; (package-refresh-contents)

(recentf-mode 1)
(setq recentf-max-saved-items 100)
(setq recentf-max-menu-items 100)
(global-set-key "\C-c\ f" 'recentf-open-files)
