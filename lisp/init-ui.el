;; 默认ui的配置

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭菜单栏
(menu-bar-mode -1)


;; 关闭bell
(setq ring-bell-function 'ignore)


;; 关闭文件滑动控件
(scroll-bar-mode -1)


;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 更改显示字体大小 12pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
;; 如果还没安装字体用下一行作为替换
;; (set-face-attribute 'default nil :height 130)
;; 安装了jetbrains字体
(set-face-attribute
 'default nil
 :family "JetBrains Mono"
 :height 120
 :weight 'normal)

 ;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; 为了防止Emacs在显示中
;; UTF-8 as the default coding system
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

;; Explicitly set the prefered coding systems to avoid annoying prompt
;; from emacs (especially on Microsoft Windows)
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)


(provide 'init-ui)
