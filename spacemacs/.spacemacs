;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     csv
     javascript
     sql
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (go :variables go-tab-width 4)
     auto-completion
     ;; better-defaults
     emacs-lisp
     git
     clojure
     (c-c++ :variables c-c++-default-mode-for-headers 'c++-mode)
     gtags
     finance
     evil-cleverparens
     ;; markdown
     org
     yaml
     (shell :variables
            shell-default-shell 'multi-term
     ;;       shell-default-height 30
     ;;       shell-default-position 'bottom
            )
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ejc-sql)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 20
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido t
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
  (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
  (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))
  (setq-default evil-escape-key-sequence "ue")
  (setq clojure-enable-fancify-symbols t)
  (require 'ejc-sql)
  (ejc-create-connection
   "H2-db-connection"
   :classpath (file-truename
               "~/.m2/repository/com/h2database/h2/1.4.193/h2-1.4.193.jar")
   :classname "org.h2.Driver"
   :subprotocol "h2"
   :subname "~/repos/database/db/cawala_db"
   :user "sa"
   :password "")
  ;;(ejc-set-rows-limit 1000)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default-frame-alist
    (quote
     ((font . "-ADBO-Source Code Pro-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")
      (vertical-scroll-bars))))
 '(ledger-reports
   (quote
    (("balance-sheet" "ledger -f /home/paul/Documents/coop/achc.dat -e \"2016/10/01\" bal assets equity liabilities")
     ("all-balances-current-month" "ledger -f /home/paul/Documents/coop/achc.dat -p \"from 2016/09/01 to 2016/10/01\" bal")
     ("cash-flow" "ledger -f /home/paul/Documents/coop/achc.dat -p \"from 2016/09/01 to 2016/10/01\" -d \"l<3\" bal expenses income")
     ("budget" "ledger -f /home/paul/Documents/coop/achc.dat -p \"from 2016/07/01 to 2016/10/01\" budget income expenses")
     ("cash-flow-year-to-date" "ledger -f /home/paul/Documents/coop/achc.dat -p \"from 2015/07/01 to 2016/07/01\" bal income expenses")
     ("cleared" "ledger cleared -f /home/paul/Desktop/drewr3.dat")
     ("reg" "ledger reg -f %(ledger-file)")
     ("bal" "ledger -f %(ledger-file) bal")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)"))))
 '(org-agenda-files
   (quote
    ("/home/paul/personal/babushka.org" "/home/paul/org/notes.org")))
 '(org-agenda-todo-ignore-scheduled (quote future))
 '(org-capture-templates
   (quote
    (("j" "Make a Journal Entry" entry
      (file+datetree "~/personal/babushka.org")
      "")
     ("t" "Todo" entry
      (file+headline "~/org/notes.org" "Tasks")
      "* TODO %?
 %i
 %a"))))
 '(org-columns-default-format
   "%60ITEM(Task) %5PRIORITY(Prty) %7Effort(Est. Effort) {:} %CLOCKSUM")
 '(org-global-properties
   (quote
    (("Effort_ALL" . "0 0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00"))))
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 3))))
 '(package-selected-packages
   (quote
    (web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc diminish company-tern dash-functional tern coffee-mode clojure-mode paredit smartparens evil yasnippet company helm helm-core avy projectile magit magit-popup with-editor csv-mode xterm-color ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org sql-indent spaceline smeargle shell-pop restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree multi-term move-text magit-gitflow macrostep lorem-ipsum linum-relative link-hint ledger-mode info+ indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag graphviz-dot-mode google-translate golden-ratio go-guru go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link ggtags fuzzy flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help elisp-slime-nav ejc-sql dumb-jump disaster define-word company-statistics company-go company-c-headers column-enforce-mode cmake-mode clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(powerline-height nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 151 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "repl -s wait")
 '(default-frame-alist
    (quote
     ((font . "-ADBO-Source Code Pro-normal-normal-normal-*-17-*-*-*-m-0-iso10646-1")
      (vertical-scroll-bars))))
 '(ledger-reports
   (quote
    (("balance-sheet" "ledger -f /home/paul/Documents/coop/achc.dat -e \"2016/12/01\" bal assets equity liabilities")
     ("all-balances-current-month" "ledger -f /home/paul/Documents/coop/achc.dat -p \"from 2016/11/01 to 2016/12/01\" bal")
     ("cash-flow" "ledger -f /home/paul/Documents/coop/achc.dat -p \"from 2016/11/01 to 2016/12/01\" -d \"l<3\" bal expenses income")
     ("budget" "ledger -f /home/paul/Documents/coop/achc.dat -p \"from 2016/07/01 to 2016/12/01\" budget income expenses")
     ("cash-flow-year-to-date" "ledger -f /home/paul/Documents/coop/achc.dat -p \"from 2016/07/01 to 2016/12/01\" bal income expenses")
     ("cleared" "ledger cleared -f /home/paul/Desktop/drewr3.dat")
     ("reg" "ledger reg -f %(ledger-file)")
     ("bal" "ledger -f %(ledger-file) bal")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)"))))
 '(org-agenda-files
   (quote
    ("/home/paul/personal/babushka.org" "/home/paul/org/notes.org")))
 '(org-agenda-todo-ignore-scheduled (quote future))
 '(org-capture-templates
   (quote
    (("j" "Make a Journal Entry" entry
      (file+datetree "~/personal/babushka.org")
      "")
     ("t" "Todo" entry
      (file+headline "~/org/notes.org" "Tasks")
      "* TODO %?
 %i
 %a"))))
 '(org-columns-default-format
   "%60ITEM(Task) %5PRIORITY(Prty) %7Effort(Est. Effort) {:} %CLOCKSUM")
 '(org-global-properties
   (quote
    (("Effort_ALL" . "0 0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00"))))
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 3))))
 '(package-selected-packages
   (quote
    (org-category-capture packed iedit go-mode multiple-cursors cmake-ide levenshtein powerline highlight skewer-mode yaml-mode dash sayid password-generator org-brain godoctor flycheck-ledger flycheck evil-org evil-lion editorconfig org-plus-contrib seq async alert s realgud test-simple loc-changes load-relative window-purpose imenu-list symon string-inflection go-rename winum which-key use-package toc-org restart-emacs persp-mode ledger-mode json-mode hungry-delete highlight-indentation helm-projectile helm-make helm-flx git-timemachine evil-mc ejc-sql direx dumb-jump diminish company-go clj-refactor cider clojure-mode ace-window paredit smartparens f evil company helm helm-core yasnippet avy log4e projectile magit magit-popup with-editor hydra js2-mode zenburn-theme xterm-color ws-butler web-beautify volatile-highlights vi-tilde-fringe uuidgen undo-tree sql-indent spaceline solarized-theme smeargle shell-pop rainbow-delimiters queue popwin pkg-info pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree multi-term move-text monokai-theme magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint json-snatcher json-reformat js2-refactor js-doc info+ inflections indent-guide htmlize hl-todo highlight-parentheses highlight-numbers hide-comnt help-fns+ helm-themes helm-swoop helm-purpose helm-mode-manager helm-gtags helm-gitignore helm-descbinds helm-company helm-c-yasnippet helm-ag graphviz-dot-mode goto-chg google-translate golden-ratio go-guru go-eldoc gnuplot gitconfig-mode gitattributes-mode git-messenger git-link git-commit ggtags fuzzy flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eshell-z eshell-prompt-extras esh-help elisp-slime-nav edn disaster define-word csv-mode company-tern company-statistics company-c-headers column-enforce-mode coffee-mode cmake-mode clomacs clojure-snippets clean-aindent-mode clang-format cider-eval-sexp-fu bind-key auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-link ace-jump-helm-line ac-ispell)))
 '(powerline-height nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 151 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
