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
