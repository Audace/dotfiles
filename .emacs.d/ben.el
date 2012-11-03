(setq mac-command-modifier 'meta) ; sets the Command key as Meta

;; http://hints.macworld.com/article.php?story=20091013214429696
(setq ns-alternate-modifier 'alt)
(define-key global-map [(alt ?v)] 'scroll-down)
(define-key global-map [(meta ?v)] 'yank)
