(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-bindings starter-kit-eshell starter-kit-js starter-kit-ruby starter-kit-lisp)
  "A list of packages to ensure are installed at launch.")
;; Add elpy when 1.1 is released.


(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

 (add-to-list 'load-path "/Users/williamfry/elpy/")
(load-file "/Users/williamfry/elpy/elpy.el")
(elpy-enable)
(elpy-use-ipython)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-python-command "/usr/local/bin/python"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Use command key as meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)
