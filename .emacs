(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)

; Plugins
(evil-mode 1)
(ido-mode 1)
(winner-mode 1)

; Move using shift + arrows
(windmove-default-keybindings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/note/journal.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Org-mode
(setq org-log-done 'time)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-todo-keywords
    '((sequence "TODO" "|" "DONE")
	(sequence "REPORT" "BUG" "KNOWNCAUSE" "|" "FIXED")
	(sequence "|" "CANCELED")))

