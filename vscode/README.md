# VSCode: Visual Studio Code

`VSCode` is a lightweight Electron-based editor in the spirit of Sublime or Atom that provides a robust ecosystem of plugins that enables more of an IDE-like experience similar to its big brother Visual Studio. It is the dominant editor in many language communities, and has ecosystem support for just about every programming language at this point.

Here are a handful of key features

- Git and GitHub Integration
- IntelliSense Integration with most languages

These are good resources to get started with:

- [Getting Started](https://code.visualstudio.com/docs)
- [Intro Videos](https://code.visualstudio.com/docs/getstarted/introvideos)

## Suggested Plugins

- [Microsoft C/C++ Plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)
- [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)... Great for pair programming, but not for this class, per our academic honesty standards.
- [Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer)

## Suggested Tutorial

- [Fira Code and Ligatures](https://github.com/tonsky/FiraCode/wiki/VS-Code-Instructions)
- [C/C++ for VS Code](https://code.visualstudio.com/docs/languages/cpp)
- [Remote Development to local VM or remote server via SSH](https://code.visualstudio.com/docs/remote/ssh). You could use this to develop off VSCode in your host machine, and build in your Ubuntu VM.
- Keyboard Shortcuts for [Linux](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf), [Mac OS](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf), and [Windows](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf). Or if you prefer [vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) or [emacs](https://marketplace.visualstudio.com/items?itemName=lfs.vscode-emacs-friendly) keybindings.

## Included configuration

This repo contains project-level config files in `.vscode`. To use these files, copy this hidden directory in your project's root directory. Depending on the coding standards of your project, these config files may need to be added to `.gitignore` to avoid cluttering repositories with editor-specific config files.

The provided tasks in `tasks.json` assume that the project contains a Makefile while builds via `make` and cleans via `make clean`. Depending on your project, you may want to modify or create new tasks based on these templates.

The `launch.json` file contains a key at `configurations.program` that corresponds to a binary compiled with the `-g` debugging flag. This is currently set to `${workspaceFolder}/test`. Depending on how your makefile is configured, you may need to update this key to the path and name of your binary.

## Links and References

- [source](https://github.com/microsoft/vscode)
- [FAQ](https://code.visualstudio.com/docs/supporting/faq)
