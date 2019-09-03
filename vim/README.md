# VIM
Vim is a 1991 editor for *NIX systems that is based on the 1976 vi editor. Vim is extremely lightweight and supports almost all modern languages. Vim is highly customizable and also has open source plugins available for various languages. Vim also allows you to automatically include banners and headers and license information in your files based on the file extension.

## Links
- https://www.howtoforge.com/vim-basics
- https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/

## Installation
$ sudo apt install -y vim

## Vim modes
- Command
    - for operations like copy/paste, delete lines or words or characters, replace characters, navigate through source code (typically needs other tools like cscope and ctags)
- Insert
    - generally used for editing the files
- Visual
    - supports visually selecting, copying, deleting of areas in the file and so on

## Vim shortcuts (Command Mode)

- Copy an entire line
    - "yy"
    - "5yy" -> to yank the current and next four lines
- Paste (whatever has been copied)
    - "p"
    - "5p" -> paste whatever is copied 5 times
- Move
    - "h" -> move right
    - "l" -> move left
    - "k" -> move up
    - "j" -> move left
    - "w" -> move to the start of the next word
    - the arrow keys also work but these keystrokes are useful when moving a lot of positions
        - for example, "10w" will move your cursor by 10 words.
    - "^" -> move to the first non-blank character in the line
    - "ctrl + d" -> half page down
    - "ctrl + d" -> one page down
    - "ctrl + u" -> half page up
    - "ctrl + b" -> one page up
- Append
    - "a" -> after the current cursor location
- Insert new blank line (this automatically puts you in insert mode)
    - "o" -> below the current line
    - "O" -> above the current line
- Delete (this is actually "cut" - everthing removed is placed in the vim buffer and can be pasted from command mode with "p")
    - "$d" -> remove everything from cursor position to end of line
    - "d0" -> delete till beginning of line from current position
    - "dd" -> remove the entire line
    - "d" + "shift + g" -> remove everything from cursor position to end of file
    - "d" + "gg" -> remove everything from cursor to beginning of file
- Opening a new file
    - ":edit `<`filename`>`"
- Saving a file
    - ":w"
- Closing a file
    - "q" -> this fails if there are unsaved changes
    - "q!" -> discard changes and close
    - "wq!" -> save and close
- Undoing the last change
    - "u" or ":u"
- Go to line
    - ":`<`line number`>`"
- Moving out of insert or visual mode
    - Command mode is the default mode
    - "esc" -> move out of a non-command mode
- Go to beginning or end of file
    - "shift + g" -> go to end of file
    - "gg" -> go to beginning of file
- Replace
    - "r" -> replace a single character
    - "Replace" -> goes to replace mode; every keystroke replaces the character under the cursor; press "esc" to go back to command mode
- Searching
    - "/`<`pattern`>`" -> search for pattern below current position
    - "?`<`pattern`>`" -> search for pattern above current position
    - both operations wrap around
- Search and replace
    - ":%s/`<`old`>`/`<`new`>`/g" -> search for all occurrences of old in file and replace with new
    - ":%s/`<`old`>`/`<`new`>`/g" -> same as above but waits at all occurrences of old for confirmation to replace
- Buffer management
    - ":ls" -> show all files open in vim
        - ordered list
    - ":b#" -> go to the previous file being edited
    - ":b5" -> go to the file open in the 5th vim buffer

## Other modes
- Visual mode
    - Press "v" in command mode to get visual mode. Then you can move with arrow keys to select areas of text and then use the above shortcuts to yank or delete.
- Insert mode
    - Press "i" in command mode to get insert mode. You can type into your file in this mdoe.

## Splitting vim panes
- ":hsplit" -> split the panes horizontally
    - ":hsplit `<filename`>" to open file in a new horizontally split pane
- ":vsplit" -> split the panes vertically
- If using NerdTree (a popular directory package), you can simply select the file and hit "s" to open it in a vertically split pane

## Setting up package manager for Vim
https://github.com/VundleVim/Vundle.vim.git

This is a popular Vim plugin manager; however, it is not the only one.
Example vundle:
```
Plugin 'VundleVim/Vundle.vim'
Plugin 'c.vim'
call vundle#end()
```

"c.vim" is a highly popular plugin for C that allows users to write C with Vim much more easily.

## Automatic templating with Vim
Vim also supports the setting up automatic templates.
Example for C files:
```
if has("autocmd")
        augroup templates
                autocmd BufNewFile *.c 0r ~/.vim/templates/skeleton.c
                autocmd BufNewFile *.c pu=strftime('%c')
        augroup END
endif
```
- The first line adds the content of the skeleton.c file in ~/.vim/templates into the new C file.
- The second line puts current date time into the file
- If using "c.vim", then this is not required; Users can use ~/.vim/bundle/c.vim/c-support/templates/Templates file to set up templating.