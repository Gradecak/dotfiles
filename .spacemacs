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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     go
     csv
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install --------------------
     helm
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t)
     better-defaults
     (haskell :variables
              haskell-completion-backend 'intero)
     emacs-lisp
     git
     latex
     markdown
     javascript
     html
     react
     org
     bibtex
     spacemacs-org
     (shell :variables
            shell-default-position 'bottom
            shell-default-height 40)
     shell-scripts
     yaml
     java
     floobits
     python
     search-engine
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)
     (syntax-checking :variables
                      syntax-checking-enable-tooltips t)
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     restclient
     osx
     php
     scala
     ;; spacemacs-layouts
     ;; spacemacs-completion
     ;; spacemacs-editing
     ;; spacemacs-editing-visual
     ;; spacemacs-misc
     ;; spacemacs-ui-visual
     ;; spacemacs-org
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      fireplace
                                      all-the-icons
                                      ox-reveal
                                      autothemer
                                      dash
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; workaround for loading some themes
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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default ni:l)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(creamsody
                         material
                         monokai
                         moe-dark
                         subatomic
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale .9)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairsy are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize t
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
  dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
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
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  (load-file "~/.emacs.d/elpa/dash-20180910.1856/dash.el")
  (load-file "~/.emacs.d/elpa/autothemer-20180920.923/autothemer.el")
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun my-keybindings ()
  (global-set-key (kbd "M-m ar") 'align-regexp)
  (global-set-key (kbd "M-m os") 'eshell)
  (global-set-key (kbd "C-c g")  'avy-goto-char)
  (global-set-key (kbd "M-m ff") 'evil-toggle-fold)
  (global-set-key (kbd "<f5>")   'web-mode)
  (global-set-key (kbd "M-m bi") 'spacemacs/indent-region-or-buffer)
  )

(defun c/c++-config ()
  (setq flycheck-clang-language-standard "c++11")
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
  )

(defun my-setup-indent (n)
  (interactive)
  ;; java/c/c++
  (setq-default c-basic-offset n)
  ;; web development
  (setq-default python-indent-offset n)
  (setq-default coffee-tab-width n)            ; coffeescript
  (setq-default javascript-indent-level n)     ; javascript-mode
  (setq-default js-indent-level n)             ; js-mode
  (setq-default js2-basic-offset n)            ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-default web-mode-css-indent-offset n)  ; web-mode, css in html file
  (setq-default web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-default css-indent-offset n)           ; css-mode

  ;; Haskell Indent
  (setq haskell-indent-spaces n)
  (setq haskell-indentation-layout-offset n)

  ;; for html tags inp file web-mode buffers
  (setq web-mode-markup-indent-offset n)
  )

(defun my-personal-code-style ()
  (setq indent-tabs-mode nil) ; use space instead of tab
  (setq tab-width 2)          ; or any other preferred value
  (my-setup-indent 2)
  )

(defun setup-org ()
  (setq org-modules (quote (org-protocol)))
  (setq org-use-fast-todo-selection t)
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")))

  (setq org-agenda-files (list "~/org/project_notes.org"
                               "~/org/work.org"
                               "~/org/home.org"))

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "IN-PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "REVIEW(r)" )))
  )

(defun org-export-config ()
  (with-eval-after-load 'org
    (setq org-latex-pdf-process '("latexmk -xelatex -shell-escape -interaction=nonstopmode -bibtex -f %f"))
    )
  (require 'ox-latex)
  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines))
  (setq org-latex-compiler "xelatex")
  (add-to-list 'org-latex-classes
               '("fyp"
                 "\\documentclass{report}"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\chapter*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (setq org-ref-default-bibliography '("~/Documents/fyp/research_sources/references.bib")
        org-ref-pdf-directory "~/Documents/fyp/research_sources/"
        org-ref-bibliography-notes "~/Documents/fyp/research_sources/notes.org")
  )

(defun scala-config ()
  (setq flycheck-scala-scalastyle-executable
        "/usr/local/bin/scalastyle")
  (setq flycheck-scalastylerc
        "/Users/marijangradecak/.scalastyle.xml")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (golden-ratio-mode 1)
  (creamsody-modeline-four)
  (setq tramp-copy-size-limit nil) ;; fix invalid-base64 data issue
  (remove-hook 'python-mode-hook 'spacemacs//init-eldoc-python-mode)
  (setq neo-theme 'icons)          ;;enable file icons in neo-tree
  (setq ispell-program-name "aspell")
  (setq ispell-dictionary "en_GB")
  ;; make helm use a good search engine
  (setq helm-ag-base-command "/usr/local/bin/ag -Q --vimgrep")
  (setq powerline-default-separator 'nil)
  (setq flycheck-pos-tip-timeout 500)
  (setq-default truncate-lines t)  ;; disable word wrap
  (setq-default indent-guide-global-mode t)
  ;; set github diff indicator position
  (setq diff-hl-side 'right)
  (setq menu-bar-mode nil)
  (defalias 'list-buffers 'ibuffer) ; make ibuffer default
  ;; Natural title bar for dark themes (change the . dark -> .light for light theme)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (add-hook 'sh-mode-hook (lambda () (sh-electric-here-document-mode -1)))
  (powerline-center-theme)
  (setup-org)
  (c/c++-config)
  (my-personal-code-style)         ;; call code style setup
  (my-keybindings)                 ;; call keybinding setup
  (org-export-config)
  (fancy-battery-mode)
  (delete-selection-mode 1)        ;; Allow overwriting of marked section

  ;; Use hlint with Intero
  (with-eval-after-load 'intero
    (flycheck-add-next-checker 'intero
                               '(warning . haskell-hlint)))
  (add-hook 'org-mode-hook 'turn-on-flyspell)
  (smartparens-global-mode t)
  (scala-config)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/org/project_notes.org")))
 '(package-selected-packages
   (quote
    (go-guru go-eldoc company-go go-mode auctex-latexmk treepy graphql noflet ensime sbt-mode scala-mode solarized-theme-theme moe-theme company-php ac-php ac-php-core xcscope phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode abyss-theme-theme emacs-abyss-theme-theme company-auctex auctex sublimity floobits csv-mode org-mime chapel-mode dash company-emacs-eclim eclim all-the-icons memoize font-lock+ company-quickhelp define-word powerline spinner hydra parent-mode projectile request flx iedit anzu highlight diminish pkg-info epl bind-map bind-key packed f avy popup wgrep smex ivy-hydra counsel-projectile counsel swiper pdf-tools tablist org-category-capture markdown-mode skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter ghub let-alist web-completion-data dash-functional tern restclient know-your-http-well ghc haskell-mode company biblio biblio-core yasnippet anaconda-mode pythonic auto-complete yapfify winum which-key web-mode orgit org-ref ivy org-plus-contrib neotree magit-gitflow live-py-mode intero highlight-indentation helm-make git-link flycheck-pos-tip fish-mode exec-path-from-shell evil-mc dumb-jump disaster diff-hl company-shell adaptive-wrap smartparens magit magit-popup evil flycheck git-commit parsebib alert helm helm-core async js2-mode s yaml-mode xterm-color ws-butler with-editor web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill undo-tree toc-org tagedit sunshine spaceline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restclient-helm restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode pos-tip popwin pip-requirements persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary org-projectile org-present org-pomodoro org-download org-bullets open-junk-file ob-restclient ob-http mwim multi-term move-text mmm-mode markdown-toc macrostep lorem-ipsum log4e livid-mode linum-relative link-hint less-css-mode launchctl key-chord json-mode js2-refactor js-doc insert-shebang info+ indent-guide hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-bibtex helm-ag haskell-snippets goto-chg google-translate golden-ratio gnuplot gntp gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flycheck-haskell flx-ido fireplace fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elisp-slime-nav cython-mode company-web company-tern company-statistics company-restclient company-ghci company-ghc company-cabal company-c-headers company-anaconda column-enforce-mode coffee-mode cmm-mode cmake-mode clean-aindent-mode clang-format boogie-friends autumn-light-theme auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#263238")))))
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
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(package-selected-packages
   (quote
    (yasnippet-snippets symon subatomic-theme string-inflection spaceline-all-the-icons solarized-theme pippel pipenv password-generator overseer org-brain nameless mvn meghanada maven-test-mode magit-svn json-navigator hierarchy importmagic epc ctable concurrent deferred impatient-mode helm-xref helm-rtags helm-purpose window-purpose imenu-list groovy-mode groovy-imports pcache gradle-mode google-c-style flycheck-rtags flycheck-bashate evil-org evil-lion evil-goggles evil-cleverparens paredit ensime sbt-mode scala-mode editorconfig dante lcr company-rtags rtags company-php ac-php-core xcscope color-theme-sanityinc-tomorrow centered-cursor-mode browse-at-remote badwolf-theme dotenv-mode phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode abyss-theme-theme emacs-abyss-theme-theme company-auctex auctex sublimity floobits csv-mode org-mime chapel-mode dash company-emacs-eclim eclim all-the-icons memoize font-lock+ company-quickhelp define-word powerline spinner hydra parent-mode projectile request flx iedit anzu highlight diminish pkg-info epl bind-map bind-key packed f avy popup wgrep smex ivy-hydra counsel-projectile counsel swiper pdf-tools tablist org-category-capture markdown-mode skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter ghub let-alist web-completion-data dash-functional tern restclient know-your-http-well ghc haskell-mode company biblio biblio-core yasnippet anaconda-mode pythonic auto-complete yapfify winum which-key web-mode orgit org-ref ivy org-plus-contrib neotree magit-gitflow live-py-mode intero highlight-indentation helm-make git-link flycheck-pos-tip fish-mode exec-path-from-shell evil-mc dumb-jump disaster diff-hl company-shell adaptive-wrap smartparens magit magit-popup evil flycheck git-commit parsebib alert helm helm-core async js2-mode s yaml-mode xterm-color ws-butler with-editor web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill undo-tree toc-org tagedit sunshine spaceline smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restclient-helm restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode pos-tip popwin pip-requirements persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary org-projectile org-present org-pomodoro org-download org-bullets open-junk-file ob-restclient ob-http mwim multi-term move-text mmm-mode markdown-toc macrostep lorem-ipsum log4e livid-mode linum-relative link-hint less-css-mode launchctl key-chord json-mode js2-refactor js-doc insert-shebang info+ indent-guide hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-bibtex helm-ag haskell-snippets goto-chg google-translate golden-ratio gnuplot gntp gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md fuzzy flycheck-haskell flx-ido fireplace fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode elisp-slime-nav cython-mode company-web company-tern company-statistics company-restclient company-ghci company-ghc company-cabal company-c-headers company-anaconda column-enforce-mode coffee-mode cmm-mode cmake-mode clean-aindent-mode clang-format boogie-friends autumn-light-theme auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) nil) (((class color) (min-colors 89)) (:background "#1c1c1c" :foreground "#eeeeee"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
