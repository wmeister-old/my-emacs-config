(add-to-list 'load-path "~/.emacs.d")

;; show matching parenthesis
(show-paren-mode 1)

;; no welcome buffer
(setq inhibit-startup-message t)

;; enable iswitchb-mode by default
(iswitchb-mode 1)

;; show column number
(column-number-mode 1)

;; hide toolbar
(tool-bar-mode 0)

;; hide menu
(menu-bar-mode 0)

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


;; no paredit mode in clojure mode (needs to be before package.el gets loaded)
(add-hook 'clojure-mode-hook (lambda () (paredit-mode nil)))

;; package.el
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

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

;; scala mode
(add-to-list 'load-path "~/.emacs.d/scala-emacs")
(require 'scala-mode-auto)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))

;; slime
;; if this is commented out it's so clojure-jack-in will work
;; they dont seem to play well together
;; to get this to work uninstall the slime package and uncomment
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))


;; color theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; w3m
(require 'w3m-load)
(setq browse-url-browser-function 'w3m-browse-url)
(require 'quack)
(require 'geiser-install)
