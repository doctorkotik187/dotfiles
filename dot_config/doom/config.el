;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; --- VISUALS ---
(setq doom-theme 'doom-dracula)
(setq-default show-trailing-whitespace t)
(blink-cursor-mode 1)

(use-package! auto-highlight-symbol :hook (prog-mode . auto-highlight-symbol-mode))

;; --- BEHAVIOR ---
(global-auto-revert-mode 1)
(setq confirm-kill-emacs nil)
(setq isearch-lazy-count t)

;; --- KEYBINDINGS ---
(map! "C-x C-u" #'undo
      "C-x C-h" #'mark-whole-buffer
      "C-x f"   #'find-file
      "C-x C-o" #'other-window
      "M-`"     nil
      "M-g c"   #'avy-goto-char)

