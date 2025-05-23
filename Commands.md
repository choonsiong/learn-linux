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
    - `cp -a /etc/* /tmp/etc-backup` - backup everything in `etc`
        - `cp -a /etc /tmp/etc-backup`
- `crontab`
    - `crontab -e`
- `curl`
    - `curl -T file -u username:password ftp://backupserver/dir` - transfer file to the FTP server and saves it in the `dir` directory
    - `tar czf - dir/ | curl -T - -u username:password ftp://backupserver/name.tgz` - saves the result of the `tar` command directly in the `name.tgz` file remotely
    - `curl https://abc.xyz`
    - [Everything Curl](https://everything.curl.dev/index.html)
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
- `dpkg-reconfigure`
    - `dpkg-reconfigure tzdata`
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
- `ftp`
    - `ftp user@host`
    - `ftp host`
    - other ftp programs, `wget`, `curl`, `lftp`, `ncftp`, `sftp`
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
    - `grep -r -i something` - search all subdirectories for files whose contents contain the word something
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
- `hostname` - displays the host name
    - `hostname -I` - shows the IP addresses under which the computer is visible to the outside world or within the local network
        ```
        tecnomen@ubuntu-tecnotree:~$ 
        tecnomen@ubuntu-tecnotree:~$ hostname
        ubuntu-tecnotree
        tecnomen@ubuntu-tecnotree:~$ 
        tecnomen@ubuntu-tecnotree:~$ hostname -I
        10.211.55.4 172.17.0.1 192.168.49.1 192.168.240.218 fdb2:2c26:f4e4:0:e659:140f:ebce:3b52 fdb2:2c26:f4e4:0:f56f:6f0d:13a:a405 
        tecnomen@ubuntu-tecnotree:~$ 
        tecnomen@ubuntu-tecnotree:~$ 
        ```    
- `ionice` - set io priority
    - `ionice -c 3 cat /dev/vg1/snap | lzop -c > /backup/image.lzo`
- `iotop`
    - `iotop -o` - restricts output to processes that actually cause IO activity
    - `iotop -u` - restricts output to your own processes
- `ip`
    - `ip addr`
        - `ip addr show interface`
            ```
            [foobar@client1 ~]$ ip addr show enp0s5
            2: enp0s5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
                link/ether 00:1c:42:f1:9e:86 brd ff:ff:ff:ff:ff:ff
                inet 10.211.55.12/24 brd 10.211.55.255 scope global dynamic noprefixroute enp0s5
                valid_lft 1162sec preferred_lft 1162sec
                inet6 fdb2:2c26:f4e4:0:21c:42ff:fef1:9e86/64 scope global dynamic noprefixroute 
                valid_lft 2591682sec preferred_lft 604482sec
                inet6 fe80::21c:42ff:fef1:9e86/64 scope link noprefixroute 
                valid_lft forever preferred_lft forever
            [foobar@client1 ~]$ 
            ```
            - the address beginning with `fe80` is only intended for internal communication on the local network            
    - `ip link` - returns a list of all network interfaces
        ```
        [foobar@client2 ~]$ ip link
        1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
            link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        2: enp0s5: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
            link/ether 00:1c:42:3a:9e:c0 brd ff:ff:ff:ff:ff:ff
        [foobar@client2 ~]$ 
        ```    
        - `lo` denotes the loopback interface, which is a virtual internal network interface that is always assigned the local address `127.0.0.1` (IPv4) and `::1` (IPv6)
            - local programs on the computer can communicate with each other via these addresses
    - `ip route, ip -6 route` - check the gateway configuration
        ```
        [foobar@client1 ~]$ 
        [foobar@client1 ~]$ ip route
        default via 10.211.55.1 dev enp0s5 proto dhcp src 10.211.55.12 metric 100 
        10.211.55.0/24 dev enp0s5 proto kernel scope link src 10.211.55.12 metric 100 
        [foobar@client1 ~]$ 
        [foobar@client1 ~]$ ip -6 route
        ::1 dev lo proto kernel metric 256 pref medium
        fdb2:2c26:f4e4::/64 dev enp0s5 proto ra metric 100 pref medium
        fe80::/64 dev enp0s5 proto kernel metric 1024 pref medium
        default via fe80::21c:42ff:fe00:18 dev enp0s5 proto ra metric 100 pref medium
        [foobar@client1 ~]$ 
        ```    
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
- `lftp`
    - `lftp -c "open -u username,password backupserver; put www.tgz`
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
- `lsof`
    - `lsof -i :8080` - shows processes using TCP or UDP port 8080
    - `lsof -i` - list all open network connections
    - `lsof -u alice` - show all files opened by alice
    - `lsof +D /var/log` - find all open files in a directory
    - `lsof | grep deleted` - find deleted files still held open
    - `lsof -p PID` - see files opened by a process with a specific PID
    - `lsof /path/to/file` - find out which process is using a file
    - `lsof -iTCP`, `lsof -iUDP` - list open network files by protocol
    - `lsof -iTCP:443 -sTCP:LISTEN` - see which process is listening on a specific port
    - `lsof -nP` - list all open files with their file descriptors
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
- `mtr` - periodically sends network packets to the specified host and analyzes the responses
    - `mtr -c 10 -r google.com`
        ```
        root@debian12:~# mtr -c 10 -r  google.com
        Start: 2025-04-25T15:59:28+0800
        HOST: debian12                    Loss%   Snt   Last   Avg  Best  Wrst StDev
        1.|-- kul08s12-in-f14.1e100.net  0.0%    10    9.9  14.4   8.3  19.0   4.2
        root@debian12:~# 
        ```
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
- `ping`
    - `ping -4|-6`
        ```
        [foobar@client1 ~]$ 
        [foobar@client1 ~]$ ping -4 localhost
        PING  (127.0.0.1) 56(84) bytes of data.
        64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.081 ms
        64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.086 ms
        ^C
        ---  ping statistics ---
        2 packets transmitted, 2 received, 0% packet loss, time 1057ms
        rtt min/avg/max/mdev = 0.081/0.083/0.086/0.002 ms
        [foobar@client1 ~]$ ping -6 localhost
        PING localhost(localhost (::1)) 56 data bytes
        64 bytes from localhost (::1): icmp_seq=1 ttl=64 time=0.111 ms
        64 bytes from localhost (::1): icmp_seq=2 ttl=64 time=0.444 ms
        64 bytes from localhost (::1): icmp_seq=3 ttl=64 time=0.117 ms
        ^C
        --- localhost ping statistics ---
        3 packets transmitted, 3 received, 0% packet loss, time 2092ms
        rtt min/avg/max/mdev = 0.111/0.224/0.444/0.155 ms
        [foobar@client1 ~]$
        ```
    - `ping -c 2 google.com` - this command tests both the reachability of the name server and the function of the gateway
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
- `rsync` - to copy or synchronize entire directory trees
- `scp`
    - `scp abc.txt desthost:~/tmp/`
    - `scp foobar@[2001:1234:5678::1]:file.txt .` - when use IPv6, enclose it in the square bracket
    - `scp -rp srcdir user@desthost:/destdir`
- `set` - lists all variables
- `ssh`
    - `ssh user@host command options` - run a command directly on the remote computer
    - `ssh user@host tar -cf - /var/www | tar -xC /tmp/ -f -` - this command run `tar` on the remote machine, redirect the archive it creates to standard output (enter a dash `-` after the `-f` option), and use the standard output with `|` as input for a second `tar` command that runs locally
        - this allows you to copy an entire directory tree securely via ssh
    - to run multiline commands remotely (the `-T` option prevents SSH from trying to open a pseudoterminal)
        ```
        [foobar@client2 ~]$ ssh -T root@client1 <<ENDSSH
        > echo foobar:password | chpasswd
        > rm -f /tmp/file1
        > cp /tmp/file2 /tmp/file1
        > ENDSSH
        root@client1's password: 
        [foobar@client2 ~]$ 
        ```        
    - *SSH tunnel* - provides a secure way to transfer IP packets between two computers - even if there is a firewall between the two computers that actually blocks the port
        - if the tunneling is done from the client computer, use `-L localport:localhost:remoteport`
            - `ssh -L 8080:localhost:80 username@remote` - causes port 80 of remote host to be accessible through port 8080 of the local host
                - `-N` 
- `ssh-keygen`
    - `ssh-keygen -f "/home/foobar/.ssh/known_hosts" -R "myhost"` - remove existing key from known host
- `sshfs` - to integrate the file system of an external computer into the local directory
    - `sshfs user@host /media/data`
- `stat`
    - `stat -c "%a %n" *`
- `su`
    - `su -l root`
        - `-l` ensures that all login start files are imported, which is necessary for the correct definition of `PATH`, among other things
- `sudo`
    - `/etc/sudoers` - the file describes in three columns which users are allowed to run which programs from which computer
        - `foobar` is allowed to execute `/usr/sbin/parted` regardless of the hostname (`ALL`), `=(ALL)` means that `foobar` may execute the command under any  account - as root, but also as alice etc.
            ```
            foobar	ALL=(ALL) 	/usr/sbin/parted
            ```            
        - if the first column is prefixed with `%`, the entry applies to all members of the specified group
        - only edit with `visudo` command
    - `sudo -s` - switch to root mode
    - `sudo -u <account>` - select another account, default will run as `root`
    - `sudo -u alice /usr/bin/parted /dev/sda`
    - `sudo ls /etc > /etc/ls-out.txt` will not work (it is executed directly by the sell, not by `sudo`)
        - use `sudo sh -c 'ls /etc > /etc/ls-out.txt'` (passing a shell to `sudo` and executing the desired command in it)
    - `sudo bash script.sh` or `sudo ./script.sh`
- `systemctl`
    - `systemctl start|stop|status|restart|reload|enable|disable name`
    - `systemctl enable --now name`
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
- `telnet` - doesn't encrypt any data, should never be used to work on external computers
    - but... it is good for checking whether a network service is running on an external computer on a certain port and waiting for a connection to established `telnet host port`
- `timedatectl` - `timedatectl list-timezones`, `timedatectl set-timezone Europe/Athens`
    ```
    root@debian12:~# timedatectl 
                Local time: Sun 2025-04-27 17:33:27 +08
            Universal time: Sun 2025-04-27 09:33:27 UTC
                    RTC time: Sun 2025-04-27 09:33:28
                    Time zone: Asia/Kuala_Lumpur (+08, +0800)
    System clock synchronized: no
                NTP service: inactive
            RTC in local TZ: no
    root@debian12:~# 
    
    root@debian12:~# timedatectl list-timezones | grep Asia/K
    Asia/Kabul
    Asia/Kamchatka
    Asia/Karachi
    Asia/Kashgar
    Asia/Kathmandu
    Asia/Katmandu
    Asia/Khandyga
    Asia/Kolkata
    Asia/Krasnoyarsk
    Asia/Kuala_Lumpur
    Asia/Kuching
    Asia/Kuwait
    root@debian12:~#     
    ```
- `top`
- `traceroute` - to determine which route a network packet takes from your computer to another computer and how many milliseconds the runtime is to the respective intermediate station
    - the command won't work if there is a firewall on one of the intermediate stations that blocks UDP port 33434 used by `traceroute`
        - in this case, `traceroute` returns only three stars for this and all other stations
            ```
            # from macos
            $ traceroute google.com
            traceroute to google.com (216.58.199.238), 64 hops max, 40 byte packets
            1  192.168.0.1 (192.168.0.1)  3.199 ms  5.743 ms  3.062 ms
            2  210.195.255.254 (210.195.255.254)  6.656 ms  6.161 ms  9.447 ms
            3  10.55.49.43 (10.55.49.43)  7.302 ms
                10.55.49.41 (10.55.49.41)  9.230 ms
                10.55.49.43 (10.55.49.43)  9.392 ms
            4  10.55.48.18 (10.55.48.18)  7.729 ms
                10.55.48.14 (10.55.48.14)  8.450 ms
                10.55.48.24 (10.55.48.24)  9.392 ms
            5  72.14.214.196 (72.14.214.196)  11.498 ms
                72.14.204.118 (72.14.204.118)  9.470 ms
                72.14.204.208 (72.14.204.208)  11.321 ms
            6  * * *
            7  142.251.224.18 (142.251.224.18)  11.538 ms  7.749 ms  8.508 ms
            8  kix05s02-in-f14.1e100.net (216.58.199.238)  7.365 ms
                216.239.48.145 (216.239.48.145)  8.172 ms
                192.178.98.222 (192.178.98.222)  7.398 ms

            foobar@debian12:~$ traceroute google.com
            traceroute to google.com (216.58.196.14), 30 hops max, 60 byte packets
            1  kul08s09-in-f14.1e100.net (216.58.196.14)  8.928 ms  8.910 ms  8.899 ms
            foobar@debian12:~$ traceroute yahoo.com
            traceroute to yahoo.com (74.6.231.21), 30 hops max, 60 byte packets
            1  media-router-fp74.prod.media.vip.ne1.yahoo.com (74.6.231.21)  288.063 ms  286.973 ms  282.818 ms
            foobar@debian12:~$ 

            root@debian12:~# traceroute -I google.com
            traceroute to google.com (172.217.174.174), 30 hops max, 60 byte packets
            1  kul08s11-in-f14.1e100.net (172.217.174.174)  12.819 ms  12.751 ms  12.743 ms
            root@debian12:~# 
            ```        
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
- `wget` 
    - `wget ftp://host.com/file`
    - `wget -c ftp://host.com/file` - resume download with `-c`
    - `wget -t 20 --retry-connrefused http://downloadserver.com/bigfile.iso` - `-t 20` - retry up to 20 times after a connection failure
    - `wget -p -k -E -H http://blog.com/page.html` - download all the files necessary to later read offline
        - `wget -r -l 4 -p -k -E http://blog.com` - download recursively (here is 4 levels)
- `whereis`
- `which`    