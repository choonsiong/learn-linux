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
- `bash` aliases - to define abbreviations
    - `alias cdtmp='cd /tmp'
        ```
        foobar@debian12:~$ alias cdtmp='cd /tmp'
        foobar@debian12:~$ cdtmp
        foobar@debian12:/tmp$ pwd
        /tmp
        foobar@debian12:/tmp$ 
        ```
    - alias calls can be nested
    - alias abbreviation take precedence over commands with the same name, e.g., `alias more=less`
        ```
        foobar@debian12:/tmp$ alias more=less
        foobar@debian12:/tmp$ type more
        more is aliased to `less'
        foobar@debian12:/tmp$ \more --help

        Usage:
        more [options] <file>...

        A file perusal filter for CRT viewing.

        Options:
        -d, --silent          display help instead of ringing bell
        -f, --logical         count logical rather than screen lines
        -l, --no-pause        suppress pause after form feed
        -c, --print-over      do not scroll, display text and clean line ends
        -p, --clean-print     do not scroll, clean screen and display text
        -e, --exit-on-eof     exit on end-of-file
        -s, --squeeze         squeeze multiple blank lines into one
        -u, --plain           suppress underlining and bold
        -n, --lines <number>  the number of lines per screenful
        -<number>             same as --lines
        +<number>             display file beginning from line number
        +/<pattern>           display file beginning from pattern match

        -h, --help            display this help
        -V, --version         display version

        For more details see more(1).
        foobar@debian12:/tmp$ /bin/more --help

        Usage:
        more [options] <file>...

        A file perusal filter for CRT viewing.

        Options:
        -d, --silent          display help instead of ringing bell
        -f, --logical         count logical rather than screen lines
        -l, --no-pause        suppress pause after form feed
        -c, --print-over      do not scroll, display text and clean line ends
        -p, --clean-print     do not scroll, clean screen and display text
        -e, --exit-on-eof     exit on end-of-file
        -s, --squeeze         squeeze multiple blank lines into one
        -u, --plain           suppress underlining and bold
        -n, --lines <number>  the number of lines per screenful
        -<number>             same as --lines
        +<number>             display file beginning from line number
        +/<pattern>           display file beginning from pattern match

        -h, --help            display this help
        -V, --version         display version

        For more details see more(1).
        foobar@debian12:/tmp$ 
        ```    