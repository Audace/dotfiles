;; Sets the Command key as Meta
(setq mac-command-modifier 'meta)


;; Set font to Inconsolata-14
(set-default-font "Inconsolata-14")


;; Make connecting to servers easier
(defvar ssh-connection-alist
  '())

(setq ssh-connection-alist
  '((sgdev . "ec2-204-236-167-168.us-west-1.compute.amazonaws.com")
    (sgtail . "ec2-204-236-167-168.us-west-1.compute.amazonaws.com")
    (sggate . "ec2-204-236-167-168.us-west-1.compute.amazonaws.com")
    (sgpushpin . "ec2-204-236-167-168.us-west-1.compute.amazonaws.com")
    (sgbulkloader . "ec2-204-236-167-168.us-west-1.compute.amazonaws.com")

    (bendev . "ec2-184-72-11-102.us-west-1.compute.amazonaws.com")))

(defun ssh-convenience ()
  "Make SSH convenience functions."
  (interactive)
  (mapcar (lambda (conn)
            (let ((name (symbol-name (car conn)))
                  (host (cdr conn)))
              (fset (intern name)
                    `(lambda nil
                       ,(format "Connect to %s SSH preset." name)
                       (interactive)
                       (let ((buffer-name ,(format "*ssh-%s*" name)))
                         (if (get-buffer buffer-name)
                             (pop-to-buffer buffer-name)
                           (ssh ,host (pop-to-buffer buffer-name))))))))
          ssh-connection-alist))

(ssh-convenience)


;; Custom variables
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.

  ;; For this to work, your prompt needs to be set to export PS1='\h!\u:\w\$ '
  ;; For ZSH, use export PROMPT=$'%m!%n:%/$ '
 '(dirtrack-list (quote ("\\((.+)\\)?[a-z0-9]+.[a-z0-9]+:\\(.*\\)[$#] $" 2)))

 ;;'(explicit-bash-args (quote ("--noediting" "-i" "-l")))
 ;;'(ido-mode nil nil (ido))
 ;;'(iswitchb-mode t)
 ;;'(ns-command-modifier (quote meta))
 ;;'(ssh-directory-tracking-mode t)
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
