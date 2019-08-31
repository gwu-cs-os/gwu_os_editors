# TMux: The Terminal Multiplexer

`tmux` is a program that enables you to run a set of terminals, to manage them, and to detach/reattach to them.
Terminals house the command-line programs that you're running including editors, shells, debugging sessions, etc...
What does this all mean:

- You can very quickly and easily (without using a mouse) create new terminals, copy/paste between terminals, switch between them, and get notifications when anything happens on one of them (e.g. when a compilation ends).
- You can leave your setup (all of your terminals), logout of the server, and later come back to find all of your terminals still in the same state.
    This is great for sysadmin work, if you have shoddy internet, and interacting with the cloud.

I'm not going to give too much of an overview of tmux mechanics as these links do a great job:

- [quick and easy guide](https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/)
- [10 most important commands](https://danielmiessler.com/study/tmux/)

## Included configuration

The `.tmux.conf` file that is included here provides a minimal set of functionality.
If you love `tmux`, you will likely end up extending it!
You can find many great configurations online.
The functionality provided by this configuration:

- You need a way to tell `tmux`, "I want to give you a command".
    This is the command sequence.
	In this configuration, the command sequence is `cntl-t` (i.e. hold the `control` button, then press `t`).
	The next keypresses you make will be interpreted as a command to `tmux`, which are listed in the following.
- `c` (`cntl-t` then `c`) will create a new terminal.
    Easy as that.
- `x` will kill the current terminal, and kill whatever is running in it.
- `t` (note how easy this is to press!) switch to the previous terminal.
    This is particularly useful.
	You can edit code in one terminal, `cntl-t t` to switch to another that you use to build the code, type `make`, then `cntl-t t` to switch back to you code while you wait for the compilation to finish.
- `#` (an actual number, not literally the `#` character) will switch to the `#`th terminal.
    This makes it very easy and quick to switch to any of your open terminals.
	I often have one open for coding, one for searching, one for compiling, one for executing, etc...
- `d` which will detach the session.
    You can read above why this is useful, but if you're on a server, it is great to be able to fire up a service or compilation, logout, and later go back and reattach the session that is still chugging away.

## Links and References

- [source and documentation](https://github.com/tmux/tmux)
- [FAQ](https://github.com/tmux/tmux/wiki/FAQ)
- [man page](http://man.openbsd.org/OpenBSD-current/man1/tmux.1)
