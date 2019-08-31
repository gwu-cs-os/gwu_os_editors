;; list of commands:
;;
;; Help commands:
;; describe-key (M-? k): Asks you to strike a keystroke and describes the command it is bound to.
;; describe-bindings (M-? b): Lists all of you key bindings.
;; command-apropos (M-? a): Search all of the commands in the system, and gives you a brief description of each matching command(with its key binding).
;; view-order-manuals (M-? RET): View all help commands
;;
;; Keyboard macros:
;; C-x ( - start defining keyboard macro
;; C-x ) - stop
;; C-x e - execute keyboard macro
;; C-u # <command> - execute command # times (#=0, infinite)
;;
;; Manipulating hex:
;; (format "%x" (- #xf8857540 #xc0000000))
;;
;; M-; - to insert comment
;; C-c C-e - run preprocessor on text in region
;; M-z - kill all characters between here and a typed character
;;
;; Mark ring holds 16 last marks.  C-x C-x goes to the last.  C-u C-spc pops one position off the top
;;
;; Org mode:
;; Links: [[label][url]] will collapse to label
;; C-c C-l - edit link
;; C-c C-o - open link
;; C-c / - search through org mode (tags etc)
;; C-c / p RET - to unsearch
;; C-c C-c - in table to realign, on formulas to recompute, on headings to add tags
;; M-left/right/up/down - move whole rows/cols/headings
;; TAB, S-TAB - expand/contract headings, move amidst table cells.
;; C-c C-t - cycle header between todo and done

;;
;; Global Settings that are relevant for all modes
;;

;; (menu-bar-mode -1) ;; get rid of the menu bar at the top
;; (scroll-bar-mode -1) ;; get rid of the scroll bar
(tool-bar-mode -1)
(setq require-final-newline t)
(fset 'yes-or-no-p 'y-or-n-p)
(display-time)
(show-paren-mode)
(setq blink-matching-paren t)
(setq make-backup-files nil)

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

(require 'ido)
(ido-mode t)
(global-font-lock-mode 1)

(setq hippie-expand-try-functions-list '(ggtags-try-complete-tag try-expand-dabbrev try-expand-dabbrev-all-buffers try-expand-dabbrev-from-kill try-complete-file-name-partially try-complete-file-name try-expand-all-abbrevs try-expand-list try-expand-line try-complete-lisp-symbol-partially try-complete-lisp-symbol))

(defun count-words-region (beginning end)
  "Print number of words in the region."
  (interactive "r")
  (message "Counting words in region ... ")

;;; 1. Set up appropriate conditions.
  (save-excursion
    (let ((count 0))
      (goto-char beginning)

;;; 2. Run the while loop.
      (while (and (< (point) end)
                  (re-search-forward "\\w+\\W*" end t))
        (setq count (1+ count)))

;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))

;; Count the words in the entire document
(defun count-words-buffer ()
  "Count all the words in the buffer"
  (interactive)
  (count-words-region (point-min) (point-max) ))

; narrow to region -- C-x n n, widen -- C-x n w
(put 'narrow-to-region 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;
;; Custom key bindings!
;;

;; Alt-t to toggle the mode line
(defvar saved-mode-line-format nil)
(defun toggle-mode-line ()
  (interactive)
  (progn
    (if (not saved-mode-line-format)
	(progn (setq saved-mode-line-format mode-line-format)
	       (setq mode-line-format nil))
      (progn (setq mode-line-format saved-mode-line-format)
	     (setq saved-mode-line-format nil)))
    (force-mode-line-update)))
(global-set-key "\M-t" 'toggle-mode-line)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-q" 'query-replace)
(global-set-key "\C-xq" 'replace-string)
(global-set-key "\M-p" 'query-replace-regexp)
(global-set-key "\C-xp" 'replace-regexp)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\C-cf" 'find-file-at-point)

(global-set-key [backspace] 'delete-backward-char)

(global-set-key "\M-?" 'help-command)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)
(global-set-key "\C-d" 'delete-char)
(global-set-key "\M-d" 'kill-word)
(global-set-key "\C-xh" 'help)
(global-set-key "\C-o" 'other-window)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; Tags specific:
(global-set-key "\C-x." 'ggtags-find-reference)

;; abbrev specifics (hippie and pabbrev):
(global-set-key "\M-/" 'hippie-expand)


;;
;; MELPA is the app-store for emacs. The following incantations set it
;; up. If you don't have a mode installed for your language, you can
;; execute the package-install operation.
;;

;; MELPA to the rescue
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; MELPA installs for a new system
;; M-x package-install cyberpunk-theme
;; M-x package-install ggtags
;; M-x package-install markdown-mode
;; M-x package-install python-mode
;; M-x package-install haskell-mode

(add-hook 'after-init-hook
	  (lambda () (load-theme 'cyberpunk t)))

;;
;; Text mode should auto-enable spell checking
;;

(setq text-mode-hook
      '(lambda () (progn (visual-line-mode 1)
			 (flyspell-mode  1))))

;;
;; C Mode -- a real-simple version with spellchecking of comments
;;

(defun my-c-mode ()
  (ggtags-mode)
  (c-set-style "K&R")
  (setq c-basic-offset 8)
  (setq c-auto-newline nil)
  (c-toggle-hungry-state 1)
  (flyspell-prog-mode))

(add-hook 'c-mode-common-hook 'my-c-mode)

;;
;; Shell mode. Running a shell in emacs can be quite useful as you can
;; use all of the power of emacs to copy/alter shell output, and feed
;; it input.
;;

(shell "*sh*")

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; interpret and use ansi color codes in shell output windows
(ansi-color-for-comint-mode-on)

;; shell mode changes
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-completion-addsuffix t)
 '(comint-completion-autolist t)
 '(comint-input-ignoredups t)
 '(comint-scroll-show-maximum-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(comint-scroll-to-bottom-on-output t)
 '(custom-safe-themes (quote ("71ecffba18621354a1be303687f33b84788e13f40141580fa81e7840752d31bf" default))))
