;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; --- VISUALS ---
(setq catppuccin-flavor 'macchiato
      doom-theme 'catppuccin)

(add-hook! 'prog-mode-hook
  (setq-local show-trailing-whitespace t))

(use-package! rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package! auto-highlight-symbol
  :hook (prog-mode . auto-highlight-symbol-mode))

;; --- BEHAVIOR ---

;; GENERAL
(doom-auto-revert-mode 1)
(setq confirm-kill-emacs nil
      isearch-lazy-count t
      treesit-auto-install-grammar 'always)

;; AUTOCOMPLETE
(after! (corfu corfu-terminal)
  (setq corfu-auto-prefix 3
        corfu-auto-delay 0.9
        corfu-preselect 'prompt))

;; --- KEYBINDINGS ---
(map! "M-`" nil) ; used by zellij for unlock / lock

;; --- NEW TREESITTER MODES ---
(use-package! just-ts-mode
  :mode "/[Jj]ustfile\\'"
  :config
  (unless (treesit-language-available-p 'just)
    (just-ts-mode-install-grammar)))

(use-package! typst-ts-mode
  :mode "\\.typ\\'"
  :config
  (add-to-list 'treesit-language-source-alist
               '(typst "https://github.com/uben0/tree-sitter-typst"))
  (unless (treesit-language-available-p 'typst)
    (treesit-install-language-grammar 'typst)))

(use-package! nushell-ts-mode
  :mode "\\.nu\\'"
  :config
  (add-to-list 'treesit-language-source-alist
               '(nu "https://github.com/nushell/tree-sitter-nu"))
  (unless (treesit-language-available-p 'nu)
    (treesit-install-language-grammar 'nu)))
