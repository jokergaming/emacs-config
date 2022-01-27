;; (package-initialize)
;; 设置查找模块化配置路径,下面两种方法均可
;; (add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))

;; 设置图形界面进行设置文件的保存位置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load-file custom-file))


(require 'awesome-pair)
(require 'init-package)
(require 'init-ui)
(require 'init-editor)
(require 'init-theme)
(require 'init-keyboard)
(require 'init-org)
(require 'init-filemanage)
(require 'init-scheme)
