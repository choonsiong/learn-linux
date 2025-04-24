# About Linux

- A hobby project of the Finnish programmer *Linus Torvalds*.
	- released on the internet in September 1991
- Linux is a Unix-like operating system.
	- An operating system is a bundle of programs that realize the basic functions of a computer. This includes managing the keyboard, screen, and mouse as well as the system resources.
	- Popular operating systems include Windows, Linux, macOS, Android, and iOS.
	- The [500 fastest computers](https://top500.org/statistics/list/) in the world today all run Linux.
- Strictly speaking, the term *Linux* only refers to the *kernel*, the innermost part (i.e., the core) of an operating system with very basic functions, such as memory management, process management, and control of the hardware.
- A *Linux distribution* is the unit that consists of the actual operating system (kernel) and many additional programs. A distribution allows for a quick and convenient installation of Linux.
	- Difference between distributions
		- Scope and up-to-dateness
		- Installation and configuration tools
		- Configuration of the desktop (KDE and GNOME)
		- Hardware support
		- Updates
		- Rolling release
		- Live system
		- Target platform (CPU architecture)
		- Support
		- License
	- Common Linux distributions
		- AlmaLinux - a RHEL clone
		- Android - developed by Google for mobile devices and tablets
		- Arch Linux - a rolling release distribution for technical users
		- CentOS - end in December 2020
		- CentOS Stream - unsuitable for long-term production use
		- Chrome OS - developed by Google, optimized for notebooks and requires an active internet connection
		- Debian - one of the oldest entirely free distribution, is intended for advanced Linux users
		- Fedora - the free development branch of Red Hat Linux, new Linux features are often found in Fedora first and only later in other distributions
		- Kali Linux - based on Debian, includes a huge collection of hacking and pen-testing tools
		- openSUSE - a free Linux distribution based on enterprise versions of SUSE, but specifically intended for home users and developers
		- Oracle Linux - a variant of RHEL from Oracle
		- Red Hat - acquired by IBM in 2018, is the best-known and most successful Linux company in the world
		- Ubuntu - the most popular distribution for home users by Canonical
- [GPL (General Public License)](https://www.gnu.org/licenses/gpl-3.0.html) is backed by the Free Software Foundation (FSF), an organization founded by *Richard Stallman* to make high-quality software freely available.
	- [FAQ about the GNU licenses](https://www.gnu.org/licenses/gpl-faq.html)
	- [GPL quiz](https://www.gnu.org/cgi-bin/license-quiz.cgi)
- [FHS (Filesystem Hierarchy Standard)](https://refspecs.linuxfoundation.org/fhs.shtml)	
	- `/` - The file system starts with the root directory. There are usually no files there, only directories.
		- `/bin` - commands for system administration that can be executed by all users, in modern distributions, `/bin` is simply link to `/usr/bin`
		- `/boot` - contains files that are used to boot the system, in most distributions, the kernel is also located here
		- `/dev` - contains all device files
			- in most distributions, the `/dev` directory is located in a RAM disk
		- `/etc` - contains configuration files for the entire system
		- `/home` - contains the home directories of all regular Linux users
			- `/root` - home directory for `root` user
		- `/lib[64]` - contains some shared libraries or symbolic links to them, other libraries are located in `/usr/lib[64]`, in current distributions, `lib` is a link to `/usr/lib`
			- `/lib/modules` - contains kernel modules that are dynamically enabled or disabled during operation
			- `/lib/firmware` - contains the firmware of various hardware components
		- `/lost+found` - exists only in `ext` file systems, contains file fragments that could no longer be allocated when `fsck` attempted to repair the file system
		- `/media` - contains subdirectories like `cdrom` where external file systems are mounted
			- traditionally, `/mnt` was used for this
		- `/opt` - intended for add-on packages
		- `/proc` - contains subdirectories for all running processes
			- these are not real files! merely reflects the administration of the processes within Linux
		- `/root` - contains the files of the `root` user
		- `/run` - contains files with the process IDs and other information of some system services for many current distributions
			- in the past, these files were stored in the `/var/run` directory
			- `/run/lock/` - contains locking files (or in `/var/lock`)
		- `/sbin` - contains commands for system management, may only be executed by `root`
			- in modern distributinos, `/sbin` is a link to `/usr/sbin`
			- all system administration commands are now stored in `/usr/sbin`
		- `/share` - contains architecture-independent files (files that are independen of the processor)
			- the correct location is actually `/usr/share`
		- `/srv` - contains data for server processes in some distributions
			- `/srv/www` - web server
			- `/srv/ftp` - ftp server 
		- `/sys` - contains the `sysfs` file system
			- like `proc`, it provides information about the state of the computer
		- `/tmp` - contains temporary files, also stored in `/var/tmp`
		- `/usr` - contains all application programs
		- `/var` - contains mutable files
- Files and directories
	- On Linux, file names with lengths of up to 255 characters are permitted
	- Case-sensitive
	- Spaces in file names are permitted but often cause problems when they are processed by scripts
		- Avoid using spaces!!!
	- International characters in the file name are allowed, but can cause problems if different character sets are used, such as on a network
		- From the point of view of the Linux kernel, the file name is simply a byte sequence in which only the / character and the code 0 must not occur
			- The question how this byte sequence is interpreted depends on the currently valid character set
	- File names may contain any number of dots
	- Files that start with a dot are considered hidden files
	- The size of files is almost unlimited with current Linux distributions and is in the terabyte range depending on the file system
	- The directory tree of Linux starts in the root directory `/`
	- Home directory `/home/<loginname>`, `~`, `~<loginname>`
	- Two special directories, `.` and `..`
		- `.` is a reference to the current directory
		- `..` is a reference to the parent directory
	- A file may be deleted by anyone who has the `w` and `x` rights for the directory
	- Access to hardware components such as hard disks, DVD drives, interfaces, and so on is provided on Linux via devices
		```
		foobar@debian12:~$ 
		foobar@debian12:~$ ls -l /dev/sda
		brw-rw---- 1 root disk 8, 0 Apr 23 21:59 /dev/sda
		foobar@debian12:~$ ls -l /dev/tty1
		crw--w---- 1 Debian-gdm tty 4, 1 Apr 23 21:59 /dev/tty1
		foobar@debian12:~$
		```
	- `rwx` for directories
		- `r` - allows user to get the list of file names (`ls` command)
		- `w` - gives user the right to change the contents of a directory (e.g., create new file, rename or delete existing file)
		- `x` - allows user to change to a directory (`cd` command)
		-  only the `rx` combination makes it possible to process a directory correctly (e.g., `ls -l` to list files)
			- if both `xw` are set, new files can be created in the directory
		- the behavior of `rx` is due to the fact that directories are regarded by the file system as a special case of a file
			- the contents of the "file" directory is a listing of the names of the files that are in the directory and their inode numbers
	- For nested directories, if the `x` bit isn't set, the subdirectories cannot be used
		- In practice, it's usually convenient to set the `r` bit for base directories as well
			- If the read permission is missing, the user must know the name of the subdirectory
		- The operations permitted in the subdirectory depend exclusively on the `rwx` bits of this directory
			- If the `rwx` rights are set for the subdirectory, files can be read, created, modified, and deleted - even if the `r` and `w` rights are missing in the base directories (e.g. the `w` is not set for `/` and `/home`, but we still can create subdirectories in our home directory)
			```
			foobar@debian12:~$ ls -ld /
			drwxr-xr-x 19 root root 4096 Mar 31 17:58 /
			foobar@debian12:~$ 
			foobar@debian12:~$ ls -ld /home
			drwxr-xr-x 5 root root 4096 Apr 22 21:16 /home
			foobar@debian12:~$ 
			foobar@debian12:~$ 
			foobar@debian12:~$ ls -ld /home/foobar
			drwxr-xr-x 5 foobar foobar 4096 Apr 21 22:21 /home/foobar
			foobar@debian12:~$
			```			
	- Required access rights for standard file/directory actions:

	| Action | Command | File | Directory |
	| ------ | ------- | ---- | --------- |
	| Change to directory | `cd directory` | - | `x` |			
	| Determine list of files | `ls directory/*` | - | `r` |
	| Read file information | `ls -l directory/*` | - | `rx` |
	| Create new file | `touch directory/newfile` | - | `wx` |
	| Read file | `less directory/file` | `r` | `x` |
	| Change existing file | `cat >>directory/file` | `w` | `x` |
	| Delete file | `rm directory/file` | - | `wx` |
	| Run program | `directory/program` | `x` | `x` |
	| Run script file | `directory/script` | `rx` | `x` |
	- Special bits
		- **setuid bit** - often called the *suid bit*
			- it causes programs to always run as if the owner himself had started the program
			- internally, the user identification number of the owner of the file and not the UID of the current user is used for the execution of the program
			- use to give additional rights to ordinary owners, which are valid only when this program is executed, e.g., `passwd`
				- lowercase `s` if the execute bit is also set (normal case), an uppercase `S` if only the setuid bit but not the execute bit is set
					```
					andy@debian12:~$ ls -l `which passwd`
					-rwsr-xr-x 1 root root 72048 Mar 23  2023 /usr/bin/passwd
					andy@debian12:~$
					```		
				- octal mode is `4000`
			- `chmod u+s file`, `chmod u-s file`
		- **setgid bit**
			- similar to `suid bit`, the group identification number of the file is used during the execution of the program, not the group ID (GID) of the current user, octal value is `2000`
			- for directories, the setgid bit has a completely different meaning
				- if it is set, newly created files within this directory will be assigned the group of the directory - instead of the group of the person who creates the file
					- e.g., multiple users share a directory
						```
						root@debian12:/# ls -ld /company/marketing
						drwxrws--- 3 root marketing 4096 Apr 24 03:42 /company/marketing
						root@debian12:/#
						```				
			- `chmod g+s file`, `chmod g-s file`
			- to delete the setgit bit from directories: if `chmod 0770 dir` leaves the setgid bit unchanged, then try `chmod 00770 dir` or `chmod g-s dir`
		- **sticky bit**
			- for directories in which everyone is allowed to change the files, the *sticky bit* makes sure that everyone is only allowed to delete their own files and not those of other users, e.g. in `/tmp`, `ls -l` displays the letter `t` or `T` instead of the `x` for all valid access bits in such programs, octal value is `1000`
				```
				root@debian12:/# ls -ld /tmp
				drwxrwxrwt 18 root root 4096 Apr 24 03:42 /tmp
				root@debian12:/#
				```		
			- the meaning of the sticky bit is specific to Linux, in other Unix variants, the bit may have a different meaning or no meaning at all
			- `chmod +t file`, `chmod -t file`
		- the uppercase `S` and `T` are only applied if the corresponding execute bit is not set, this is usually an indication that the special bits are being used incorrectly