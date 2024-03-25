;;; init-elpa.el --- init-elpa.el

;;; Commentary:

;;; Code:

(require 'package)
(require 'cl-lib)

(setq package-user-dir
      (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version) user-emacs-directory))

(add-to-list 'package-archives
             '("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(defvar ysouyno-packages
  '(htmlize
    ;; tree-sitter-langs
    tree-sitter
    rust-mode)
  "A list of packages to ensure are installed at launch.")

(defun ysouyno-install-a-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package ysouyno-packages)
    (add-to-list 'ysouyno-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun ysouyno-install-all-packages ()
  "Install all packages listed in `ysouyno-packages'"
  (unless (cl-every #'package-installed-p ysouyno-packages)
    (message "%s" "Not all packages in `ysouyno-packages' installed!")
    (package-refresh-contents)
    (message "%s" " done.")
    (mapc #'ysouyno-install-a-package ysouyno-packages)))

(ysouyno-install-all-packages)

(provide 'init-elpa)

;;; init-elpa.el ends here
