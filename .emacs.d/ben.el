;; sets the Command key as Meta
(setq mac-command-modifier 'meta)

;; Make Cmd-V still paste.
;; http://hints.macworld.com/article.php?story=20091013214429696
(setq ns-alternate-modifier 'alt)
(define-key global-map [(alt ?v)] 'scroll-down)
(define-key global-map [(meta ?v)] 'yank)

;; Set font to Inconsolata-14
(set-default-font "Inconsolata-14")
