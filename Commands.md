# Commands

- `cat`
- `cd`
    - `cd -`
    - `cd ~`
    - `cd ..`
- `chgrp`
- `chmod`
- `chown`
- `cp`
    - `cp -r source /tmp/dest`
        - if dest exists, then becomes /tmp/dest/source
        - if dest doesn't exists, then becomes /tmp/dest with contents from source
    - `cp -a` to preserve access rights and times (-r included)
- `df`
    - `df -h`
        ```
        root@debian12:~# df -h
        Filesystem      Size  Used Avail Use% Mounted on
        udev            1.9G     0  1.9G   0% /dev
        tmpfs           393M  1.4M  391M   1% /run
        /dev/sda2        62G  5.9G   53G  11% /
        tmpfs           2.0G     0  2.0G   0% /dev/shm
        tmpfs           5.0M  8.0K  5.0M   1% /run/lock
        /dev/sda1       512M  6.1M  506M   2% /boot/efi
        mbp2022backup   4.6T  3.5T  1.1T  77% /media/psf/mbp2022backup
        iCloud          3.7T  868G  2.8T  24% /media/psf/iCloud
        tmpfs           393M   76K  393M   1% /run/user/112
        tmpfs           393M   60K  393M   1% /run/user/1001
        root@debian12:~#

        root@debian12:~# df -h -x tmpfs -x squashfs
        Filesystem      Size  Used Avail Use% Mounted on
        udev            1.9G     0  1.9G   0% /dev
        /dev/sda2        62G  5.9G   53G  11% /
        /dev/sda1       512M  6.1M  506M   2% /boot/efi
        mbp2022backup   4.6T  3.5T  1.1T  77% /media/psf/mbp2022backup
        iCloud          3.7T  868G  2.8T  24% /media/psf/iCloud
        root@debian12:~# 

        root@debian12:~# df -h /root
        Filesystem      Size  Used Avail Use% Mounted on
        /dev/sda2        62G  5.9G   53G  11% /
        root@debian12:~#         
        ```    
- `du`
    - `du -h`
        ```
        root@debian12:~# du -h /root
        4.0K	/root/.local/share/nano
        8.0K	/root/.local/share
        12K	/root/.local
        4.0K	/root/.ssh
        4.0K	/root/.cache
        4.0K	/root/.config/procps
        8.0K	/root/.config
        48K	/root
        root@debian12:~#

        root@debian12:~# du -sh /root
        48K	/root
        root@debian12:~#
        ```        
- `export` - lists environment variables
    ```
    foobar@debian12:~$ export
    declare -x DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1001/bus"
    declare -x HOME="/home/foobar"
    declare -x LANG="en_US.UTF-8"
    declare -x LC_CTYPE="UTF-8"
    declare -x LOGNAME="foobar"
    declare -x LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:"
    declare -x MOTD_SHOWN="pam"
    declare -x OLDPWD
    declare -x PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
    declare -x PWD="/home/foobar"
    declare -x SHELL="/usr/bin/bash"
    declare -x SHLVL="1"
    declare -x SSH_CLIENT="10.211.55.2 51146 22"
    declare -x SSH_CONNECTION="10.211.55.2 51146 10.211.55.7 22"
    declare -x SSH_TTY="/dev/pts/0"
    declare -x TERM="xterm-256color"
    declare -x USER="foobar"
    declare -x XDG_DATA_DIRS="/usr/share/gnome:/usr/local/share/:/usr/share/"
    declare -x XDG_RUNTIME_DIR="/run/user/1001"
    declare -x XDG_SESSION_CLASS="user"
    declare -x XDG_SESSION_ID="8"
    declare -x XDG_SESSION_TYPE="tty"
    foobar@debian12:~$ 
    ```
- `find`
    - `find` - returns a list of all files in the current and in all subdirectories
    - `find . -name '*.log'`
    - `find -maxdepth 1 -type f -name '.*'`
    - `find /var/log -path '*http/*.log'`
    - `find /etc -type d | sort`
    - `find /home -group users -mtime -5` - modified in the last five days
    - `find /home -group users -mtime +5` - modified more than five days ago
    - `find /home -group users -mtime 5` - modified exactly five days ago
    - `find -name '*.log' -type f -exec grep -q emacs {} \; -print`
    - `find -name '*' -maxdepth 1 -size -10k -exec grep -q case.*in {} \; -print > result`
