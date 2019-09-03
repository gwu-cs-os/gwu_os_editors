# Emacs Editor Configuration

Emacs is a versatile editor that has modes for many different programming languages, is OK to use for beginners, but focuses on efficiency for people who know how to use it well.
Because of this, there is a learning curve.

The `.emacs` file here includes some customization and provides a good `C` programming environment.
Copy it into your home directory (`cp .emacs ~/`) and start up emacs (`emacs`).
However, it also maintains the ability to use the mouse, and has menus, thus is easier to use as you learn the system.
If you find that you're getting the hang of using emacs without the mouse, then `emacs -nw` makes it play well with `tmux`.

## Basic Editing

Emacs is a little strange at first.
Instead of what you probably find typical (save: `cntl-s`, undo: `cntl-z`, and open: `cntl-o`), emacs uses `cntl-x-f` (hold "control", and press "x", then "f" then release "control") to open a file, for example.
`cntl-x` is the key sequence saying "I'm going to give you a command", and the next keypress is the command.
Some important commands (many of which you can instead access through the menus):

- `cntl-x-f` - open a file
- `cntl-x-s` - save the current file ("buffer" in emacs)
- `cntl-x-b` - list the open files
- `cntl-x-3` - split the screen horizontally
- `cntl-x-2` - split the screen vertically
- `cntl-x-1` - remove another pane

Some variants on the keystroke exist:

- `cntl-x b` (you stop pressing "control" before hitting "b") - switch to another open file (buffer)
- `cntl-x o` - switch to another split file

To move around the buffer:

- Arrow keys work!
- `cntl-a` - go to the start of the current line
- `cntl-e` - go to the end
- `cntl-f` - go forward a single character
- `cntl-b` - go back
- you can replace `cntl-` with `alt-` (for some reason summarized as `M-` in emacs), and it will replace "character" with word.
    This makes it real fast to move around a file.
- `cntl-n` - go to the next line
- `cntl-p` - go to the previous line
- `cntl-s` - search for a string
- `cntl-r` - reverse search for a string
- `cntl-space` - set a "mark"
- `cntl-w` - "cut" between where the cursor currently is, and where the previous "mark" was set.
- `alt-w` - "copy" instead
- `cntl-y` - "paste" the contents of what was copied or cut.
- `cntl-<` - go to the start of this file
- `cntl->` - go to the end of this file
- `cntl-_` - undo

When programming:

- `alt-.` - jump to the definition of a function/variable the cursor is over, OR show a list of all places a function is called if you use it while the cursor is over the function.
- `alt-g` - Goto a specified line.
    Great when you get compiler errors that specify a line number.
- `alt-;` - add a comment
- `alt-/` - autocomplete a symbol (for example, when used when your cursor is at the end of "open_f", it might automatically finish "open_file".
    Press it again to see the next completion.

If you ever get "stuck" (you can't get rid of a mark, you keep searching, etc...), just press `cntl-g` to "cancel.

## Cool little things

- With the provided configuration, spellchecking is constantly on.
    It will even spellcheck the comments in your code.
    If you see a word underlined and colored yellow or red, that means emacs doesn't recognize the word.
    Use `alt-$` when on one of these words to bring up a menu of suggested fixes.
- Emacs has modes for just about every programming environment, including markdown.
- Of course, syntax highlighting and auto-indentation are assumed features.
- Keyboard macros let you define a sequence of keypresses that you can reply easily, letting you automate repetitive tasks.

## Resources

There are tons of emacs resources online.
A few:

- [decent beginner guide](http://www.jesshamrick.com/2012/09/10/absolute-beginners-guide-to-emacs/)
- [wiki](https://www.emacswiki.org/)
- [guided tour](https://www.gnu.org/software/emacs/tour/)
- [large set of useful tutorials](http://ergoemacs.org/emacs/emacs.html) including many of the [functions](http://ergoemacs.org/emacs/emacs_keys_basics.html) discussed here

## Changing Appearance

There are a lot of themes out there.
You can install them pretty easily through Melpa.
For example: `M-x package-install cyberpunk-theme`.
