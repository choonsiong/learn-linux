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
- To switch to `zsh`, install `zsh` with `sudo apt install zsh`
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