;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-dracula)

(global-auto-revert-mode 1)
(setq isearch-lazy-count t)
(setq-default show-trailing-whitespace t)
(add-hook! prog-mode (auto-highlight-symbol-mode 1))

(map! "M-`" nil) ; unlock in zellij
(map! "M-g c" #'avy-goto-char)
