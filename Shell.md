# Shell

- A shell is responsible for the execution of the programs in the terminal.
    - On Linux, there are multiple shells to choose from.
- A *login shell* exists when you log in to a text console or when you work via SSH on an external computer. This means that the shell is started immediately after authentication and then (interactively) accepts and processes your commands.
- On the other hand, we speak of an *interactive shell* if the login has already happened earlier and the shell is started later - if required. This is always true if you first log into a desktop system and then open a terminal window. There again a shell is started, which waits for your commands.
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
        - `man range command` - `man 3 printf`
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
