;; ***************************************
;; editor行为控制

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

;; 关闭emacs自动保存
(setq make-backup-files nil)

;; 关闭自动保存文件
(setq auto-save-default nil)



;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 关闭缩进 (第二天中被去除)
;; (electric-indent-mode -1)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 130)

;; 打开最近文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; 选中删除
(delete-selection-mode 1)

;; 默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 括号自动匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮当前行
(global-hl-line-mode 1)

;; 自动加载外部修改文件
(global-auto-revert-mode 1)


;; y和n代替yes和no
(fset 'yes-or-no-p 'y-or-n-p)



;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-init-editor-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-editor.el"))

;; 开启全局company补全
;; (global-company-mode 1)
(add-hook 'after-init-hook 'global-company-mode)


;; 缩写补全
(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("imp" "import")
					    ("inc" "include <stdio.h>")
					    ))

;; hippie补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
(global-set-key (kbd "s-/") 'hippie-expand)



;;(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
;;(autoload 'run-scheme "cmuscheme" "Switch to interactive Scheme buffer." t)
;;(setq auto-mode-alist (cons '("\\.ss" . scheme-mode) auto-mode-alist))


;; *******************************************************
;; 导出
(provide 'init-editor)