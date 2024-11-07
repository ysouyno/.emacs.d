;;; init-frame.el --- init-frame.el
;;; Commentary:
;;; Code:

;; 按屏幕比例设置启动窗口大小
;; left, top 表示窗口与屏幕左边缘，上边缘的像素距离
;; width, height 表示窗口宽高的字符数
;;(when (eq system-type 'windows-nt)
;;  (let ((lval (* (x-display-pixel-width) 0.461))
;;        (tval (* (x-display-pixel-height) 0.02))
;;        (w (* (/ (x-display-pixel-width) (frame-char-width)) 0.4581))
;;        (h (* (/ (x-display-pixel-height) (frame-char-height)) 0.87)))
;;    (add-to-list 'default-frame-alist (cons 'left (ceiling lval)))
;;    (add-to-list 'default-frame-alist (cons 'top (ceiling tval)))
;;    (add-to-list 'default-frame-alist (cons 'width (ceiling w)))
;;    (add-to-list 'default-frame-alist (cons 'height (ceiling h)))))

;;; Restoring frame size
;;; https://github.com/portacle/emacsd/blob/master/portacle-window.el#L49
(defun --normalize-frame-parameter (parameter)
  (let ((value (frame-parameter (selected-frame) parameter)))
    (if (number-or-marker-p value)
        (max value 0)
      0)))

(defun save-frame-geometry ()
  (let* ((props '(left top width height))
         (values (mapcar '--normalize-frame-parameter props)))
    (with-temp-buffer
      (cl-loop for prop in props
               for val in values
               do (insert (format "(add-to-list 'initial-frame-alist '(%s . %d))\n"
                                  prop val)))
      (write-file (expand-file-name ".frame-geometry.el" user-emacs-directory)))))

(defun load-frame-geometry ()
  (let ((file (expand-file-name ".frame-geometry.el" user-emacs-directory)))
    (when (file-exists-p file)
      (load-file file))))

(when window-system
  (add-hook 'emacs-startup-hook 'load-frame-geometry)
  (add-hook 'kill-emacs-hook 'save-frame-geometry))


(provide 'init-frame)

;;; init-frame.el ends here
