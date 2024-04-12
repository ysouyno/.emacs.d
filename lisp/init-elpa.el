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


;;; https://github.com/bbatsov/prelude/blob/master/core/prelude-packages.el

(defvar ysouyno-packages
  '(htmlize
    ;; tree-sitter-langs
    ;; tree-sitter
    consult
    rust-mode
    )
  "A list of packages to ensure are installed at launch.")

(defun ysouyno-install-a-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package ysouyno-packages)
    (add-to-list 'ysouyno-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun ysouyno-install-all-packages ()
  "Install all packages listed in `ysouyno-packages'."
  (unless (cl-every #'package-installed-p ysouyno-packages)
    (message "%s" "Not all packages in `ysouyno-packages' installed!")
    (package-refresh-contents)
    (message "%s" " done.")
    (mapc #'ysouyno-install-a-package ysouyno-packages)))

(ysouyno-install-all-packages)


;;; https://github.com/purcell/emacs.d/blob/master/lisp/init-elpa.el
;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (when (stringp min-version)
    (setq min-version (version-to-list min-version)))
  (or (package-installed-p package min-version)
      (let* ((known (cdr (assoc package package-archive-contents)))
             (best (car (sort known (lambda (a b)
                                      (version-list-<= (package-desc-version b)
                                                       (package-desc-version a)))))))
        (if (and best (version-list-<= min-version (package-desc-version best)))
            (package-install best)
          (if no-refresh
              (error "No version of %s >= %S is available" package min-version)
            (package-refresh-contents)
            (require-package package min-version t)))
        (package-installed-p package min-version))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install optional package `%s': %S" package err)
     nil)))


(provide 'init-elpa)

;;; init-elpa.el ends here
