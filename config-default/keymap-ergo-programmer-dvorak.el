(global-set-key (kbd "s-k") 'clipboard-yank)
(global-set-key (kbd "s-j") 'clipboard-kill-ring-save)
(global-set-key (kbd "s-q") 'clipboard-kill-region)

(global-set-key (kbd "s-K") '$delete-line)
(global-set-key (kbd "s-l") 'goto-line)

(global-set-key (kbd "s-c") 'previous-line)
(global-set-key (kbd "s-t") 'next-line)
(global-set-key (kbd "s-h") 'backward-char)
(global-set-key (kbd "s-n") 'forward-char)

;; (global-set-key (kbd "s-d") 'move-beginning-of-line)
(global-set-key (kbd "s-d") '$move-to-beginning-of-line)
(global-set-key (kbd "C-a") '$move-to-beginning-of-line)
(global-set-key (kbd "s-D") 'move-end-of-line)

(global-set-key (kbd "M-s-c") '(lambda nil (interactive) (previous-line 5)))
(global-set-key (kbd "M-s-t") '(lambda nil (interactive) (next-line 5)))
(global-set-key (kbd "s-H") 'beginning-of-buffer)
(global-set-key (kbd "s-N") 'end-of-buffer)

(global-set-key (kbd "s-g") 'backward-word)
(global-set-key (kbd "s-G") 'backward-sexp)
;; (global-set-key (kbd "s-r") 'forward-word)
(global-set-key (kbd "s-r") (lambda ()
                              (interactive)
                              (if ($string-contains? ($->string major-mode) "lisp")
                                  (forward-word)
                                ($smart-forward-exp))))
(global-set-key (kbd "s-R") 'forward-sexp)

(global-set-key (kbd "s-u") 'delete-char)
(global-set-key (kbd "s-e") 'backward-delete-char)
(global-set-key (kbd "s-p") 'kill-word)
(global-set-key (kbd "s-.") 'backward-kill-word)
;; (global-set-key (kbd "s-.") '$mark-word-backward)

(global-set-key (kbd "s-x")
                (lambda ()
                  (interactive)
                  (kill-line)
                  (delete-horizontal-space)))
(global-set-key (kbd "s-X") '$delete-line)

(global-set-key (kbd "s-_") '$mark-line)
(global-set-key (kbd "s-)") '$mark-word)
(global-set-key (kbd "s-S-SPC") '$mark-defun)

(global-set-key (kbd "s--") 'comment-or-uncomment-region)
(global-set-key (kbd "s-/") 'create-tags)
(global-set-key (kbd "s-?") 'visit-tags-table)
(global-set-key (kbd "s-f") 'query-replace-regexp)
(global-set-key (kbd "s-F") 'query-replace)
(global-set-key (kbd "s-j") 'clipboard-kill-ring-save)
;; (global-set-key (kbd "<menu> m") 'toggle-menu-bar-mode-from-frame)

(global-set-key (kbd "s-'") 'undo)
(global-set-key (kbd "s-\"") 'undo-tree-redo)

;; (global-set-key (kbd "s-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "s-s") 'helm-occur)
;; (global-set-key (kbd "s-S") 'isearch-backward-regexp)

(add-hook 'lisp-mode-hook
          '(lambda ()
             (define-key paredit-mode-map (kbd "s-.") 'paredit-backward-kill-word)))

(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (define-key paredit-mode-map (kbd "s-.") 'paredit-backward-kill-word)))

(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "s-t") 'helm-next-line)
     (define-key helm-map (kbd "s-c") 'helm-previous-line)))
