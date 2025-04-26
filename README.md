srb2bld is a shell script, that automates and simplifies process of downloading source code, configuring, compilation, installation to system or creating portable executable bundles of various SRB2 related builds.

https://github.com/Bijman/srb2bld/assets/16626326/7533a945-116a-4e1d-b738-41526b5cb33a

# Features
- Compiling and installing 32-bit/64-bit binaries of SRB2, SRB2 Uncapped Plus, SRB2 NetPlus, SRB2 Reveries, SRB2 TSoURDt3rd, SRB2 VR, SRB2 v2.1 Legacy, SRB2 Fusion Advance, SRB2 Top Down, SRB2 v2.0, XSRB2, SRB2 SF94-Serv, SRB2 Riders, Super SRB2 Kart Z, Super Bomberman Blast 2, SRB2 Final Demo, SRB2 JTE, ShufflarB2, SRB2 Live, SRB2 LoZ, SRB2 Persona, SRB2 Kart, SRB2 Kart Moe Mansion, SRB2 Kart Galaxy, SRB2 Kart HEP, SRB2 Kart Saturn, SRB2 Kart Neptune, SRB2 Kart VR, Blankart, Ring Racers, Ring Racers Noire, Ring Racers HEP2, Ring Racers HEP3, Ring Racers Freaky Build, wadcli, kartmaker (SRB2 Kart), NeptuneFM (SRB2 Kart), kartmaker (Ring Racers), followermaker (Ring Racers), SLADE, Ultimate Zone Builder, High Voltage Ring and Aseprite with Kart Builder on Linux, macOS (tested on version 10.14/Mojave, 10.15/Catalina and 11/Big Sur) and Windows. Check "Compatibility" section or enter the script's -c/--compatibility option for information about which build compiles and run for each system and CPU architecture,
- Compiling and installing custom SRB2 builds from local or remote Git repository,
- Ability to set user's flags before compiling,
- Installing missing dependencies on host system (mostly binaries, except for SRB2 builds on macOS) based on user's set compilation flags,
- Supports installing SRB2 builds and its dependencies for glibc based Linux distros like: Debian, Ubuntu, Arch, Manjaro, Gentoo, OpenSUSE, Fedora, Void and musl based like: Void, Alpine,
- Systems with immutable root filesystems (Steam Deck's SteamOS, Fedora Silverblue/Fedora Kinoite/Universal Blue) are supported too,
- Compiling builds on ARM CPU too (tested on ODROID XU4 with Ubuntu Linux 18.04),
- Creating customizable AppImages (Linux only), Flatpaks (Linux only) and App Bundles (macOS only) for x86/x64 and ARM CPUs,
- Building Android APKs (Linux and Windows only),
- Removing installed SRB2 builds, source code and assets,
- Upgrading installed SRB2 builds,
- Runs on Linux, macOS and Windows (Git Bash).

# Dependencies
1. General dependencies:
- Basic system utilities like GNU Coreutils, BusyBox or macOS out-of-the-box system utilities,
- Bash or any POSIX compliant shell,
- Findutils,
- File,
- Which,
- Curl,
- Git,
- Gawk,
- Ncurses,
- Docker or Podman (Linux and Windows only),
- GNU Stow (Linux and macOS only),
- Patchelf (Linux only),
- GDK-Pixbuf (Linux only).
2. AppImage building (Linux only, 32-bit versions of packages are needed too for old SRB2 builds like SRB2 Final Demo and SRB2 JTE):
- Fuse/Libfuse2/Fuse-libs,
- File,
- Zlib/Zlib1g/Zlib-ng-compat/Libz1.
3. Flatpak building (Linux only):
- Flatpak,
- Flatpak-builder.

Optionally for updating icons and menu entries: gtk-update-icon-cache or kservice (can be part of GNOME or KDE desktop environment package) (Linux only).
Windows users need to also have installed Git Bash or MSYS to run this script.

As for macOS users, they need to install these additional dependencies:
- Cmake,
- Autoconf,
- Automake,
- Pkg-config,
- Libtool,
- P7zip,
- Unrar/Rar,
- Makeicns.

# Dependencies Installation
**Linux:**
1. In terminal enter this following command:
- Debian/Ubuntu/Debian based/Ubuntu based: `sudo apt install make git debianutils coreutils findutils file ncurses-bin curl gawk docker.io stow libfuse2 zlib1g patchelf libgdk-pixbuf2.0-bin flatpak flatpak-builder`,

- Arch/Arch based: `sudo pacman -S --needed make git which coreutils findutils file ncurses curl gawk docker stow fuse2 zlib patchelf gdk-pixbuf2 flatpak flatpak-builder`,

- Gentoo/Gentoo based: `sudo emerge -av dev-vcs/git sys-apps/which sys-apps/coreutils sys-apps/findutils sys-apps/file sys-libs/ncurses net-misc/curl sys-apps/gawk app-containers/docker app-admin/stow sys-fs/fuse:0 sys-libs/zlib dev-util/patchelf x11-libs/gdk-pixbuf sys-apps/flatpak dev-util/flatpak-builder`,

- Fedora/Fedora based: `sudo dnf install make git which coreutils findutils file ncurses curl gawk docker stow fuse-libs zlib-ng-compat patchelf gdk-pixbuf2 flatpak flatpak-builder`,

- Fedora Silverblue/Fedora Kinoite/Fedora Sway/Fedora Budgie/Universal Blue (Bazzite, Aurora): `rpm-ostree install -A --allow-inactive make git which coreutils findutils file ncurses curl gawk docker stow fuse-libs zlib-ng-compat patchelf gdk-pixbuf2 flatpak flatpak-builder `,

- RHEL/RHEL based: `sudo dnf install make git which coreutils findutils file ncurses curl gawk docker stow fuse-libs zlib patchelf gdk-pixbuf2 flatpak flatpak-builder`,

- openSUSE Leap/openSUSE Tumbleweed/openSUSE Leap based/openSUSE Tumbleweed based: `sudo zypper in make git which coreutils findutils file ncurses curl gawk docker stow libfuse2 libz1 patchelf gdk-pixbuf-query-loaders flatpak flatpak-builder`,

- openSUSE MicroOS/openSUSE MicroOS based: `sudo transactional-update pkg in make git which coreutils findutils file ncurses curl gawk docker stow libfuse2 libz1 patchelf gdk-pixbuf-query-loaders flatpak flatpak-builder && sudo transactional-update apply`,

- Void/Void based: `sudo xbps-install make git which coreutils findutils file ncurses curl gawk docker stow fuse zlib patchelf gdk-pixbuf flatpak flatpak-builder`,

- Alpine/Alpine based: `sudo apk add make git which coreutils findutils file shadow ncurses curl gawk docker stow fuse zlib patchelf gdk-pixbuf flatpak flatpak-builder`,

- Solus/Solus based: `sudo eopkg it make git which coreutils findutils file ncurses curl gawk docker stow fuse2 zlib patchelf gdk-pixbuf flatpak flatpak-builder`,

- NixOS/NixOS based: `sudo nix profile install nixpkgs#gnumake nixpkgs#git nixpkgs#which nixpkgs#coreutils nixpkgs#findutils nixpkgs#file nixpkgs#ncurses nixpkgs#curl nixpkgs#gawk nixpkgs#stow nixpkgs#fuse nixpkgs#zlib nixpkgs#patchelf nixpkgs#gdk-pixbuf nixpkgs#flatpak nixpkgs#flatpak-builder --extra-experimental-features 'nix-command flakes'` or set those packages in "environment.systemPackages = with pkgs;". For Docker, set "virtualisation.docker.enable = true;", so this should install and enable Docker as service running in the background of system with `sudo nixos-rebuild switch`. For Flatpak, set "services.flatpak.enable = true;" in "/etc/nixos/configuration.nix".

- Systems with immutable root filesystems (with exception of home directory and others depending on distro) like Steam Deck's SteamOS need rootless method of getting dependencies to avoid issues with wiping out installed packages after system's update or not to be able to write to certain path, like "/usr/local":
	1. Docker (Rootless mode): run `curl -fsSL https://get.docker.com/rootless | sh` to install Docker to user's home directory. For more details read [HERE](https://docs.docker.com/engine/security/rootless),
	2. Install dependencies with package manager [Homebrew](https://brew.sh): `brew install make git coreutils findutils file ncurses curl gawk stow libfuse@2 patchelf gdk-pixbuf`.

**Windows:**
1. Installing Git Bash:
- Download from [HERE](https://git-scm.com/downloads),
- Watch this video from 7:19 to 9:33 in [HERE](https://youtu.be/SWYqp7iY_Tc?t=439),

2. Git Bash can be found on start menu,

3. The rest of dependencies are installed, if you followed video,

4. Installing Docker Desktop:
- Download from [HERE](https://www.docker.com/products/docker-desktop),
- Watch this video from 6:05 to 8:36 in [HERE](https://youtu.be/_9AWYlt86B8?t=365).

**macOS:**
1. In terminal enter this following command:
- Homebrew: `brew install cmake autoconf automake pkgconfig libtool gawk stow p7zip rar curl makeicns nasm`,
- MacPorts: `sudo port -Ncb install cmake autoconf automake pkgconfig libtool gawk stow perl5.28 libiconv p7zip unrar curl makeicns nasm`.

# Installation
**Linux:**
1. Open terminal,

2. Enter `git clone https://github.com/Bijman/srb2bld`,

3. Go to downloaded directory: `cd srb2bld`,

4. Enter `sudo make install`, which will install to "/usr/local/bin". You can specify your path with variable PREFIX, for example `make install PREFIX=$HOME/.local`, which will copy script to "$HOME/.local/bin". Alternatively manually place script to your path, which is readable by shell (PATH environment variable), and change script's permissions to be executable: `chmod 755 [path to srb2bld script]`,

5. Follow steps in "Configuration" section of README.

**Windows:**
1. Open Git Bash,

2. Enter `git clone https://github.com/Bijman/srb2bld`,

3. Go to downloaded directory: `cd srb2bld`,

4. Enter `install -Dm755 srb2bld -t /usr/local/bin`.

**macOS:**
1. Open terminal,

2. Enter `git clone https://github.com/Bijman/srb2bld`,

3. Go to downloaded directory: `cd srb2bld`,

4. Enter `sudo make install`, which will install to "/usr/local/bin". You can specify your path with variable PREFIX, for example `make install PREFIX=$HOME/.local`, which will copy script to "$HOME/.local/bin". Alternatively manually place script to your path, which is readable by shell (PATH environment variable), and change script's permissions to be executable: `chmod 755 [path to srb2bld script]`,

5. Follow steps in "Configuration" section of README.

# Configuration
**Linux (Notice: This part can be skipped, if you have installed podman.):**
1. Add user to the "docker" group `sudo usermod -aG docker [username]` and enable Docker service with `sudo systemctl enable docker` or `sudo rc-update add docker default` or `sudo ln -s /etc/sv/docker /var/service/`, and then start the service with `sudo systemctl start docker` or `sudo rc-service docker start` or `sudo sv up docker`. For immutable systems (Steam Deck's SteamOS, Fedora Silverblue/Fedora Kinoite/Universal Blue) enter: `systemctl --user enable docker` and `systemctl --user start docker`. After that, logout or reboot the system.

**Windows:**
1. User is already added to "docker" group and service will run, if Docker Desktop is installed and the system is logged out or rebooted.

**macOS:**
1. Set SDKROOT environment variable in "\~/.zshrc" or "\~/.bash_profile": `export SDKROOT=[path to .sdk file]` (usually macOS .sdk file is located in "/Library/Developer/CommandLineTools/SDKs" path, if you installed Homebrew or entered `sudo xcode-select --install`),
2. Enter `source ~/.bash_profile` or `source ~/.zshrc` or restart terminal.

# Compatibility (as of 25-04-2025)
|                          | Linux (glibc) x86/x64 | Linux (musl) x86/x64 | Linux (glibc) ARM | Windows x86/x64 | macOS x86/x64 |
| :----------------------: | :-------------------: | :------------------: | :---------------: | :-------------: | :-----------: |
| SRB2                     |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| SRB2 Uncapped PLUS       |          ✅           |         ✅           |        ✅         |        ✅       |       🟨**    |
| SRB2 NetPlus             |          ✅           |         ✅           |        ✅         |        ✅       |       ⛔      |
| SRB2 Reveries            |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| SRB2 TSoURDt3rd          |          ✅           |         🟨           |        🟨         |        ✅       |       🟨      |
| SRB2 VR                  |          ✅           |         ✅           |        ✅         |        ✅*      |       ⛔      |
| SRB2 v2.1 Legacy         |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| SRB2 Fusion Advance      |          ✅           |         ✅           |        ❔         |        ✅       |       ✅      |
| SRB2 Top Down            |          ✅           |         ✅           |        ❔         |        ✅*      |       ✅      |
| SRB2 v2.0                |          ✅*          |         ✅*          |        ✅*        |        ✅*      |       ⛔      |
| XSRB2                    |          ✅*          |         ✅*          |        ❔*        |        ✅*      |       ⛔      |
| SRB2 SF94-Serv           |          ✅*          |         ✅*          |        ❔*        |        ✅*      |       ⛔      |
| SRB2 Riders              |          ✅*          |         ✅*          |        ❔*        |        ✅*      |       ⛔      |
| Super SRB2 Kart Z        |          ✅*          |         ✅*          |        ❔*        |        ✅*      |       ⛔      |
| Super Bomberman Blast 2  |          ✅*          |         ✅*          |        ❔*        |        ✅*      |       ⛔      |
| SRB2 Final Demo          |          ✅*          |         ✅*          |        ✅*        |        ✅*      |       ⛔      |
| SRB2 JTE                 |          🟨*          |         🟨*          |        ❔*        |        🟨*      |       ⛔      |
| ShufflarB2               |          ✅*          |         ✅*          |        ❔*        |        ✅*      |       ⛔      |
| SRB2 Live                |          ✅*          |         ✅*          |        ❔*        |        ✅*      |       ⛔      |
| SRB2 LoZ                 |          🟨*          |         🟨*          |        🟨*        |        🟨*      |       ⛔      |
| SRB2 Persona             |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| SRB2 Kart                |          ✅           |         ✅           |        ✅         |        ✅       |       🟨***   |
| SRB2 Kart Moe Mansion    |          ✅           |         ✅           |        ✅         |        ✅       |       ⛔      |
| SRB2 Kart Galaxy         |          ✅           |         ✅           |        🟨         |        ✅       |       ⛔      |
| SRB2 Kart HEP            |          ✅           |         ✅           |        🟨         |        ✅       |       ⛔      |
| SRB2 Kart Saturn         |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| SRB2 Kart Neptune        |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| SRB2 Kart VR             |          ✅           |         ✅           |        ✅         |        ✅*      |       ⛔      |
| BlanKart                 |          ✅           |         ✅           |        ❔         |        ✅       |       ✅      |
| Ring Racers              |          ✅           |         ✅           |        ⛔         |        ✅*      |       ✅      |
| Ring Racers Noire        |          ✅           |         ✅           |        ⛔         |        ✅*      |       ✅      |
| Ring Racers HEP2         |          ✅           |         ✅           |        ⛔         |        ✅*      |       ✅      |
| Ring Racers HEP3         |          ✅           |         ✅           |        ⛔         |        ✅*      |       ✅      |
| Ring Racers Freaky Build |          ✅           |         🟨           |        ⛔         |        ✅*      |       ✅      |
| wadcli                   |          ✅           |         ✅           |        ✅         |        ⛔       |       ⛔      |
| kartmaker (SRB2 Kart)    |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| NeptuneFM (SRB2 Kart)    |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| kartmaker (RR)           |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| followermaker (RR)       |          ✅           |         ✅           |        ✅         |        ✅       |       ✅      |
| SLADE                    |          ✅           |         ✅           |        ⛔         |        ⛔       |       ✅      |
| Ultimate Zone Builder    |          ✅           |         🟨****       |        ⛔         |        ✅       |       ⛔      |
| High Voltage Ring        |          ✅           |         🟨****       |        ⛔         |        ✅       |       ⛔      |
| Aseprite w/ Kart Builder |          ✅           |         ✅           |        ⛔         |        ⛔       |       ✅      |

**Legend:**

✅ - Builds and runs successfully.

🟨 - Builds successfully, but may encounter errors, when starting game, or get performance issues. Patches may apply.

⛔ - Building failure.

❔ - Not tested.

*Only 32-bit binaries are currently supported. SRB2 v2.0 has graphical issues when running with OpenGL on Linux and Windows.

**Compiles successfully with patch for commit d4d1181ec6f without setting -DSRB2_CONFIG_HAVE_DISCORDRPC=ON compilation flag, but there may be some slowdowns, when running game.

***Compiles successfully, but it can throw SIGABRT error on some macOS versions. Compiled build runs fine on macOS 10.14/Mojave.

****Compiles successfully from Ubuntu 18.04 Docker container. It requires glibc compatibility layer named gcompat. 

# Supported Android builds
- SRB2 Android by Lactozilla
- SRB2 Android by bitten2up
- SRB2 Reveries
- SRB2 Custom (requires custom build that supports building with gradle files in directory "android" in SRB2 custom build directory)

# Usage (from help text)
```
Build and install SRB2/SRB2Kart/Ring Racers from source.

Usage: srb2bld [OPTIONS]
  OPTIONS:
     -h, --help                             Show this help text.
     -ab, --appbundle                       Compile and create distributable App Bundle of SRB2/SRB2Kart/Ring Racers build, which is packaged in DMG file (macOS only).
     -ad, --android                         Compile and create distributable APK file of SRB2 build (Linux and Windows only).
     -ai, --appimage                        Compile and create distributable AppImage of SRB2/SRB2Kart/Ring Racers build (Linux only).
     -c, --compatibility                    Display compatibility table of compiling SRB2/SRB2Kart/Ring Racers builds for each operating system.
     -f, --flatpak                          Compile and create distributable Flatpak of SRB2/SRB2Kart/Ring Racers build (Linux only).
     -i, --install                          Compile and install SRB2/SRB2Kart/Ring Racers build to system.
     -la, --listasset                       List downloaded SRB2/SRB2Kart/Ring Racers assets.
     -lb, --listbuild                       List downloaded SRB2/SRB2Kart/Ring Racers builds.
     -lc, --listconfig                      List compilation flags of installed SRB2/SRB2Kart/Ring Racers builds.
     -ld, --listdep                         List compiled and installed dependencies for builds.
     -li, --listinstalled                   List installed SRB2/SRB2Kart/Ring Racers builds.
     -ra, --removeasset                     Remove downloaded asset for SRB2/SRB2Kart/Ring Racers build.
     -rb, --removebuild                     Remove downloaded source code for SRB2/SRB2Kart/Ring Racers build.
     -rd, --removedep                       Remove compiled and installed dependencies for builds.
     -t, --tag                              Compile and install build with chosen tag instead of branch (only works with -i/--install, -ab/--appbundle, -ai/--appimage, -f/--flatpak).
     -u, --user                             Set installation path to user's home directory (only works with -i/--install, -ui/--uninstall, -rd/--removedep).
     -ui, --uninstall                       Uninstall SRB2/SRB2Kart/Ring Racers build.
     -up, --upgrade                         Upgrade installed SRB2/SRB2Kart/Ring Racers build.

  EXAMPLES:
     1. Compile and install SRB2/SRB2Kart/Ring Racers build to system:
            srb2bld --install

     2. Compile and install SRB2/SRB2Kart/Ring Racers build to user's home directory:
            srb2bld --install --user

     3. Compile and install SRB2/SRB2Kart/Ring Racers build to system with chosen tag:
            srb2bld --install --tag

     4. Compile and create AppImage of SRB2/SRB2Kart/Ring Racers build (Linux only):
            srb2bld --appimage

     5. List installed SRB2/SRB2Kart/Ring Racers builds:
            srb2bld --listinstalled

     6. Uninstall SRB2/SRB2Kart/Ring Racers build:
            srb2bld --uninstall

     7. Display compatibility table of compiling SRB2/SRB2Kart/Ring Racers builds for each operating system:
            srb2bld --compatibility

  NOTES:
     1. Old builds like SRB2 v2.0, SRB2 Final Demo, SRB2 JTE may not build/run properly on modern Linux distributions/macOS/Windows.

     2. WARNING for macOS users! This script makes changes from rpath to absolute paths within some libraries installed from Homebrew, MacPorts or compiled (mostly should affects libraries compiled by user), that are associated with SRB2 binary, so installing or making App Bundles would be successful. In the future this could make unexpected results with apps or SRB2 builds, that depend on those libraries.

     3. If you want to compile some builds with DiscordRPC support (SRB2 Uncapped Plus, SRB2 NetPlus, SRB2 Kart, SRB2 Kart Moe Mansion and SRB2 Kart VR), then type "HAVE_DISCORDRPC=1" (Linux/Windows) or "-DSRB2_CONFIG_HAVE_DISCORDRPC=ON" (macOS), when the script asks about optional compilation flags (using "srb2bld --install" command).

     4. If on Linux you get error with "/dev/fuse" or FUSE when running script, then load fuse module with "sudo modprobe fuse". You can write "fuse" in configuration file, usually in file "/etc/modules" or "/etc/modules-load.d/fuse.conf" or "/etc/conf.d/modules/fuse.conf", to automatically load this module at boot.

     5. If 64-bit Linux system has issues with creating or loading "Sonic Robo Blast 2 Final Demo" (AppImage or installed), make sure you have installed 32-bit versions of FUSE and glibc:

         - Debian/Ubuntu/Debian based/Ubuntu based: "sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install libfuse2:i386 libc6:i386 zlib1g:i386",

         - Arch/Arch based: uncomment the [multilib] section in /etc/pacman.conf and do "sudo pacman -Su --needed lib32-fuse2 lib32-glibc lib32-gcc-libs lib32-zlib" or use one of the AUR helpers that you have installed - "pikaur -Su --needed lib32-fuse2 lib32-glibc lib32-gcc-libs lib32-zlib" or "paru -Su --needed lib32-fuse2 lib32-glibc lib32-gcc-libs lib32-zlib" or "yay -Su --needed lib32-fuse2 lib32-glibc lib32-gcc-libs lib32-zlib",

         - Gentoo/Gentoo based: "ABI_X86=32 sudo -E emerge -av sys-fs/fuse sys-libs/glibc sys-libs/zlib",

         - Fedora/Fedora based: "sudo dnf install fuse-libs.i686 glibc.i686 libgcc.i686 zlib-ng-compat.i686", 

         - Fedora Silverblue/Fedora Kinoite/Universal Blue (Bazzite, Aurora): "rpm-ostree install -A --allow-inactive fuse-libs.i686 glibc.i686 libgcc.i686 zlib-ng-compat.i686",

         - RHEL/RHEL based: "sudo dnf install fuse-libs.i686 glibc.i686 libgcc.i686 zlib.i686",

         - openSUSE/openSUSE based: "sudo zypper in libfuse2-32bit glibc-32bit libgcc_s1-32bit libz1-32bit",

         - openSUSE MicroOS/openSUSE MicroOS based: "sudo transactional-update pkg in libfuse2-32bit glibc-32bit libgcc_s1-32bit libz1-32bit && sudo transactional-update apply",

         - Void/Void based: "sudo xbps-install -S void-repo-multilib && sudo xbps-install -Su fuse-32bit glibc-32bit libgcc-32bit zlib-32bit".

     6. If Linux system has issue with running build because of not found compiled libraries, even though they are installed, set: export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH" in "~/.bash_profile" or "~/.zshrc".

     7. There are couple of patches applied within source code of games. Their purpose is to prevent conflicts of installing/running of multiple builds overlapping each other with the same names of directories for storing assets and configuration/saves. Other patches include fixing compilation for some builds on particular systems.

     8. If you choose branch other than default, configuration directory's name will be changed, for example ".srb2" will become ".srb2udmf", if "udmf" was chosen. Still remember to make backup of configuration/save files, before upgrading to next release of SRB2/SRB2Kart/Ring Racers build, if you chose default branch or kept previously chosen different branch.

     9. If you have error "invalid file system type on '/sys/fs/cgroup'", while running script, issue could be with not running cgroups service "sudo systemctl enable cgconfig && sudo systemctl start cgconfig" or "sudo systemctl enable cgmanager && sudo systemctl start cgmanager" or "sudo rc-update add cgroups && sudo rc-service cgroups start" and reboot system.

     10. If you receive permission issues or errors related to /etc/subuid, /etc/subgid, UID and GID, please check if you have set UIDs/GIDs for user in path /etc/subuid and /etc/subgid. For example "testuser:231072:65536" will assign 65,536 subordinate UIDs/GIDs (231072-296607) to user called "testuser", so configure to user you are logged to. If you still have permission errors, increase range for user you are logged to in files /etc/subuid and /etc/subgid, for example "testuser:231072:200000". Additionally, if you have podman installed, enter "podman system migrate".

     11. If docker fails to run despite following installation/configuration instructions and notes from srb2bld's README, consider switching to "podman".

     12. If you get "unhandled exception" when running Ultimate Zone Builder or High Voltage Ring, uninstall mono in your system.

     13. To deal with out of memory errors, for example "g++: fatal error: Killed signal terminated program cc1plus", decrease number of CPU threads using variable "SRB2BLDNCPU=[number of CPU threads]".

     14. Building Android APKs requires gradlew script and Gradle files in the directory "android" for SRB2 Custom.

     15. For built Flatpak bundles for 32-bit builds (SRB2 Final Demo, SRB2 JTE), you need to install Flatpak "org.freedesktop.Platform.Compat.i386" with command "flatpak --user install org.freedesktop.Platform.Compat.i386".

     16. Sometimes fixup_bundle function, when building and installing bundle for macOS, fails due to missing library, but the path for it exists. Recommendation is to completely close terminal, reopen it again and run again srb2bld. Other way is to free RAM with "sudo purge".

     17. In order to compile and install custom SRB2/SRB2Kart/Ring Racers build (assuming it is not a very old one) from local or remote repository, write environment variables in shell's configuration file, like ".bash_profile" or ".zshrc", which are:

          - SRB2BLDGITPATH - path to local or remote repository,

          - SRB2BLDGITVER - chosen branch to download build from remote repository,

          - SRB2BLDASSETPATH - path to assets from local or remote path (supported links/paths:
               - websites with direct link to file, for example, "https://github.com/STJr/SRB2/releases/download/SRB2_release_2.2.10/SRB2-v2210-Full.zip",
               - mega.nz,
               - drive.google.com,
               - dropbox.com,
               - full path to downloaded archived file in formats supported by p7zip (https://www.7-zip.org) or full path to directory with build's assets, for example $HOME/Downloads/SRB2.zip for Linux and macOS or C:\Downloads\SRB2.zip for Windows.)

          - SRB2BLDEXTRAASSETPATH - path to extra assets from local or remote path, in case build requires it. The same supported links/paths applies as SRB2BLDASSETPATH.

          EXAMPLES:
               1. export SRB2BLDGITPATH="https://github.com/STJr/SRB2"

               2. export SRB2BLDGITPATH="https://git.do.srb2.org/TehRealSalt/SRB2"

               3. export SRB2BLDGITPATH="$HOME/Builds/SRB2"

               4. export SRB2BLDGITPATH="C:\Builds\SRB2"

               5. export SRB2BLDGITVER="udmf"

               6. export SRB2BLDGITVER="master"

               7. export SRB2BLDASSETPATH="https://github.com/STJr/SRB2/releases/download/SRB2_release_2.2.10/SRB2-v2210-Full.zip"

               8. export SRB2BLDASSETPATH="https://mega.nz/file/JQswBDAA#IPXWeTmrXrI9YZx6zUznJQ2uIAHryv_WP1JxWfnKbts"

               9. export SRB2BLDASSETPATH="https://drive.google.com/file/d/1Vc-lHph8MxlnfaBZnv0NNpoFKhehmce6"

               10. export SRB2BLDASSETPATH="https://www.dropbox.com/s/5neoderzan6mbh3/SRB2PERSONA%20v1.3.3%20Full%20Installer.exe"

               11. export SRB2BLDASSETPATH="$HOME/Downloads/SRB2-Full.zip"

               12. export SRB2BLDASSETPATH="C:\Downloads\SRB2-Full.zip"

               13. export SRB2BLDASSETPATH="$HOME/Downloads/SRB2-Full"

               14. export SRB2BLDASSETPATH="C:\Downloads\SRB2-Full"

          Then choose "Build SRB2 Custom", when running script.

     18. Other environment variables to use. To activate them with value "1", do for example "export SRB2BLDDEBUG=1":

         - SRB2BLDDEBUG - Getting verbose output from script. Useful for reporting issues in https://github.com/bijman/srb2bld/issues.

         - SRB2BLDDEVMODE - For developers, who want to modify build's source code. Disables cleaning build and resetting changes to build's source code.

         - SRB2BLDNOCCACHE - Disable ccache.

         - SRB2BLDNOGRADLECACHE - Disable gradle cache, when building Android APK.

         - SRB2BLDNCPU - Determine number of CPU threads to compile build. Useful in case of out of memory errors, for example "g++: fatal error: Killed signal terminated program cc1plus".

         - GITHUB_TOKEN - Increase hourly limit of request to GitHub API. Useful, if connecting to SRB2/SRB2Kart/Ring Racers assets and downloading is blocked after many attempts. Current default number of requests without GitHub personal access token is 60 requests per hour and with GitHub personal access token - 5000 requests per hour. For more details and how to, please read https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api and https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens. You need GitHub account to do this.
```

# Notes
1. Old builds like SRB2 v2.0, SRB2 Final Demo, SRB2 JTE may not build/run properly on modern Linux distributions/macOS/Windows.

2. WARNING for macOS users! This script makes changes from rpath to absolute paths within some libraries installed from Homebrew, MacPorts or compiled (mostly should affects libraries compiled by user), that are associated with SRB2 binary, so installing or making App Bundles would be successful. In the future this could make unexpected results with apps or SRB2 builds, that depend on those libraries.

3. If you want to compile some builds with DiscordRPC support (SRB2 Uncapped Plus, SRB2 NetPlus, SRB2 Kart, SRB2 Kart Moe Mansion and SRB2 Kart VR), then type "HAVE_DISCORDRPC=1" (Linux/Windows) or "-DSRB2_CONFIG_HAVE_DISCORDRPC=ON" (macOS), when the script asks about optional compilation flags (using "srb2bld --install" command).

4. If on Linux you get error with "/dev/fuse" or FUSE when running script, then load fuse module with `sudo modprobe fuse`. You can write "fuse" in configuration file, usually in file "/etc/modules" or "/etc/modules-load.d/fuse.conf" or "/etc/conf.d/modules/fuse.conf", to automatically load this module at boot.

5. If 64-bit Linux system has issues with creating or loading "Sonic Robo Blast 2 Final Demo" (AppImage or installed), make sure you have installed 32-bit versions of FUSE and glibc:

         - Debian/Ubuntu/Debian based/Ubuntu based: `sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install libfuse2:i386 libc6:i386 zlib1g:i386`,

         - Arch/Arch based: uncomment the [multilib] section in /etc/pacman.conf and do `sudo pacman -Su --needed lib32-fuse2 lib32-glibc lib32-gcc-libs lib32-zlib` or use one of the AUR helpers that you have installed - `pikaur -Su --needed lib32-fuse2 lib32-glibc lib32-gcc-libs lib32-zlib` or `paru -Su --needed lib32-fuse2 lib32-glibc lib32-gcc-libs lib32-zlib` or `yay -Su --needed lib32-fuse2 lib32-glibc lib32-gcc-libs lib32-zlib`,

         - Gentoo/Gentoo based: `ABI_X86=32 sudo -E emerge -av sys-fs/fuse sys-libs/glibc sys-libs/zlib`,

         - Fedora/Fedora based: `sudo dnf install fuse-libs.i686 glibc.i686 libgcc.i686 zlib-ng-compat.i686`,

         - Fedora Silverblue/Fedora Kinoite/Universal Blue (Bazzite, Aurora): `rpm-ostree install -A --allow-inactive fuse-libs.i686 glibc.i686 libgcc.i686 zlib-ng-compat.i686`,

         - RHEL/RHEL based: `sudo dnf install fuse-libs.i686 glibc.i686 libgcc.i686 zlib.i686`,

         - openSUSE/openSUSE based: `sudo zypper in libfuse2-32bit glibc-32bit libgcc_s1-32bit libz1-32bit`,

         - openSUSE MicroOS/openSUSE MicroOS based: `sudo transactional-update pkg in libfuse2-32bit glibc-32bit libgcc_s1-32bit libz1-32bit && sudo transactional-update apply`,

         - Void/Void based: `sudo xbps-install -S void-repo-multilib && sudo xbps-install -Su fuse-32bit glibc-32bit libgcc-32bit zlib-32bit`.

6. If Linux system has issue with running build because of not found compiled libraries, even though they are installed, set `export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"` in "\~/.bash_profile" or "\~/.zshrc".

7. There are couple of patches applied within source code of games. Their purpose is to prevent conflicts of installing/running of multiple builds overlapping each other with the same names of directories for storing assets and configuration/saves. Other patches include fixing compilation for some builds on particular systems.

8. If you choose branch other than default, configuration directory's name will be changed, for example ".srb2" will become ".srb2udmf", if "udmf" was chosen. Still remember to make backup of configuration/save files, before upgrading to next release of SRB2/SRB2Kart/Ring Racers build, if you chose default branch or kept previously chosen different branch.

9. If you have error "invalid file system type on '/sys/fs/cgroup'", while running script, issue could be with not running cgroups service "sudo systemctl enable cgconfig && sudo systemctl start cgconfig" or "sudo systemctl enable cgmanager && sudo systemctl start cgmanager" or "sudo rc-update add cgroups && sudo rc-service cgroups start" and reboot system.

10. If you receive permission issues or errors related to /etc/subuid, /etc/subgid, UID and GID, please check if you have set UIDs/GIDs for user in path /etc/subuid and /etc/subgid. For example "testuser:231072:65536" will assign 65,536 subordinate UIDs/GIDs (231072-296607) to user called "testuser", so configure to user you are logged to. If you still have permission errors, increase range for user you are logged to in files /etc/subuid and /etc/subgid, for example "testuser:231072:200000". Additionally, if you have podman installed, enter "podman system migrate".

11. If docker fails to run despite following installation/configuration instructions and notes from srb2bld's README, consider switching to "podman".

12. If you get "unhandled exception" when running Ultimate Zone Builder, uninstall mono in your system.

13. To deal with out of memory errors, for example "g++: fatal error: Killed signal terminated program cc1plus", decrease number of CPU threads using variable "SRB2BLDNCPU=[number of CPU threads]".

14. Building Android APKs requires gradlew script and Gradle files in the directory "android" for SRB2 Custom.

15. For built Flatpak bundles for 32-bit builds (SRB2 Final Demo, SRB2 JTE), you need to install Flatpak "org.freedesktop.Platform.Compat.i386" with command "flatpak --user install org.freedesktop.Platform.Compat.i386".

16. Sometimes fixup_bundle function, when building and installing bundle for macOS, fails due to missing library, but the path for it exists. Recommendation is to completely close terminal, reopen it again and run again srb2bld. Other way is to free RAM with "sudo purge".

17. In order to compile and install custom SRB2/SRB2Kart/Ring Racers build (assuming it is not a very old one) from local or remote repository, write environment variables in shell's configuration file, like ".bash_profile" or ".zshrc", which are:

    - SRB2BLDGITPATH - path to local or remote repository,

    - SRB2BLDGITVER - chosen branch to download build from remote repository,

    - SRB2BLDASSETPATH - path to assets from local or remote path (supported links/paths:
        - websites with direct link to file, for example, "https://github.com/STJr/SRB2/releases/download/SRB2_release_2.2.10/SRB2-v2210-Full.zip",
        - mega.nz,
        - drive.google.com,
        - dropbox.com,
        - full path to downloaded archived file in formats supported by p7zip (https://www.7-zip.org) or full path to directory with build's assets, for example $HOME/Downloads/SRB2.zip for Linux and macOS or C:\Downloads\SRB2.zip for Windows.)

    - SRB2BLDEXTRAASSETPATH - path to extra assets from local or remote path, in case build requires it. The same supported links/paths applies as SRB2BLDASSETPATH.
```
    EXAMPLES:
        1. export SRB2BLDGITPATH="https://github.com/STJr/SRB2"

        2. export SRB2BLDGITPATH="https://git.do.srb2.org/TehRealSalt/SRB2"

        3. export SRB2BLDGITPATH="$HOME/Builds/SRB2"

        4. export SRB2BLDGITPATH="C:\Builds\SRB2"

        5. export SRB2BLDGITVER="udmf"

        6. export SRB2BLDGITVER="master"

        7. export SRB2BLDASSETPATH="https://github.com/STJr/SRB2/releases/download/SRB2_release_2.2.10/SRB2-v2210-Full.zip"

        8. export SRB2BLDASSETPATH="https://mega.nz/file/JQswBDAA#IPXWeTmrXrI9YZx6zUznJQ2uIAHryv_WP1JxWfnKbts"

        9. export SRB2BLDASSETPATH="https://drive.google.com/file/d/1Vc-lHph8MxlnfaBZnv0NNpoFKhehmce6"

        10. export SRB2BLDASSETPATH="https://www.dropbox.com/s/5neoderzan6mbh3/SRB2PERSONA%20v1.3.3%20Full%20Installer.exe"

        11. export SRB2BLDASSETPATH="$HOME/Downloads/SRB2-Full.zip"

        12. export SRB2BLDASSETPATH="C:\Downloads\SRB2-Full.zip"

        13. export SRB2BLDASSETPATH="$HOME/Downloads/SRB2-Full"

        14. export SRB2BLDASSETPATH="C:\Downloads\SRB2-Full"
```
   Then choose "Build SRB2 Custom", when running script.

18. Other environment variables to use. To activate them with value "1", do for example "export SRB2BLDDEBUG=1":

        - SRB2BLDDEBUG - Getting verbose output from script. Useful for reporting issues in https://github.com/bijman/srb2bld/issues.

        - SRB2BLDDEVMODE - For developers, who want to modify build's source code. Disables cleaning build and resetting changes to build's source code.

        - SRB2BLDNOCCACHE - Disable ccache.

        - SRB2BLDNOGRADLECACHE - Disable gradle cache, when building Android APK.

        - SRB2BLDNCPU - Determine number of CPU threads to compile build. Useful in case of out of memory errors, for example "g++: fatal error: Killed signal terminated program cc1plus".

        - GITHUB_TOKEN - Increase hourly limit of request to GitHub API. Useful, if connecting to SRB2/SRB2Kart/Ring Racers assets and downloading is blocked after many attempts. Current default number of requests without GitHub personal access token is 60 requests per hour and with GitHub personal access token - 5000 requests per hour. For more details and how to, please read https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api and https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens. You need GitHub account to do this.
