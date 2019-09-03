# Visual Studio Code
VS Code has, in recent times, made greats leaps towards being a useful code editor.

https://code.visualstudio.com/docs/introvideos/basics

In order to use VS Code for this class, there are a few settings that need to be added:
```
"[c]": {
        "editor.tabSize": 8,
        "editor.defaultFormatter": "xaver.clang-format"
        "editor.formatOnSave": true,
    },
```
The second line asks VS Code to use clang formatter for auto formatting.

The settings file can be opened from the command palette.

## Extensions needed
- This is a preview mode extension but has been downloaded ~26 million times
    - https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
- Specifically for Intellisense
    - https://marketplace.visualstudio.com/items?itemName=austin.code-gnu-global

## Setting up clang
This is done on the Ubuntu system:
1. Installing clang
        ```
        sudo apt install clang-format
        ```
2. Create the default format file in the root directory of your project:
        ```
        clang-format -style=llvm -dump-config > .clang-format
        ```
3. Change the formatter to suit Linux/Composite style (to some extent)
    - Open the .clang-format file with any editor
```
AlwaysBreakAfterReturnType: All
BreakBeforeBraces: Linux
IndentWidth:     8
TabWidth:        8
```

## Optionally set up remote programming environment
### Set up passwordless SSH (this will work for MAC or Linux based laptops)
1. Set up a static IP address for your VM
2. Open `~/.ssh/config` on your laptop
```
Host os
        HostName 192.168.56.110
```
In this case, the static IP of the VM is `192.168.56.110` and have named it `os`. The name can be absolutely anything.
3. Set up public/private keys
    - Run the following command and follow the instructions
`$ ssh-keygen -t rsa`
4. Copy the key over to the development system
`$ ssh-copy-id os`
5. Check the connections
`$ ssh os`
### On Windows
There are some suggestions in this link
https://www.tecmint.com/ssh-passwordless-login-with-putty/

### VS Code Extension
https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh

Now users can open up the command palette to connect to the `os` system and work on any file/folder.