# Shell

- A shell is responsible for the execution of the programs in the terminal.
    - On Linux, there are multiple shells to choose from.
- A *login shell* exists when you log in to a text console or when you work via SSH on an external computer. This means that the shell is started immediately after authentication and then (interactively) accepts and processes your commands.
- On the other hand, we speak of an *interactive shell* if the login has already happened earlier and the shell is started later - if required. This is always true if you first log into a desktop system and then open a terminal window. There again a shell is started, which waits for your commands.
- Shell vs Terminal
    - On Linux, the terminal program is only responsible for the external user interface, the actual work is done by the shell that is executed inside the terminal.
- Check running shell
    ```
    $ 
    $ echo $0
    -sh
    $ bash
    ... loading /etc/bash.bashrc
    foobar@debian12:/etc$ echo $0
    bash
    foobar@debian12:/etc$ 
    foobar@debian12:/etc$ bash --version
    GNU bash, version 5.2.15(1)-release (aarch64-unknown-linux-gnu)
    Copyright (C) 2022 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>

    This is free software; you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
    foobar@debian12:/etc$ 
    ``` 
- Changing running shell (`cat /etc/shells` for available shells)
    ```
    foobar@debian12:/etc$ 
    foobar@debian12:/etc$ grep foobar /etc/passwd
    foobar:x:1001:1001::/home/foobar:/bin/sh
    foobar@debian12:/etc$ chsh -s $(which bash) foobar
    Password: 
    foobar@debian12:/etc$ 
    foobar@debian12:/etc$ grep foobar /etc/passwd
    foobar:x:1001:1001::/home/foobar:/usr/bin/bash
    foobar@debian12:/etc$ 
    ```
- Different ways of using the shell
    - **script** - `bash` is used as an interpreter to execute program code. No configuration files are loaded in the process. However, when the script is started interactively in a terminal window, the already existing settings still apply.
    - **login shell** - a *login shell* exists when you log in to a text console or when you work via SSH on an external computer. This means that the shell is started immediately after authentication and then (interactively) accepts and process your commands.
    - **interactive shell** - an *interactive shell* if the login has already happened earlier and the shell is started later (if required). This is always true if you first log into a desktop system and then open a terminal window. Then again a shell is started, which waits for your commands.
- The shell prompt - the content of the prompt is defined by the `PS1` environment variable, e.g., `PS1="\w \$ "`    
- Running commands in the background
    - `firefox &`
- Becoming `root` user
    - If the user in sudo list (`/etc/sudoers`)
        - Run `sudo -s`
            ```
            tecnomen@debian12:~$ sudo -s
            [sudo] password for tecnomen: 
            ... loading /etc/bash.bashrc
            root@debian12:/home/tecnomen# 
            root@debian12:/etc# grep -i tecnomen /etc/sudoers
            tecnomen	ALL=(ALL:ALL) ALL
            root@debian12:/etc# 

            $ sudo -s
            [sudo] password for foobar: 
            foobar is not in the sudoers file.
            $ 
            ```
    - If the user is not in sudo list
        - Run `su -l`
            ```
            $ su -l
            Password: 
            ... loading /etc/profile
            ... loading /etc/bash.bashrc
            root@debian12:~# 
            root@debian12:~# 
            ```        
- Use `\` to split commands into different lines
    ```
    $ gconftool-2 \
    --set "/abc/def" \
    --type integer "0"
    ```
- Looking for help for commands?
    - `command --help`
    - `man command`
        - `man range command` - e.g., `man 3 printf`
            - 1 - user commands
            - 2 - system calls
            - 3 - c functions
            - 4 - file formats, device files
            - 5 - configuration files
            - 6 - games
            - 7 - miscellaneous
            - 8 - system administration commands
            - 9 - kernel functions
            - n - new commands
        - `man -a command`
    - `help command` - only works with shell commands, such as `cd` or `alias`
    - `info command` - an alternative to `man`

## Commands

- `cat`
- `less` (or `more`)
    - `less file`
    - `ls -l | less`
    - `ps ax | less`
    - common shortcut keys
        - `g / shift+g` - jump to beginning/end of file
        - `/` - forward search
        - `?` - backward search
        - `n / shift+n` - repeats forward/backward search        
- `ls`
    - `ls -l`
- `reset` - reset the terminal (e.g., the terminal shows only cryptic characters...)
- `tail`
