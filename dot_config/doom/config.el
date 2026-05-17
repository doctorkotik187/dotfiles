;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-dracula)

(setq isearch-lazy-count t)
(setq-default show-trailing-whitespace t)
(global-auto-revert-mode 1)
(add-hook! prog-mode (auto-highlight-symbol-mode 1))

(map! "M-g c" #'avy-goto-char)
