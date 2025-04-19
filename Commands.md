# Commands

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
- `mkfifo`
- `reset` - reset the terminal (e.g., the terminal shows only cryptic characters...)
- `tail`
- `tee` - the standard output is first forwarded to the `tee` command, 
    ```
    tecnomen@debian12:~$ ls | tee /tmp/output.txt
    Desktop
    Documents
    Downloads
    Music
    Pictures
    Public
    Templates
    Videos
    bin
    tecnomen@debian12:~$ cat /tmp/output.txt 
    Desktop
    Documents
    Downloads
    Music
    Pictures
    Public
    Templates
    Videos
    bin
    tecnomen@debian12:~$

    tecnomen@debian12:~$ ls -l | tee /tmp/output.txt | sort -k 5 -n > /tmp/output2.txt
    tecnomen@debian12:~$ 
    tecnomen@debian12:~$ cat /tmp/output.txt 
    total 36
    drwxr-xr-x 2 tecnomen tecnomen 4096 Apr 17 21:13 Desktop
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Documents
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Downloads
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Music
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Pictures
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Public
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Templates
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Videos
    drwxr-xr-x 2 tecnomen tecnomen 4096 Apr  2 17:01 bin
    tecnomen@debian12:~$ cat /tmp/output2.txt 
    total 36
    drwxr-xr-x 2 tecnomen tecnomen 4096 Apr  2 17:01 bin
    drwxr-xr-x 2 tecnomen tecnomen 4096 Apr 17 21:13 Desktop
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Documents
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Downloads
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Music
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Pictures
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Public
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Templates
    drwxr-xr-x 2 tecnomen tecnomen 4096 Mar 31 17:59 Videos
    tecnomen@debian12:~$ 
    tecnomen@debian12:~$ 
    ```