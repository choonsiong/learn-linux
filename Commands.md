# Commands

- `cat`
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
- `reset` - reset the terminal (e.g., the terminal shows only cryptic characters...)
- `set` - lists all variables
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