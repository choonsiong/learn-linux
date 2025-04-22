# `zsh` shell

- `zsh` uses a BSD-style license, while more recent `bash` versions are based on GPL 3.
- As a scripting language, `bash` will probably remain the standard, even though the syntax of `zsh` is the same as `bash` except for a few subtle differences.
- Check running shell
    ```
    $ $echo $0
    -zsh
    $ echo $SHELL
    /bin/zsh
    $

    foobar@debian12:~$ 
    foobar@debian12:~$ echo $0
    -bash
    foobar@debian12:~$ echo $SHELL
    /usr/bin/bash
    foobar@debian12:~$    
    ```
- To switch to `zsh`, use `chsh` (from `passwd` or `util-linux-user` package), install `zsh` with `sudo apt install zsh`
    - Log out and log in again to take effect of the new shell
        ```
        foobar@debian12:~$ 
        foobar@debian12:~$ echo $SHELL
        /usr/bin/bash
        foobar@debian12:~$ 
        foobar@debian12:~$ which zsh
        /usr/bin/zsh
        foobar@debian12:~$ 
        foobar@debian12:~$ chsh -s $(which zsh)
        Password: 
        foobar@debian12:~$ grep foobar /etc/passwd
        foobar:x:1001:1001::/home/foobar:/usr/bin/zsh
        foobar@debian12:~$ 
        ```

| Global          | Local       | Login Shell | Interactive Shell | Script |
| --------------- | ----------- | ----------- | ----------------- | ------ |
| `/etc/zshenv`   | `.zshenv`   | ✅          | ✅                | ✅      |
| `/etc/zshrc`    | `.zshrc`    | ✅          | ✅                |         |     
| `/etc/zprofile` | `.zprofile` | ✅          |                   |         |
| `/etc/zlogin`   | `.zlogin`   | ✅          |                   |         |
| `/etc/zlogout`  | `.zlogout`  | ✅          |                   |         |

- `zsh` configuration files
    - `zsh` parses the global configuration files first, then the local files
        - depends on the distribution, the global configuration files are not located directly in the `/etc` directory, but in the `/etc/zsh` directory (Debian and Ubuntu)
            ```
            foobar@debian12:~$ cd /etc/zsh
            foobar@debian12:/etc/zsh$ ls -al
            total 40
            drwxr-xr-x   2 root root  4096 Mar 31 21:25 .
            drwxr-xr-x 124 root root 12288 Apr 22 15:45 ..
            -rw-r--r--   1 root root  1295 Feb 13  2022 newuser.zshrc.recommended
            -rw-r--r--   1 root root   344 Feb 13  2022 zlogin
            -rw-r--r--   1 root root    58 Feb 13  2022 zlogout
            -rw-r--r--   1 root root   264 Feb 13  2022 zprofile
            -rw-r--r--   1 root root   623 Feb 13  2022 zshenv
            -rw-r--r--   1 root root  3900 Feb 25  2022 zshrc
            foobar@debian12:/etc/zsh$ 
            ```        
        - the two most important configuration files are `.zshenv` and `.zshrc`
            - `.zshenv` is primarily intended for defining environment variables that should also be available in scripts
            - `.zshrc` is the right place to set options for interactive use of `zsh`, to define custom aliases, and so on
        - if `zsh` detects that there are no configuration files in home directory yet, it starts the `zsh-newuser-install` configuration help
            - `man zshoptions`
            - to run `zsh-newuser-install` again
            ```
            autoload -U zsh-newuser-install
            zsh-newuser-install -f
            ```
    - `setopt <name>` enables you to activate an option, `unsetopt <name>` allows you to deactivate it again
        - `setopt` alone lists all currently active options
            ```
            $
            $ setopt
            autocd
            combiningchars
            interactive
            login
            monitor
            shinstdin
            zle
            $
            ```    