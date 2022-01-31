srb2bld is a shellscript, that automates and simplifies process of downloading source code, configuring, compilation and installation of various SRB2 related builds.

https://user-images.githubusercontent.com/16626326/151817083-7702cfb9-3733-4f4d-834f-841f99269c05.mp4

# Features
- Compiling and installing 32-bit/64-bit binaries of SRB2, SRB2 Uncapped Plus, SRB2 NetPlus, SRB2 v2.1 Legacy, SRB2 v2.0, SRB2 Final Demo, SRB2 Persona, SRB2 Kart or SRB2 Kart Moe Mansion, SRB2 Kart VR on Linux, macOS (tested on version 10.14 and 10.15) and Windows. Check "Compatibilty" section for information about which build works for each system and CPU architecture,
- Ability to set user's flags before compiling,
- Installing missing dependencies on host system (mostly binaries, except for macOS) based on user's set compilation flags,
- Supports installing dependencies for glibc and musl based Linux distros like: Debian, Ubuntu, Arch, Manjaro, Gentoo, OpenSUSE, Fedora, Void and Alpine,
- Compiling builds also on ARM CPU (tested on ODROID XU4 with Ubuntu Linux 18.04, some builds may not compile/run successfully),
- Creating AppImages (Linux only),
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
- Optionally for updating icons and menu entries: gtk-update-icon-cache or kservice (can be part of GNOME or KDE desktop environment package).

Windows users need to also have installed Git Bash to run this script. Also PowerShell is required for updating icons and menu entries (usually it is installed out-of-box on Windows 7 or later).

As for macOS users, they need to install these additional dependencies:
- Cmake,
- Autoconf,
- Automake,
- Pkg-config,
- Libtool,
- 7zip,
- Makeicns.

# Dependencies Installation
**Linux:**
1. In terminal enter this following commands:
- Debian/Ubuntu/Debian based/Ubuntu based: `sudo apt install coreutils findutils bash curl gawk docker.io stow`,

- Arch/Arch based: `sudo pacman -S coreutils findutils bash curl gawk docker stow`,

- Gentoo/Gentoo based: `sudo emerge -av coreutils findutils bash curl gawk docker stow`.

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
- `brew install cmake autoconf automake pkgconfig libtool gawk stow 7zip curl makeicns`.

# Installation
**Linux:**
1. Open terminal,

2. Enter `git clone https://github.com/Bijman/srb2bld`,

3. Enter `sudo make install`, which will install to "/usr/bin" or "/usr/local/bin", if path exists, or just place script in your directory and change script's permissions to be executable: `chmod 755 srb2bld`.

**Windows:**
1. Open Git Bash,

2. Go to your user directory (usually "C:/Users/[Your username]"): `cd ~`,

3. Enter `git clone https://github.com/Bijman/srb2bld`,

4. Create directory "bin" with command: `mkdir ~/bin`,

5. Copy script to "~/bin": `cp /path/to/srb2bld ~/bin` (keep in mind, that "/path/to/srb2bld" is not literal path, so type your path to srb2bld script),

6. Change script's permissions to be executable: `chmod 755 ~/bin/srb2bld`,

7. Open text editor for "~/.bash_profile": `nano ~/.bash_profile`,

8. Write new path to executables with environment variable PATH like `export PATH="~/bin:$PATH"` in "~/.bash_profile",

9. Enter: `source ~/.bash_profile` or restart Git Bash.

**macOS:**
1. Open terminal,

2. Enter `git clone https://github.com/Bijman/srb2bld`,

3. Enter `sudo make install`, which will install to "/usr/local/bin", or just place script in your directory and change script's permissions to be executable: `chmod 755 srb2bld`,

4. Check if you set properly other environment variables from "Configuration" section,

5. Enter: `source ~/.zshrc` or `source ~/.bash_profile` or restart terminal.

# Configuration
**Linux:**
1. Add user to the "docker" group: `sudo usermod -aG docker [username]` and enable Docker service with `sudo systemctl enable docker` or `sudo rc-update add docker default`. After that logout or reboot the system.

**Windows:**
1. User is already added to "docker" group and service will run, if Docker Desktop is installed and the system was logged out or rebooted.

**macOS:**
1. Set SDKROOT environment variable in .zshrc or .bash_profile: `export SDKROOT=[path-to-sdk-file]` and then restart terminal or `source ~/.bash_profile` or `source ~/.zshrc`.

# Compatibility
|                       | Linux (glibc) x86/x64 | Linux (musl) x86/x64 | Windows x86/x64 | macOS x86/x64 |
| :-------------------: | :-------------------: | :------------------: | :-------------: | :-----------: |
| SRB2                  |          ✅           |         ✅           |       ✅        |       ✅      |
| SRB2 Uncapped Plus    |          ✅           |         ✅           |       ✅        |       🟨**    |
| SRB2 NetPlus          |          ✅           |         ✅           |       ✅        |       ⛔      |
| SRB2 v2.1 Legacy      |          ✅           |         ✅           |       ✅        |       ✅      |
| SRB2 v2.0             |          ✅           |         ✅           |       ✅*       |       ⛔      |
| SRB2 Final Demo       |          ✅*          |         ⛔           |       ✅*       |       ⛔      |
| SRB2 Persona          |          ✅           |         ⛔           |       ✅        |       ✅      |
| SRB2 Kart             |          ✅           |         ✅           |       ✅        |       🟨***   |
| SRB2 Kart Moe Mansion |          ✅           |         ✅           |       ✅        |       ⛔      |
| SRB2 Kart VR          |          ✅           |         ✅           |       ✅*       |       ⛔      |

**Legend:**

✅ - Builds and runs successfully.

🟨 - Builds successfully, but may encounter errors, when starting game, or get performance issues. Patches may apply.

⛔ - Building failure.

*Only 32bit binaries are currently supported. SRB2 v2.0 has graphical issues when running with OpenGL on Linux.

**Compiles successfully with patch for commit d4d1181ec6f without setting -DSRB2_CONFIG_HAVE_DISCORDRPC=ON compilation flag, but there may be some slowdowns, when running game.

***Compiles successfully, but it can throw SIGABRT error on some macOS versions. Runs fine on macOS 10.14.

# Usage (from help text)
```
Build and install SRB2/SRB2Kart from source.

Usage: srb2bld [OPTIONS]
  OPTIONS:
     -h, --help                             Show this help text.
     -ab, --appbundle                       Compile and create App Bundle of SRB2/SRB2Kart build (macOS only).
     -ai, --appimage                        Compile and create AppImage of SRB2/SRB2Kart build (Linux only).
     -c, --compatibility                    Display compatibility table of compiling SRB2/SRB2Kart builds for each operating system.
     -i, --install                          Compile and install SRB2/SRB2Kart build.
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

  Warning! Old builds like SRB2 v2.0 and SRB2 Final Demo may not build/run properly on modern Linux distributions/macOS/Windows.

  If you want to compile and install some builds with DiscordRPC support (SRB2 Uncapped Plus, SRB2 NetPlus, SRB2 Kart, SRB2 Kart Moe Mansion and SRB2 Kart VR), then type HAVE_DISCORDRPC=1 (Linux/Windows) or -DSRB2_CONFIG_HAVE_DISCORDRPC=ON (macOS), when the script asks about optional compilation flags (using "srb2bld --install" command).

```
