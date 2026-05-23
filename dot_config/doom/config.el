;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; --- visuals ---
(setq doom-theme 'doom-dracula)
(setq-default show-trailing-whitespace t)

(use-package! auto-highlight-symbol :hook (prog-mode . auto-highlight-symbol-mode))

;; --- behavior ---
(global-auto-revert-mode 1)
(setq confirm-kill-emacs nil)
(setq isearch-lazy-count t)

;; --- keybindings ---
(map! "C-x C-u" #'undo
      "C-x C-h" #'mark-whole-buffer
      "C-x f"   #'find-file
      "C-x C-o" #'other-window
      "M-`" nil
      "M-g c" #'avy-goto-char)
