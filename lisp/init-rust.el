;;; init-rust.el --- init-rust.el  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'rust-mode)
  (when (maybe-require-package 'cargo)
    (with-eval-after-load 'rust-mode
      (add-hook 'rust-mode-hook 'cargo-minor-mode))))


(provide 'init-rust)

;;; init-rust.el ends here
