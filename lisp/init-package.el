;; settings for package managment

;; 设置sjtu镜像
;; (setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
;;                         ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")))
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
			   ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/"))))


;; cl- common-lisp extension 用来进行for loop循环
;; (require 'cl) --- deprecated
;; (require 'cl-lib)
(require 'cl)

;; Add Packages
(defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		;; smooth-scrolling
		hungry-delete
		;; swiper
		;; counsel
		smartparens
		;; --- Major Mode ---
		;; js2-mode
		;; markdown-mode
		paredit
		;; --- Minor Mode ---
		;; nodejs-repl
		;; exec-path-from-shell ;; 苹果系统修复查找可执行文件
		keycast ;; mini buffer显示按下的按键
		vertico ;; mini buffer变垂直
		orderless ;; mini buffer 模糊查询
		marginalia
		embark
		consult
		;; --- Themes ---
		;; monokai-theme
		dracula-theme
		;; solarized-theme
		) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

;; Find Executable Path on OS X, 在苹果系统上调用
;; (when (memq window-system '(mac ns))
;; (exec-path-from-shell-initialize))

;; 设置插件默认行为

;; (icomplete-mode 1)

(keycast-mode t)
(marginalia-mode t)

(setq completion-styles '(orderless))

(global-set-key (kbd "C-'") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)

(global-set-key (kbd "C-s") 'consult-line)

;; 文件末尾
(provide 'init-package)