- `fsck`
- `fuser` - determine which programs access a particular file or directory
    ```
    [root@client2 ~]# 
    [root@client2 ~]# fuser -v .
                        USER        PID ACCESS COMMAND
    /root:               root       1145 ..c.. bash
    [root@client2 ~]#
    ```
- `grep`
    - `grep emacs *.tex`
    - `grep -c 'arctan\(.*\)' *.c`
    - `grep -v '^#' file | cat -s > nocomments`
- `groups`
    ```
    [foobar@client2 tmp]$ groups foobar
    foobar : foobar wheel
    [foobar@client2 tmp]$ 

    [foobar@client2 tmp]$ 
    [foobar@client2 tmp]$ groups
    foobar wheel
    [foobar@client2 tmp]$ 
    [foobar@client2 tmp]$    
    ```
- `ionice` - set io priority
    - `ionice -c 3 cat /dev/vg1/snap | lzop -c > /backup/image.lzo`
- `iotop`
    - `iotop -o` - restricts output to processes that actually cause IO activity
    - `iotop -u` - restricts output to your own processes
- `kill`
    - `kill PID`
    - `kill -9 PID`
- `killall`
    - `killall -9 firefox`
        - all processes of this name will be terminated
- `less` (or `more`)
    - `less file`
    - `ls -l | less`
    - `ps ax | less`
    - common shortcut keys
        - `g / shift+g` - jump to beginning/end of file
        - `/` - forward search
        - `?` - backward search
        - `n / shift+n` - repeats forward/backward search        
- `ln`
    - `ln abc xyz` - create hard link
    - `ln -s abc xyz` - create soft link
- `locate`
- `ls`
    - `ls -l`
    - `ls -li` - shows inode
    - `ls -lStr` - size, modification time, reverse
    - `ls -lR` - list all files from subdirectories also
    - `ls *.log | sed 's/\(.*\)\.log$/cp & \1.txt/' | sh` - copy all *.log to *.txt
        - `.*` in sed means anything (any number of any characters, except newline)
- `mapfile` - to read an entire text file line by line into the elements of an array
    ```
    foobar@debian12:~$ cat users.txt 
    foobar
    alice
    john
    david
    jason
    lily
    vivian
    foobar@debian12:~$ cat demo.sh 
    #!/bin/bash

    mapfile usernames < users.txt

    for item in "${usernames[@]}"; do
        echo -n "$item"
    done

    foobar@debian12:~$ ./demo.sh 
    foobar
    alice
    john
    david
    jason
    lily
    vivian
    foobar@debian12:~$ 
    ```
- `mkfifo`
- `newgrp` - set new primary group
- `nice` - to launch programs with reduced or increased priority
    - ranging from 19 (very low) to -20 (very high)
    - by default, processes are started with priority 0
    - `nice -n 10 ./backup-script`
- `pidof`
    ```
    [root@client2 ~]# 
    [root@client2 ~]# pidof sshd
    1092 1072 775
    [root@client2 ~]# 
    ```
- `printenv` - lists only environment variables
    ```
    foobar@debian12:~$ printenv
    SHELL=/usr/bin/bash
    PWD=/home/foobar
    LOGNAME=foobar
    XDG_SESSION_TYPE=tty
    MOTD_SHOWN=pam
    HOME=/home/foobar
    LANG=en_US.UTF-8
    LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:
    SSH_CONNECTION=10.211.55.2 51146 10.211.55.7 22
    XDG_SESSION_CLASS=user
    TERM=xterm-256color
    USER=foobar
    SHLVL=1
    XDG_SESSION_ID=8
    LC_CTYPE=UTF-8
    XDG_RUNTIME_DIR=/run/user/1001
    SSH_CLIENT=10.211.55.2 51146 22
    XDG_DATA_DIRS=/usr/share/gnome:/usr/local/share/:/usr/share/
    PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
    DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1001/bus
    SSH_TTY=/dev/pts/0
    _=/usr/bin/printenv
    foobar@debian12:~$
    ```
