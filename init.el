;; (package-initialize)
;; 设置查找模块化配置路径
(add-to-list 'load-path "~/.emacs.d/lisp/")


(require 'init-package)
(require 'init-editor)
(require 'init-theme)
(require 'init-keyboard)
(require 'init-scheme)



;; ********************************************
;; ************* system auto config

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
