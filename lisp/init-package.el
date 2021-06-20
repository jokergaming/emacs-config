;; settings for package managment


;; 设置sjtu镜像
;; (setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
;;                         ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")))


(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
			   ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/"))))


;; cl- common-lisp extension
;; (require 'cl) --- deprecated
;; (require 'cl-lib)
(require 'cl)

;; Add Packages
(defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		smooth-scrolling
		hungry-delete
		;; swiper
		;; counsel
		smartparens
		;; --- Major Mode ---
		;; js2-mode
		markdown-mode
		paredit
		;; --- Minor Mode ---
		;; nodejs-repl
		exec-path-from-shell
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

;; Find Executable Path on OS X
;; (when (memq window-system '(mac ns))
;; (exec-path-from-shell-initialize))

;; 文件末尾
(provide 'init-package)
