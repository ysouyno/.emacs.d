;;; init-frame.el --- init-frame.el
;;; Commentary:
;;; Code:

;; 按屏幕比例设置启动窗口大小
;; left, top 表示窗口与屏幕左边缘，上边缘的像素距离
;; width, height 表示窗口宽高的字符数
(when (eq system-type 'windows-nt)
  (let ((lval (* (x-display-pixel-width) 0.461))
        (tval (* (x-display-pixel-height) 0.02))
        (w (* (/ (x-display-pixel-width) (frame-char-width)) 0.4581))
        (h (* (/ (x-display-pixel-height) (frame-char-height)) 0.87)))
    (add-to-list 'default-frame-alist (cons 'left (ceiling lval)))
    (add-to-list 'default-frame-alist (cons 'top (ceiling tval)))
    (add-to-list 'default-frame-alist (cons 'width (ceiling w)))
    (add-to-list 'default-frame-alist (cons 'height (ceiling h)))))


(provide 'init-frame)

;;; init-frame.el ends here
