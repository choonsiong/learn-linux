# `bash` Shell

- `bash` configuration files
    - global
        - `/etc/profile` - used to set environment variables
        - `/etc/bashrc` - used to configure `bash` functions intended for interactive use (not scripts), e.g., aliases, extend the path, modify properties of `bash`
            - `/etc/bash.bashrc` - debian and ubuntu            
        - `/etc/inputrc` - configuration of the keyboard and apply to the `readline` library
    - local
        - `.bash_profile`
        - `.bashrc`
        - `.inputrc`
        - `.bash_login`
        - `.bash_logout`
- The `bash` shell prompt - the content of the prompt is defined by the `PS1` environment variable, e.g., `PS1="\w \$ "`
    - `\u` - user name
    - `\h` - host name
    - `\w` - entire current directory
    - `\W` - last part of the current directory
    - `\$` - prompt ending (`$` or `#`)