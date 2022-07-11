# MSYS2

MSYS2 environment configuration essential and external packages.

## Configuration

Under the msys2 folder are various sub-folders containing configuration for various softwares.
Several of configuratio files and folder are hidden (prefixed by '.') that is why those
folders may at first look empty.

### Nomenclatura

Some configuration folders contain a `$HOME` folder. This is a placeholder that must be replaced
by your real home folder on your MSYS2 system (i.e. /home/john)

### Fonts

This MSYS2 environment is meant to be used with the `mintty` terminal emulator and some of its
rich capabilities among that, usage of font ligatures.
In the `fonts` sub-folder, one can find the `Husklug` NerdFont in all its variants. Please,
read the related `README.md` file in this sub-folder to get a grasp on how to install this
awesome font.

### msys2extra

This folder does not contain configuration files but various tools and scripts.
Please, refer to the `README.md` file of this folder to learn more.

### ssh

It may be possible that access mod for the `.ssh` directory won't be correct
if one copies the folder from the repository to its `$HOME` folder. Please
refer to the ssh documentation if something is going weird for you.

## Essential packages

Those packages can be installed using pacman:

- `pacman -S dos2unix`
- `pacman -S git`
- `pacman -S man-db`
- `pacman -S pkgfile`
- `pacman -S tmux`
- `pacman -S unzip`

## Development activities packages and installations

This package group contains a lot of packages to deal with
LLVM:

- mingw-w64-clang-x86_64-toolchain

Issue `pacman -Sg mingw-w64-clang-x86_64-toolchain` to see each
package that is included in this group.

cmake is also great:

- mingw-w64-clang-x86_64-cmake

Python's pip utility is important too, especially for neovim integration

- `pacman -S mingw-w64-clang-x86_64-python-pip`
- `pip install neovim`

ctag is fundamental too and used in neovim plugins

- `pacman -S mingw-w64-clang-x86_64-universal-ctags-git`

vim-plug is the package manager for neovim:

`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`

deno, the modern typescript engine is also necessary for certain vim plugins

`curl -fsSL https://deno.land/install.sh | sh`

## External packages

Essentially, neovim :

`https://github.com/neovim/neovim`

And also NodeJS:

`https://nodejs.org/en/download/`

NodeJs is used by neovim for some of its plugins
