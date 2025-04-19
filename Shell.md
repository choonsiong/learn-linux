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
- Search for commands
    - `whereis name` - searches all default directories
    - `which name` - searches all directories contained in `PATH`
    - `type name` - similar to `which`, but also takes into account commands that are built into `bash` or defined as aliases
    ```
    foobar@debian12:/etc$ type find
    find is /usr/bin/find
    foobar@debian12:/etc$ whereis find
    find: /usr/bin/find /usr/share/man/man1/find.1.gz /usr/share/info/find.info-2.gz /usr/share/info/find.info.gz /usr/share/info/find.info-1.gz
    foobar@debian12:/etc$ 
    foobar@debian12:/etc$ which find
    /usr/bin/find
    foobar@debian12:/etc$ 
    ```
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
- Input and output redirection
    - Three standard files (file descriptors)
        - standard input `<`
            - `cat < file`
        - standard output `>`
            - `ls -l > output.txt`
            - `ls -l >> output.txt` (append)
            - `(ls; date) > output.txt` (both commands are executed by a single shell)
                - the parentheses cause the two commands to be executed within a new shell (a subshell) and therefore also provide a common result
        - standard error `2>`
            - `ls -l > output.txt 2> error.txt`
        > It is not possible to edit a file and write the result back to this file at the same time! `sort file > file` or `sort < file > file` causes `file` to be deleted! Use `sponge` from `moreutils` instead.
        ```
        root@debian12:~# sponge -help
        sponge [-a] <file>: soak up all input from stdin and write it to <file>
        root@debian12:~# sponge /tmp/output.txt
        abc
        def
        ghi
        jkl
        root@debian12:~# cat /tmp/output.txt 
        abc
        def
        ghi
        jkl
        root@debian12:~#
        ```
- Pipes `|` - the output of the first command is used as input for the second command
    - `ls -l | less`
- Using FIFO files - FIFO stands for first in, first out and implements the idea of a pipe as a file
    - In practice, they are used so that two independent programs can communicate with each other
        - The following three commands first set up a FIFO file, then `ls` is started as a background process, which writes its outputs to the file.
            ```
            tecnomen@debian12:/tmp$ mkfifo myfifo
            tecnomen@debian12:/tmp$ ls -l myfifo
            prw-r--r-- 1 tecnomen tecnomen 0 Apr 19 21:05 myfifo
            tecnomen@debian12:/tmp$ 
            tecnomen@debian12:/tmp$ ls -l > myfifo &
            [1] 163138
            tecnomen@debian12:/tmp$ 
            tecnomen@debian12:/tmp$ less < myfifo
            [1]+  Done                    ls --color=auto -l > myfifo
            ```
        - Only commands that read the commands to be processed from the default input channel are suitable for formulating a pipe (else use `xargs`)
- Executing commands
    - `cmd1; cmd2`- executes the commands one after the after
        - `ls; date`
    - `cmd1 && cmd2` - executes command 2 if command 1 was successful
        - `apt update && apt full-upgrade -y`
    - `cmd1 || cmd2` - executes command 2 if command 1 returns an error
    - `cmd &` - starts the command in the background
    - `cmd1 & cmd2` - starts command 1 in the background, command 2 in the foreground
    - `(cmd1 ; cmd2)` - executes both commands in the same shell
- Scripts or programs stored in the currently active directory cannot be executed easily for security reasons. Rather, you must prefix the script name with `./`, such as `./myscript`, where `.` is an abbreviation for the current directory.
- Running commands in the background
    - `firefox &`
    - `find / -name '*sh' > result &`
    > If you forget the `&` character when starting a command, you can interrupt the program using `Ctrl+Z` and continue it as a background process via `bg`