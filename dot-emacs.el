;; makes debugging easier. josh suggests
  (add-hook 'after-init-hook '(lambda () (setq debug-on-error t)))

;; Semantic Synchrony
  ;; where is the server?
    ;; (defvar smsn-server-host "fortytwo.net") ;; online
    (defvar smsn-server-host "127.0.0.1") ;; local
  (defvar smsn-server-port 8182) ;; is default, omittable
  (defvar smsn-server-protocol "websocket") ;; is default, omittable
  (defvar smsn-default-vcs-file "/mnt/smsn-data/vcs") ;; ought to be default
  (let ((default-directory "~/.emacs.d/elisp/")) ;; Weird scope!
    (normal-top-level-add-subdirs-to-load-path))
  (require 'smsn-mode)
