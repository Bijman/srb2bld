srb2bld is a shellscript, that automates and simplifies process of downloading source code, configuring, compilation, installation and creating portable executable bundles of various SRB2 related builds.

https://user-images.githubusercontent.com/16626326/152710164-9012f542-5922-4958-a2fd-6480ef0e0339.mp4

# Features
- Compiling and installing 32-bit/64-bit binaries of SRB2, SRB2 Uncapped Plus, SRB2 NetPlus, SRB2 v2.1 Legacy, SRB2 v2.0, SRB2 Final Demo, SRB2 Persona, SRB2 Kart or SRB2 Kart Moe Mansion, SRB2 Kart VR on Linux, macOS (tested on version 10.14/Mojave and 10.15/Catalina) and Windows. Check "Compatibilty" section or enter the script's -c/--compatibility option for information about which build compiles and run for each system and CPU architecture,
- Ability to set user's flags before compiling,
- Installing missing dependencies on host system (mostly binaries, except for macOS) based on user's set compilation flags,
- Supports installing SRB2 builds and its dependencies for glibc and musl based Linux distros like: Debian, Ubuntu, Arch, Manjaro, Gentoo, OpenSUSE, Fedora, Void and Alpine,
- Compiling builds also on ARM CPU (tested on ODROID XU4 with Ubuntu Linux 18.04, some builds may not compile/run successfully),
- Creating customisable AppImages (Linux only) and App Bundles (macOS only) for x86/x64 and ARM CPUs,
- Removing installed SRB2 builds, source code and assets,
- Upgrading installed SRB2 builds,
- Runs on Linux, macOS and Windows (Git Bash).

# Dependencies
- GNU Coreutils,
- Bash or any POSIX compliant shell,
- Findutils,
- Curl,
- Gawk,
- Docker (Linux and Windows only),
- GNU Stow (Linux and macOS only),
- FUSE (Linux only),
- Optionally for updating icons and menu entries: gtk-update-icon-cache or kservice (can be part of GNOME or KDE desktop environment package).

Windows users need to also have installed Git Bash to run this script. Also PowerShell is required for updating icons and menu entries (usually it is installed out-of-box on Windows 7 or later).

As for macOS users, they need to install these additional dependencies:
- Cmake,
- Autoconf,
- Automake,
- Pkg-config,
- Libtool,
- p7zip,
- Makeicns.

# Dependencies Installation
**Linux:**
1. In terminal enter this following commands:
- Debian/Ubuntu/Debian based/Ubuntu based: `sudo apt install build-essential git coreutils findutils bash curl gawk docker.io stow fuse`,

- Arch/Arch based: `sudo pacman -S base-devel git coreutils findutils bash curl gawk docker stow fuse`,

- Gentoo/Gentoo based: `sudo emerge -av coreutils git findutils bash curl gawk docker stow fuse`.

