(global-font-lock-mode 1)
; Emacs config
(set-language-environment "UTF-8")
(setq-default tab-width 8)
(setq-default indent-tabs-mode t)
(setq-default c-backspace-function 'backward-delete-char)
(setq-default c-default-style "linux")

; Backups and autosaves
(setq backup-directory-alist `(("." . "~/.emacs/saves")))
; Stop multiple backups
(setq delete-old-versions t
  backup-by-copying t
  kept-new-versions 6
  kept-old-versions 2
  version-control t
  auto-save-default nil ; Disable auto-saves
)

; Keybindings
(global-set-key (kbd "DEL") 'backward-delete-char)

; Package sources
(require 'package)

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

; Package preamble
(setq evil-want-C-u-scroll t) ; Because vim > emacs

; Load packages
(package-initialize)

(require 'auto-complete)
(require 'auto-complete-config)
(require 'evil)
(require 'evil-surround)
(require 'ggtags)
(require 'powerline)
(require 'multiple-cursors)
(require 'yasnippet)
(require 'yascroll)
(require 'zlc)

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

; Nethack
(add-to-list 'load-path "~/.emacs.d/nethack_el/")
(autoload 'nethack "nethack" "Play Nethack." t)
(setq nethack-program "/usr/bin/nethack")

; Package config
(evil-mode 1)
(global-evil-surround-mode 1)
(ac-config-default)
(yas-global-mode 1)
(powerline-default-theme)
(global-yascroll-bar-mode 1)
(zlc-mode t)
(cua-mode t)

(add-to-list 'semantic-default-submodes 'global-semantic-decoration-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode)
(semantic-mode 1)

; Functions
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic))

(defun my:ac-c-header-init ()
 (require 'auto-complete-c-headers)
 (add-to-list 'ac-sources 'ac-source-c-headers)
 (add-to-list 'achead:include-directories '"/usr/include")
)

; Hooks (And rice)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(add-hook 'c-mode-hook 'my:add-semantic-to-autocomplete)
(add-hook 'c++-mode-hook 'my:add-semantic-to-autocomplete)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(add-hook 'prog-mode-hook 'hl-line-mode )

; Rice
; - GUI
(load-theme 'monokai t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(fringe-mode 1)

; View tabs
(standard-display-ascii ?\t "┊\t")

; Increase the padding of linum
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
     (propertize (format (format "%%%dd  " w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)

(setq gdb-many-windows t)

; - Other
(show-paren-mode 1)
(global-hl-line-mode 1) ; Note: Might want to disable, because I have a prog-mode-hook for it already.

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "PragmataPro" :foundry "unknown" :slant normal :weight normal :height 90 :width normal))))
 '(hl-line ((t (:inherit t :background "#3E3D31"))))
 '(linum ((t (:inherit (shadow default) :background "gray11" :foreground "goldenrod")))))


(set-default 'truncate-lines t)
(setq scroll-step            1
      scroll-conservatively  10000)

;; change mode-line color by evil state
(lexical-let ((default-color (cons (face-background 'mode-line)
				   (face-foreground 'mode-line))))
(add-hook 'post-command-hook
  (lambda ()
    (let ((color (cond ((minibufferp) default-color)
		       ((evil-insert-state-p) '("#e80000" . "#ffffff"))
		       ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
		       ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
		       (t default-color))))
      (set-face-background 'mode-line (car color))
      (set-face-foreground 'mode-line (cdr color))))))

; Disable startup screen
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(dolist (mode '(column-number-mode line-number-mode))
  (when (fboundp mode) (funcall mode t)))

(dolist (mode-hook '(text-mode-hook prog-mode-hook))
  (add-hook mode-hook
            (lambda ()
              (linum-mode 1))))
