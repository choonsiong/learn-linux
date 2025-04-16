# Installation

- *BIOS* is responsible for detecting the hardware components, configuring the hardware, and starting the operating system.
- Intel developed the *EFI (Extensible Firmware Interface)* successor to BIOS in 1998.
    - Renamed to *UEFI (Unified Extensible Firmware Interface)* after the participation of AMD, Apple, Microsoft, and others.
    - The biggest advantages compared to BIOS is EFI allows you to choose which of several installed operating systems you want to start when you boot the computer.
        - In the BIOS past, the *GRUB (Grand Unified Bootloader)* program is used
    - EFI requires a special partition called the *EFI System Partition (ESP)*
        - The ESP must contain a VFAT file system, which is a Windows 95 compatible file system
            - The partition must be specially marked
            - `/boot/efi`
            - ESP size at least 512 MiB, it is almost impossible to increase the size at a later date
        - [Arch Linux - Unified Extensible Firmware Interface](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface)
        - [Installing Ubuntu in UEFI mode](https://help.ubuntu.com/community/UEFI)
        - [Managing EFI boot loaders for Linux](https://rodsbooks.com/efi-bootloaders/index.html)
- Download ISO images
    - burn to a DVD (or a USB flash drive) and boot the computer with it
        - to write ISO image to drive use program like [etcher](https://etcher.balena.io) or `dd` command on Linux
    - on a virtual machine, use the ISO image as a virtual DVD drive