**Windows:**
1. Installing Git Bash:
- Download from [HERE](https://git-scm.com/downloads),
- Watch this video from 7:19 to 9:33 in [HERE](https://youtu.be/SWYqp7iY_Tc?t=439),

2. Git Bash can be found on start menu,

3. The rest of dependencies are installed, if you followed video,

4. Installing Docker Desktop:
- Download from [HERE](https://www.docker.com/products/docker-desktop),
- Watch this video from 6:07 to 8:36 in [HERE](https://youtu.be/_9AWYlt86B8?t=518).

**macOS:**
1. In terminal enter this following command:
- Homebrew: `brew install cmake autoconf automake pkgconfig libtool gawk stow p7zip curl makeicns`,
- MacPorts: `sudo port install cmake autoconf automake pkgconfig libtool gawk stow p7zip curl makeicns`.

# Installation
**Linux:**
1. Open terminal,

2. Enter `git clone https://github.com/Bijman/srb2bld`,

3. Go to downloaded directory: `cd srb2bld`,

4. Enter `sudo make install`, which will install to "/usr/bin" or "/usr/local/bin", if path exists. Alternatively manually place script to your path, which is readable by shell (PATH environment variable), and change script's permissions to be executable: `chmod 755 [path to srb2bld script]`,

5. Check if you set properly other settings from "Configuration" section of README.

**Windows:**
1. Open Git Bash,

2. Go to your user directory (usually "C:/Users/[your username]"): `cd ~`,

3. Enter `git clone https://github.com/Bijman/srb2bld`,

4. Create directory "bin" with command: `mkdir ~/bin`,

5. Copy script to "~/bin": `cp ~/srb2bld/srb2bld ~/bin`,

6. Change script's permissions to be executable: `chmod 755 ~/bin/srb2bld`,

7. Open text editor for "~/.bash_profile": `nano ~/.bash_profile`,

8. In opened text editor from previous step write new path to executables with environment variable PATH like `export PATH="~/bin:$PATH"` in "~/.bash_profile",

9. Enter `source ~/.bash_profile` or restart Git Bash.

**macOS:**
1. Open terminal,

2. Enter `git clone https://github.com/Bijman/srb2bld`,

3. Go to downloaded directory: `cd srb2bld`,

4. Enter `sudo make install`, which will install to "/usr/bin" or "/usr/local/bin", if path exists. Alternatively manually place script to your path, which is readable by shell (PATH environment variable), and change script's permissions to be executable: `chmod 755 [path to srb2bld script]`,

5. Check if you set properly other settings from "Configuration" section of README.

# Configuration
**Linux:**
1. Add user to the "docker" group `sudo usermod -aG docker [username]` and enable Docker service with `sudo systemctl enable docker` or `sudo rc-update add docker default` or `sudo ln -s /etc/sv/docker /var/service/`, and then start the service with `sudo systemctl start docker` or `sudo rc-service docker start` or `sudo sv up docker`. After that, logout or reboot the system.

**Windows:**
1. User is already added to "docker" group and service will run, if Docker Desktop is installed and the system is logged out or rebooted.

**macOS:**
1. Set SDKROOT environment variable in "~/.zshrc" or "~/.bash_profile": `export SDKROOT=[path to .sdk file]` (usually macOS .sdk file is located in "/Library/Developer/CommandLineTools/SDKs" path, if you installed Homebrew),
2. Enter `source ~/.bash_profile` or `source ~/.zshrc` or restart terminal.

# Compatibility
|                       | Linux (glibc) x86/x64 | Linux (musl) x86/x64 | Linux (glibc) ARM | Windows x86/x64 | macOS x86/x64 |
| :-------------------: | :-------------------: | :------------------: | :---------------: | :-------------: | :-----------: |
| SRB2                  |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| SRB2 Uncapped Plus    |          ✅           |         ✅           |        ✅         |        ✅       |       🟨**    |
| SRB2 NetPlus          |          ✅           |         ✅           |        ✅         |        ✅       |       ⛔      |
| SRB2 VR               |          ✅           |         ✅           |        ✅         |        ✅*      |       ⛔      |
| SRB2 v2.1 Legacy      |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| SRB2 v2.0             |          ✅           |         ✅           |        ✅         |        ✅*      |       ⛔      |
| SRB2 Final Demo       |          ✅*          |         ⛔           |        ✅*        |        ✅*      |       ⛔      |
| SRB2 Persona          |          ✅           |         ⛔           |        ✅         |        ✅       |       ✅      |
| SRB2 Kart             |          ✅           |         ✅           |        ✅         |        ✅       |       🟨***   |
| SRB2 Kart Moe Mansion |          ✅           |         ✅           |        ✅         |        ✅       |       ⛔      |
| SRB2 Kart VR          |          ✅           |         ✅           |        ✅         |        ✅*      |       ⛔      |

**Legend:**

✅ - Builds and runs successfully.

🟨 - Builds successfully, but may encounter errors, when starting game, or get performance issues. Patches may apply.

⛔ - Building failure.

*Only 32bit binaries are currently supported. SRB2 v2.0 has graphical issues when running with OpenGL on Linux.

**Compiles successfully with patch for commit d4d1181ec6f without setting -DSRB2_CONFIG_HAVE_DISCORDRPC=ON compilation flag, but there may be some slowdowns, when running game.

***Compiles successfully, but it can throw SIGABRT error on some macOS versions. Compiled build runs fine on macOS 10.14/Mojave.

# Usage (from help text)
```
Build and install SRB2/SRB2Kart from source.

Usage: srb2bld [OPTIONS]
  OPTIONS:
     -h, --help                             Show this help text.
     -ab, --appbundle                       Compile and create distributable App Bundle of SRB2/SRB2Kart build, which is packaged in DMG file (macOS only).
     -ai, --appimage                        Compile and create distributable AppImage of SRB2/SRB2Kart build (Linux only).
     -c, --compatibility                    Display compatibility table of compiling SRB2/SRB2Kart builds for each operating system.
     -i, --install                          Compile and install SRB2/SRB2Kart build.
     -la, --listasset                       List downloaded SRB2/SRB2Kart assets.
     -lb, --listbuild                       List downloaded SRB2/SRB2Kart builds.
     -li, --listinstalled                   List installed SRB2/SRB2Kart builds.
     -ra, --removeasset                     Remove downloaded asset for SRB2/SRB2Kart build.
     -rb, --removebuild                     Remove downloaded source code for SRB2/SRB2Kart build.
     -ui, --uninstall                       Uninstall SRB2/SRB2Kart build.
     -up, --upgrade                         Upgrade SRB2/SRB2Kart build.

  EXAMPLES:
     1. Compile and install SRB2/SRB2Kart build:
            srb2bld --install

     2. Compile and create AppImage of SRB2/SRB2Kart build (Linux only):
            srb2bld --appimage

     3. List installed SRB2/SRB2Kart builds:
            srb2bld --listinstalled

     4. Uninstall SRB2/SRB2Kart build:
            srb2bld --uninstall

     5. Display compatibility table of compiling SRB2/SRB2Kart builds for each operating system:
            srb2bld --compatibility

  NOTES:
     1. Warning! Old builds like SRB2 v2.0 and SRB2 Final Demo may not build/run properly on modern Linux distributions/macOS/Windows.

     2. Warning for macOS users! This script makes changes from rpath to absolute paths within some libraries installed from Homebrew, MacPorts or compiled, that are associated with SRB2 binary, so installing or making App Bundles would be successful. In the future this could make unexpected results with apps or SRB2 builds, that depends on those libraries.

     3. If you want to compile some builds with DiscordRPC support (SRB2 Uncapped Plus, SRB2 NetPlus, SRB2 Kart, SRB2 Kart Moe Mansion and SRB2 Kart VR), then type HAVE_DISCORDRPC=1 (Linux/Windows) or -DSRB2_CONFIG_HAVE_DISCORDRPC=ON (macOS), when the script asks about optional compilation flags (using "srb2bld --install" command).

     4. If on Linux you get error with "/dev/fuse" when running script, then load fuse module with "sudo modprobe fuse". You can write "fuse" in configuration file, usually in file "/etc/modules" or "/etc/modules-load.d/fuse.conf" or "/etc/conf.d/modules/fuse.conf", to automatically load this module at boot.
```

# Notes
1. Warning! Old builds like SRB2 v2.0 and SRB2 Final Demo may not build/run properly on modern Linux distributions/macOS/Windows.

2. Warning for macOS users! This script makes changes from rpath to absolute paths within some libraries installed from Homebrew, MacPorts or compiled, that are associated with SRB2 binary, so installing or making App Bundles would be successful. In the future this could make unexpected results with apps or SRB2 builds, that depends on those libraries.

3. If you want to compile some builds with DiscordRPC support (SRB2 Uncapped Plus, SRB2 NetPlus, SRB2 Kart, SRB2 Kart Moe Mansion and SRB2 Kart VR), then type HAVE_DISCORDRPC=1 (Linux/Windows) or -DSRB2_CONFIG_HAVE_DISCORDRPC=ON (macOS), when the script asks about optional compilation flags (using "srb2bld --install" command).

4. If on Linux you get error with "/dev/fuse" when running script, then load fuse module with `sudo modprobe fuse`. You can write "fuse" in configuration file, usually in file "/etc/modules" or "/etc/modules-load.d/fuse.conf" or "/etc/conf.d/modules/fuse.conf", to automatically load this module at boot.
