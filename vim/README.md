# VIM

Vim is a 1991 editor for \*NIX systems that is based on the 1976 vi editor. Vim is extremely lightweight and supports almost all modern languages. Vim is highly customizable and also has open source plugins available for various languages. Vim also allows you to automatically include banners and headers and license information in your files based on the file extension.

For most commands you can insert number before command, to specify how many times you want to invoke it. For example `5j` will invoke `j` command `five` times, which will result in moving your cursor down five lines; or in a more general way `<n><command>` will repeat `command` for the `n` times.

## Links

- https://www.howtoforge.com/vim-basics
- https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/
- [Learn Vim (The Smart Way)](https://github.com/iggredible/Learn-Vim/tree/master)

## Installation

\$ sudo apt install -y vim

## Vim modes

- **Normal mode**
  - for operations like copy/paste, delete lines or words or characters, replace characters, navigate through source code (typically needs other tools like cscope and ctags)
- **Insert mode**
  - generally used for editing the files
- **Visual mode**
  - supports visually selecting, copying, deleting of areas in the file and so on
- **Visual Line mode**
  - Visual Line mode is a variant of Visual mode that allows you to select entire lines of text.

## Basic Vim move

- `l` -> move right
- `h` -> move left
- `k` -> move up
- `j` -> move down
- the arrow keys also work but these keystrokes are useful when moving a lot of positions
  - for example, "10w" will move your cursor by 10 words.

## Advanced Vim move

- `w` -> move to the start of the next word
- `e` -> move to the end of the next word
- `b` -> move to the start of the previous word
- `^` -> move to the first non-blank character in the line
- `$` -> move to the end of line
- `ctrl + d` -> half page down
- `ctrl + f` -> one page down
- `ctrl + u` -> half page up
- `ctrl + b` -> one page up

## Vim shortcuts (Normal Mode)

- `Esc` -> move to Normal mode
- `yy` -> yank an entire line
- `<n>yy` -> to yank the _current_ and next _n-1_ lines
- `p` -> paste (whatever has been copied)
- `<n>p` -> paste whatever is copied _n_ times
- `a` -> go into insert mode after the current cursor location
- `o` -> insert new blank line below the current line (this automatically puts you in insert mode)
- `O` -> insert new blank line above the current line (this automatically puts you in insert mode)
- `:w` -> save file
- `wq!` -> save and close file
- `q` -> close file, this fails if there are unsaved changes
- `q!` -> discard changes and close
- `wq!` -> save and close
- `u` or `:u` -> Undoing the last change
- `gg` -> go to beginning of file
- `G` -> go to end of file
- `r` -> replace a single character
- `R` -> goes to replace mode; every keystroke replaces the character under the cursor; press `esc` to go back to command mode
- `I` -> go to the beginning of the current line, and go into insert mode
- `A` -> go to the end of the current line, and go into insert mode
- `x` -> remove character under cursor
- `:line number` -> go to line number `linenumber` (eg. `:15`)
- `:edit <filename>` or `:e <filename>` -> opening a new file, if file doesn't exist it will create new file with that name

## Delete

This is actually "cut" - everthing removed is placed in the vim buffer and can be pasted from command mode with "p")

- `\$d` -> remove everything from cursor position to end of line
- `d0` -> delete from beginning of line to the current position
- `dd` -> remove the entire line
- `daw` -> delete a word (will delete a word under cursor or the first word from the right side of cursor)
- `d` + `G` -> remove everything from cursor position to end of file
- `d` + `gg` -> remove everything from cursor to beginning of file
- `caw` -> change a word; delete a word under cursor or the first right word from the cursor, and start insert mode
- `ci[pattern]` -> change in between `pattern`;
  - `function(int a, int b)` - `ci(` - will delete everything inside `()` and invoke insert mode; for braces you need to be inside them
  - `console.log("test")` -- `ci"` - will delete everything under `""` and invoke insert mode

## Searching

- `/<pattern>` -> search for `<`pattern`>` below current position
- `?<pattern>` -> search for `<`pattern`>` above current position
  - both operations wrap around
- `f<char>` -> search in current line forward for character `char`
- `F<char>` -> search in current line backward for character `char`
  - `;` -> search for the next occurance of `char` in the current line
  - `,` -> search for the previous occurance of `char` in the current line

### Search and replace

- `:%s/old/new/g` -> search for all occurrences of `old` in file and replace with `new`
- `:%s/old/new/gc` -> same as above but waits at all occurrences of `old` for confirmation to replace
- Buffer management
  - `:ls` -> show all files open in vim
    - ordered list
  - `:b#` -> go to the previous file being edited
  - `:b5` -> go to the file open in the 5th vim buffer

# Other modes

- Visual mode
  - Press `v` in normal mode to get visual mode. Then you can move with arrow keys to select areas of text and then use the above shortcuts to yank or delete.
- Visual Line mode
  - Press `V` in normaln mode to get into visual line mode.
- Insert mode
  - Press `i` in command mode to get insert mode. You can type into your file in this mdoe.

## Splitting Vim panes

- `:hsplit` -> split the panes horizontally
  - `:hsplit <filename>` to open file in a new horizontally split pane
- `:vsplit` -> split the panes vertically
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
