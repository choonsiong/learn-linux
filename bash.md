# `bash` Shell

- Different ways of using the `bash` shell
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