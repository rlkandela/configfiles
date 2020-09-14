;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Raul Candela"
      user-mail-address "rlkandela@gmail.com")

(setq doom-theme 'doom-dracula)

(setq display-line-numbers-type 'relative)

(setq fancy-splash-image "~/.doom.d/greeting_icon.png")

(global-disable-mouse-mode)

(setq company-idle-delay 0.2
      company-minimum-prefix-length 1)

(company-quickhelp-mode)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'hindent-mode)

(require 'company)
(after! haskell
  (set-company-backend! 'haskell-mode 'company-ghci 'company-files 'company-yasnippet))

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(require 'company)
(require 'company-jedi)
(require 'yasnippet)
(after! python
  (set-company-backend! 'python-mode 'company-jedi 'company-files 'company-yasnippet))
;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))
;; (add-hook 'python-mode-hook 'my/python-mode-hook)

(setq org-directory "/home/rlkandela/.orgwiki/")

(setq org-log-done 'time)

(global-set-key (kbd "C-x C-f")  (lambda () (interactive)
                                     (cd "somePathHere")
                                     (call-interactively 'find-file)))
(map! :leader
      :prefix "f"
      :desc "Open orgwiki in dired" "o" (lambda () (interactive)
                                          (cd "/home/rlkandela/.orgwiki")
                                          (call-interactively 'find-file)))

(after! org
  (setq org-priority-faces '((65 :foreground "#f73131") (66 :foreground "#31f73b") (67 :foreground "#4287f5"))))

(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode)
  :config (setq org-fancy-priorities-list '("■" "■" "■")))

(map! "C-M-k" #'org-shiftup)
(map! "C-M-j" #'org-shiftdown)

(use-package org-roam
  :ensure t
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "/home/rlkandela/.orgwiki/"))

(map! :after org-roam
      :map org-roam-mode-map
      :leader
      (:prefix "n"
       (:prefix ("r" . "Roam")
        :desc "org-roam" "l" #'org-roam
        :desc "Find file" "f" #'org-roam-find-file
        :desc "Find directory" "d" #'org-roam-find-directory
        :desc "Show graph" "g" #'org-roam-graph-show)))

(map! :after org-roam
      :map org-mode-map
      :leader
      (:prefix "n"
       (:prefix "r"
        :desc "org-roam-insert" "i" #'org-roam-insert
        :desc "org-roam-insert-immediate" "I" #'org-roam-insert-immediate)))

(map! :leader
      (:prefix "g"
       :desc "Git push" "p" #'magit-push))

(require 'telega)
(map! :leader
      (:prefix "o"
       :desc "Telega" "l" #'telega))

(require 'telega)
(map! :after telega
      :map telega-root-mode-map
      :leader
      (:prefix ("l" . "Telega")
       :desc "Open chat with" "w" #'telega-chat-with
       :desc "View folders" "f" #'telega-view-folders
       :desc "Kill telega" "K" #'telega-kill
       :desc "Browse url" "u" #'telega-browse-url))

(require 'telega)
(map! :after telega
      :map telega-chat-mode-map
      :leader
      (:prefix "l"
       :desc "Attach" "a" #'telega-chatbuf-attach
       :desc "Cancel aux" "x" #'telega-chatbuf-cancel-aux))

(telega-notifications-mode 1)

(add-hook 'telega-chat-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '(telega-company-emoji
                           telega-company-username
                           telega-company-hashtag)
                         (when (telega-chat-bot-p telega-chatbuf--chat)
                           '(telega-company-botcmd))))
            (company-mode 1)))

(add-hook 'telega-chat-insert-message-hook 'telega-msg-ignore-blocked-sender)
