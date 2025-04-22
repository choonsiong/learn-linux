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