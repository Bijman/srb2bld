If you want to have automated and easier compilation/installation of SRB2 builds, then this is for you.

![srb2bld]()

# Features
- Compiling and installing SRB2, SRB2 Uncapped Plus, SRB2 NetPlus, SRB2 2.1, SRB2 2.0, SRB2 Final Demo, SRB2 Persona, SRB2 Kart or SRB2 Kart Moe Mansion, and installing their dependencies (mostly binaries except for MacOS) based on user's set compilation flags on Linux, MacOS and Windows,
- Creating AppImages (Linux only),
- Removing installed SRB2 games, source code and assets,
- Upgrading installed SRB2 games,
- Runs on Linux, MacOS and Windows (Git Bash).

# Dependencies
- GNU Coreutils,
- Bash or any POSIX compliant shell,
- Findutils,
- Curl,
- Gawk,
- Docker (Linux and Windows only),
- GNU Stow.

Windows users need to also have installed Git Bash to run this script.

As for MacOS users, they need to install these additional dependencies:
- Cmake,
- Autoconf,
- Automake,
- Pkg-config,
- Libtool,
- 7zip.

# Dependencies Installation
**Linux:**
1. In terminal enter this following commands:
- Debian/Ubuntu/Debian based/Ubuntu based: `sudo apt install coreutils findutils bash curl gawk docker.io`,

- Arch/Arch based: `sudo pacman -S coreutils findutils bash curl gawk docker`,

- Gentoo/Gentoo based: `sudo emerge -av coreutils findutils bash curl gawk docker`.

**Windows:**
1. Installing Git Bash:
- Watch this video from 7:19 to 9:33 in [HERE](https://youtu.be/SWYqp7iY_Tc?t=439),

2. Git Bash can be found on start menu,

3. The rest of dependencies are installed, if you followed video.

**MacOS:**
1. In terminal enter this following command:
- `brew install cmake autoconf automake pkgconfig libtool gawk stow 7zip curl`.

# Installation
**Linux:**
1. Open terminal,

2. Enter `git clone https://github.com/Bijman/srb2bld`,

3. Enter `sudo make install`, which will install to "/usr/bin" or "/usr/local/bin", if path exists, or just place script in your directory and change script's permissions to be executable: `chmod 755 srb2bld`,

4. Check if you set properly environment variables from "Configuration" section,

5. Enter `source ~/.bash_profile` or restart terminal.

**Windows:**
1. Open Git Bash,

2. Go to your user directory (usually "C:/Users/[Your username]"): `cd ~`,

3. Enter `git clone https://github.com/Bijman/srb2bld`,

4. Create directory "bin" with command: `mkdir ~/bin`,

5. Copy script to "~/bin": `cp /path/to/srb2bld ~/bin` (keep in mind, that "/path/to/srb2bld" is not literal path, so type your path to srb2bld script),

6. Change script's permissions to be executable: `chmod 755 ~/bin/srb2bld`,

7. Open text editor for "~/.bash_profile": `nano ~/.bash_profile`,

8. Write new path to executables with environment variable PATH like `export PATH="~/bin:$PATH"` in "~/.bash_profile",

9. Check if you set properly other environment variables from "Configuration" section,

10. Enter: `source ~/.bash_profile` or restart Git Bash.

**MacOS:**
1. Open terminal,

2. Enter `git clone https://github.com/Bijman/srb2bld`,

3. Enter `sudo make install`, which will install to "/usr/local/bin", or just place script in your directory and change script's permissions to be executable: `chmod 755 srb2bld`,

4. Check if you set properly other environment variables from "Configuration" section,

5. Enter: `source ~/.bash_profile` or restart terminal.

# Configuration


# Usage (from help text)

```
Build and install SRB2/SRB2Kart from source.

Usage: srb2bld [OPTIONS]
  OPTIONS:
     -h, --help                             Show this help text.
     -a, --appimage                         Compile and create AppImage of SRB2/SRB2Kart build (Linux only).
     -i, --install                          Compile and install SRB2/SRB2Kart build.
     -li, --listinstalled                   List installed SRB2/SRB2Kart builds.
     -ra, --removeasset                     Remove downloaded asset for SRB2/SRB2Kart build.
     -rb, --removebuild                     Remove downloaded source code for SRB2/SRB2Kart build.
     -u, --upgrade                          Upgrade SRB2/SRB2Kart build (Linux only).
     -ui, --uninstall                       Uninstall SRB2/SRB2Kart build.

  EXAMPLES:
     1. Compile and install SRB2/SRB2Kart build:
            srb2bld --install

     2. Compile and create AppImage of SRB2/SRB2Kart build (Linux only):
            srb2bld --appimage

     3. List installed SRB2 builds:
            srb2bld --listinstalled

     4. Uninstall SRB2/SRB2Kart build:
            srb2bld --uninstall

  Warning! Old builds like SRB2 2.0 and SRB2 Final Demo may not build/run properly on modern Linux distributions/MacOS/Windows.
```