- `ps`
    - process name in square brackets are processes of the kernel
        ```
        [foobar@client2 ~]$ ps ax
            PID TTY      STAT   TIME COMMAND
            1 ?        Ss     0:00 /usr/lib/systemd/systemd rhgb --switched-root --system --deserialize 31
            2 ?        S      0:00 [kthreadd]
            3 ?        S      0:00 [pool_workqueue_]
            4 ?        I<     0:00 [kworker/R-rcu_g]
            5 ?        I<     0:00 [kworker/R-rcu_p]
            6 ?        I<     0:00 [kworker/R-slub_]
            7 ?        I<     0:00 [kworker/R-netns]
            10 ?        I      0:00 [kworker/u8:0-events_unbound]
            11 ?        I<     0:00 [kworker/R-mm_pe]
            13 ?        I      0:00 [rcu_tasks_kthre]
            14 ?        I      0:00 [rcu_tasks_rude_]
            15 ?        I      0:00 [rcu_tasks_trace]
            16 ?        S      0:00 [ksoftirqd/0]
            17 ?        I      0:00 [rcu_preempt]
            18 ?        S      0:00 [migration/0]
            19 ?        I      0:01 [kworker/0:1-events]
        ```    
- `pstree`
    ```
    [root@client2 ~]# pstree
    systemd─┬─NetworkManager───2*[{NetworkManager}]
            ├─agetty
            ├─atd
            ├─auditd─┬─sedispatch
            │        └─2*[{auditd}]
            ├─chronyd
            ├─crond
            ├─dbus-broker-lau───dbus-broker
            ├─firewalld───{firewalld}
            ├─gssproxy───5*[{gssproxy}]
            ├─irqbalance───{irqbalance}
            ├─lsmd
            ├─polkitd───5*[{polkitd}]
            ├─rhsmcertd───{rhsmcertd}
            ├─rpcbind
            ├─rsyslogd───2*[{rsyslogd}]
            ├─sshd───sshd───sshd───bash───su───bash───pstree
            ├─systemd───(sd-pam)
            ├─systemd-journal
            ├─systemd-logind
            ├─systemd-udevd
            └─tuned───3*[{tuned}]
    [root@client2 ~]#
    ```
- `read` - process user input
    ```
    foobar@debian12:~$ 
    foobar@debian12:~$ ./demo.sh 
    Enter password: 
    Password is: test
    foobar@debian12:~$ cat demo.sh 
    #!/bin/bash

    echo -n "Enter password: "
    read -s password
    echo
    echo "Password is: $password"
    foobar@debian12:~$
    ```
- `renice` - to change the priority of processes that are already running    
- `reset` - reset the terminal (e.g., the terminal shows only cryptic characters...)
- `rm`
    - `rm -rf`
    - `rm $(find . -name '*~')` - delete all backup files in the current and all subdirectories
- `rmdir`
    - only workds if directory is empty
- `set` - lists all variables
- `stat`
    - `stat -c "%a %n" *`
- `su`
    - `su -l root`
        - `-l` ensures that all login start files are imported, which is necessary for the correct definition of `PATH`, among other things
- `sudo`
    - `/etc/sudoers` - the file describes in three columns which users are allowed to run which programs from which computer
    - `foobar` is allowed to execute `/usr/sbin/parted` regardless of the hostname (`ALL`), `=(ALL)` means that `foobar` may execute the command under any account
        ```
        foobar	ALL=(ALL) 	/usr/sbin/parted
        ```            
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
- `top`
- `ulimit` - to limit the maximum memory consumption, the maximum size of created files, etc.
    ```
    [root@client2 ~]# ulimit
    unlimited
    [root@client2 ~]# 
    ```
- `umask` - a numerical value that specifies the bits that are subtracted from the standard access bits
    ```
    [foobar@client2 tmp]$ 
    [foobar@client2 tmp]$ umask
    0022
    [foobar@client2 tmp]$ 
    [foobar@client2 tmp]$ ls -l demo
    -rw-r--r-- 1 foobar foobar 0 Apr 24 19:27 demo
    [foobar@client2 tmp]$ 
    [foobar@client2 tmp]$ 
    [foobar@client2 tmp]$ umask 2
    [foobar@client2 tmp]$ 
    [foobar@client2 tmp]$ touch demo2
    [foobar@client2 tmp]$ 
    [foobar@client2 tmp]$ ls -l demo2
    -rw-rw-r-- 1 foobar foobar 0 Apr 24 19:36 demo2
    [foobar@client2 tmp]$ 
    [foobar@client2 tmp]$ ls -l demo
    -rw-r--r-- 1 foobar foobar 0 Apr 24 19:27 demo
    [foobar@client2 tmp]$
    ```
- `usermod`
    - `usermod -a -G dialout foobar`
- `whereis`
- `which`    