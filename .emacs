(add-to-list 'load-path "~/.emacs.d")

;; show matching parenthesis
(show-paren-mode 1)

;; no welcome buffer
(setq inhibit-startup-message t)

;; show column number
(column-number-mode 1)

;; hide toolbar
(tool-bar-mode 0)

;; hide menu
(menu-bar-mode 0)

;; color theme
(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-solarized-light)

;; auto-complete mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
			   (auto-complete-mode 1))))
(real-global-auto-complete-mode t)

;; coffee mode
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.iced$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; lua mode
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; package.el
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; clojure mode
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;; asm86 mode
 (setq make-backup-files nil)
 (autoload 'asm86-mode "asm86-mode.elc")
 (setq auto-mode-alist 
    (append '(("\\.asm\\'" . asm86-mode) ("\\.inc\\'" . asm86-mode)) 
    auto-mode-alist))

;; opa mode
(autoload 'opa-js-mode "~/bin/opa/share/opa/emacs/opa-js-mode.el" "OPA JS editing mode." t)
(autoload 'opa-classic-mode "~/bin/opa/share/opa/emacs/opa-mode.el" "OPA CLASSIC editing mode." t)
(add-to-list 'auto-mode-alist '("\\.opa$" . opa-js-mode)) ;; <-- Set the default mode here
(add-to-list 'auto-mode-alist '("\\.js\\.opa$" . opa-js-mode))
(add-to-list 'auto-mode-alist '("\\.classic\\.opa$" . opa-classic-mode))
