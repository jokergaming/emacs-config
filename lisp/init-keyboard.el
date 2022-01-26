;; 配置键位

(global-set-key (kbd "C-w") 'backward-kill-word)


;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key (kbd "<f3>") 'open-init-editor-file)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;
(provide 'init-keyboard)
