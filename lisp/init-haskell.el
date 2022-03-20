(require 'lsp)
(require 'lsp-haskell)
(require 'haskell-interactive-mode)
(require 'haskell-process)


(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

 (custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)

(provide 'init-haskell)
