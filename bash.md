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
    - `\t` - current time
    - `\d` - current date
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
    - use `unalias` to delete an alias
    - to see all aliases `alias`
        ```
        foobar@debian12:/tmp$ alias
        alias cdtmp='cd /tmp'
        alias ls='ls --color=auto'
        alias more='less'
        foobar@debian12:/tmp$ 
        ```
- Shell globbing and substitution/expansion
    - `bash` replaced the search pattern with actual matching file names
    - special characters for globbing and substitution in bash
        - `?` - exactly one character
        - `*` - any number (also zero) or arbitrary characters (but no .* files!)
            - by default, `*` does not take files or directories into account that start with a dot (hidden files or directories)
                - use `shopt -s dotglob` to enable capture of hidden files or directories (`shopt -u dotglob` to disable)
            - use `echo` to test the function of special characters
                ```
                foobar@debian12:~$ echo /*
                /bin /boot /dev /etc /home /lib /lost+found /media /mnt /opt /proc /root /run /sbin /srv /sys /tmp /usr /var
                foobar@debian12:~$ 

                foobar@debian12:~$ echo /[a-f]*
                /bin /boot /dev /etc
                foobar@debian12:~$ 
                ```            
        - `**` - all files and directories, also from all subdirectories (from bash 4.0 with `shopt -s globstar`)
            - `ls **/*.pdf` - show all PDF files in the current directory and all subdirectories
        - `[abc]` - one of the specified characters
        - `[a-f]` - a character from the specified range
        - `[!abc]` - none of the specified characters
        - `[^abc]` - none of the specified characters
        - `~` - abbreviation for home directory
        - `.` - current directory
        - `..` - parent directory
        - `ab{1,2,3}` (brace expansion) - returns ab1 ab2 ab3
            ```
            foobar@debian12:~$ echo {a,b}{1,2,3}
            a1 a2 a3 b1 b2 b3
            foobar@debian12:~$ 

            foobar@debian12:~$ echo {z..r}
            z y x w v u t s r
            foobar@debian12:~$ 

            foobar@debian12:~$ echo {1..5}
            1 2 3 4 5
            foobar@debian12:~$ 
            ```
        - `a{1..4}` - returns a1 a2 a3 a4
        - `$varname` - returns the content of the variable
        - `$((3*4))` (arithmetic expansion) - arithmetic calculations; returns 12
            - `+ - * / % == != < <= > >= << >> !&& ||` - all calculations are performed for 32-bit integers
                ```
                foobar@debian12:~$ x=1
                foobar@debian12:~$ y=2
                foobar@debian12:~$ echo $(($x+$y))
                3
                foobar@debian12:~$ 

                foobar@debian12:~$ x=3
                foobar@debian12:~$ y=3
                foobar@debian12:~$ z=$((x+y))
                foobar@debian12:~$ echo $z
                6
                foobar@debian12:~$
                ```
            - or use `$[expression]` or `expr` command            
        - `$(command)` or \`command\` (command substitution) - replaces the command with its result
            ```
            foobar@debian12:~$ ls -l $(find /usr/share -name '*README*') | head -5
            find: '/usr/share/polkit-1/rules.d': Permission denied
            -rw-r--r-- 1 root root  1712 Feb  9  2022 /usr/share/X11/xkb/compat/README
            -rw-r--r-- 1 root root   461 Feb  9  2022 /usr/share/X11/xkb/geometry/README
            -rw-r--r-- 1 root root   416 Feb  9  2022 /usr/share/X11/xkb/keycodes/README
            -rw-r--r-- 1 root root    91 Feb  9  2022 /usr/share/X11/xkb/rules/README
            -rw-r--r-- 1 root root   246 Feb  9  2022 /usr/share/X11/xkb/types/README
            foobar@debian12:~$ 
            foobar@debian12:~$ 
            foobar@debian12:~$ find /usr/share -name '*README*' | xargs ls -l | head -5
            find: '/usr/share/polkit-1/rules.d': Permission denied
            -rw-r--r-- 1 root root  1712 Feb  9  2022 /usr/share/X11/xkb/compat/README
            -rw-r--r-- 1 root root   461 Feb  9  2022 /usr/share/X11/xkb/geometry/README
            -rw-r--r-- 1 root root   416 Feb  9  2022 /usr/share/X11/xkb/keycodes/README
            -rw-r--r-- 1 root root    91 Feb  9  2022 /usr/share/X11/xkb/rules/README
            -rw-r--r-- 1 root root   246 Feb  9  2022 /usr/share/X11/xkb/types/README
            xargs: ls: terminated by signal 13
            foobar@debian12:~$
            foobar@debian12:~$ a=$(pwd)
            foobar@debian12:~$ echo $a
            /home/foobar
            foobar@debian12:~$                          
            ```
        - `command "character"`
        - `command 'character'`    
- Use `set -x` to see how `bash` works internally, `bash` then displays the way the command line is parsed before executing any further command
- Variables
    - `bash` variables can only store strings
        ```
        foobar@debian12:~$ var='abc'
        foobar@debian12:~$ echo $var
        abc
        foobar@debian12:~$ echo "${var}"
        abc
        foobar@debian12:~$ echo "abc${var}"
        abcabc
        foobar@debian12:~$ 
        ```
- Environment variables
    - `export varname`
    - `declare -x varname`
    - predefined environment variables
        - `BASH`
        - `HOME`
        - `LOGNAME`
        - `HOSTNAME`
        - `OLDPWD`
        - `PATH`
        - `PROMPT_COMMAND` - can contain a command that is executed each time before `bash` displays the command prompt
        - `PS1`
        - `PS2` - for multiline entries, default is `>`
        - `PWD`
        - `RANDOM` - a random number between 0 and 32767
        ```
        foobar@debian12:~$ echo $BASH
        /usr/bin/bash    
        foobar@debian12:~$ echo $HOME
        /home/foobar
        foobar@debian12:~$ echo $LOGNAME
        foobar
        foobar@debian12:~$ echo $HOSTNAME
        debian12
        foobar@debian12:~$ echo $OLDPWD

        foobar@debian12:~$ echo $PATH
        /usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
        foobar@debian12:~$ echo $PROMPT_COMMAND

        foobar@debian12:~$ echo $PS1
        \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
        foobar@debian12:~$ echo $PS2
        >
        foobar@debian12:~$ echo $PWD
        /home/foobar
        foobar@debian12:~$ echo $RANDOM
        5717
        foobar@debian12:~$
        ```
- Predefined shell variables
    - `$?` - return value of the last command
    - `$!` - PID of the last started background process
    - `$$` - PID of the current shell
    - `$0` - filename of the currently executed shell script (or of the symbolic link referencing the file)
    - `$#` - number of parameters passed to the shell program
    - `$1` to `$9` - parameters 1 to 9
    - `$*` or `$@` - totality of all passed parameters