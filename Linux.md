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

| Action | Command | File | Directory |
| ------ | ------- | ---- | --------- |
| change to directory | `cd directory` | - | `x` |			