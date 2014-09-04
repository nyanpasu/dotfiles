(global-font-lock-mode 1)
; Emacs config
(set-language-environment "UTF-8")
(setq gdb-many-windows t)
(setq-default tab-width 8)
(setq-default indent-tabs-mode t)
(setq-default c-backspace-function 'backward-delete-char)
(setq-default c-default-style "linux")

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
(require 'powerline)
(require 'multiple-cursors)
(require 'yasnippet)
(require 'yascroll)
(require 'zlc)

; Nethack
(autoload 'nethack "nethack" "Play Nethack." t)
(setq nethack-program "/usr/bin/nethack")

; Package config
(evil-mode 1)
(ac-config-default)
(yas-global-mode 1)
(powerline-default-theme)
(global-yascroll-bar-mode 1)
(zlc-mode t)
(cua-mode t)

(semantic-mode 1)

; Functions
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic))

(defun my:ac-c-header-init ()
 (require 'auto-complete-c-headers)
 (add-to-list 'ac-sources 'ac-source-c-headers)
 (add-to-list 'achead:include-directories '"/usr/include")
)

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(add-hook 'c-mode-hook 'my:add-semantic-to-autocomplete)
(add-hook 'c++-mode-hook 'my:add-semantic-to-autocomplete)

; Rice
(load-theme 'monokai t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(fringe-mode 1)

(show-paren-mode 1)

(custom-set-faces '(default ((t (:family "PragmataPro" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))

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
