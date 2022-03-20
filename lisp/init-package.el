;; settings for package managment

;; 设置sjtu镜像
;; (setq package-archives '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
;;                         ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")))
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq
   package-archives
   '(("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")
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
		smooth-scrolling
		hungry-delete
		restart-emacs
		;; swiper
		;; counsel
		smartparens
		;; --- Major Mode ---
		;; js2-mode
		;; markdown-mode
		paredit
                haskell-mode
                lsp-mode
		lsp-haskell
		;; --- Minor Mode ---
		;; nodejs-repl
		;; exec-path-from-shell ;; 苹果系统修复查找可执行文件
		keycast ;; mini buffer显示按下的按键
		vertico ;; mini buffer变垂直
		orderless ;; mini buffer 模糊查询
		marginalia
		embark
		consult
		popwin
		;; --- Themes ---
		;; monokai-theme
		dracula-theme
		;; solarized-theme
		) "Default packages")

;;(unless (bound-and-true-p package-initialized)
;;  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;;(when (not package-archive-contents)
;;  (package-refresh-contents))

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
(vertico-mode t)
(keycast-mode t)
(marginalia-mode t)

(setq completion-styles '(orderless))

(global-set-key (kbd "C-;") 'embark-act)
(setq prefix-help-command 'embark-prefix-help-command)

(global-set-key (kbd "C-s") 'consult-line)

(require 'popwin)
(popwin-mode 1)

;; awesome pair mode setting
(dolist (hook (list
               'c-mode-common-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'emacs-lisp-mode-hook
               'lisp-interaction-mode-hook
               'lisp-mode-hook
               'maxima-mode-hook
               'ielm-mode-hook
               'sh-mode-hook
               'makefile-gmake-mode-hook
               'php-mode-hook
               'python-mode-hook
               'js-mode-hook
               'go-mode-hook
               'qml-mode-hook
               'jade-mode-hook
               'css-mode-hook
               'ruby-mode-hook
               'coffee-mode-hook
               'rust-mode-hook
               'qmake-mode-hook
               'lua-mode-hook
               'swift-mode-hook
               'minibuffer-inactive-mode-hook
               ))
  (add-hook hook '(lambda () (awesome-pair-mode 1))))

(define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
(define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
(define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
(define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
(define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
(define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)
(define-key awesome-pair-mode-map (kbd "=") 'awesome-pair-equal)

(define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)
(define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)

(define-key awesome-pair-mode-map (kbd "SPC") 'awesome-pair-space)
(define-key awesome-pair-mode-map (kbd "RET") 'awesome-pair-newline)

(define-key awesome-pair-mode-map (kbd "M-o") 'awesome-pair-backward-delete)
(define-key awesome-pair-mode-map (kbd "C-d") 'awesome-pair-forward-delete)
(define-key awesome-pair-mode-map (kbd "C-k") 'awesome-pair-kill)

(define-key awesome-pair-mode-map (kbd "M-\"") 'awesome-pair-wrap-double-quote)
(define-key awesome-pair-mode-map (kbd "M-[") 'awesome-pair-wrap-bracket)
(define-key awesome-pair-mode-map (kbd "M-{") 'awesome-pair-wrap-curly)
(define-key awesome-pair-mode-map (kbd "M-(") 'awesome-pair-wrap-round)
(define-key awesome-pair-mode-map (kbd "M-)") 'awesome-pair-unwrap)

(define-key awesome-pair-mode-map (kbd "M-p") 'awesome-pair-jump-right)
(define-key awesome-pair-mode-map (kbd "M-n") 'awesome-pair-jump-left)
(define-key awesome-pair-mode-map (kbd "M-:") 'awesome-pair-jump-out-pair-and-newline)

;; 文件末尾
(provide 'init-package)
