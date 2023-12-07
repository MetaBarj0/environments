# macos

MacOS environment configuration essential and external packages.

## Configuration

Under this folder are various sub-folders containing configuration for various
softwares. Many configuration files and folders are hidden (prefixed by '.')
that is why those items may at first look empty.

### Terminology

Some configuration folders contain a `$HOME` folder. This is a placeholder that must be replaced
by your real home folder on your system (i.e. /home/john)

### Common configuration

In the upper `common` folder, you may find useful configuration file for
various softwares.

### zsh

The zsh subdirectory contains everything you'll need to go further. Make sure
to edit `.zshrc` and files located in `.zshd` directory especially the path
part regarding version of software you install (for instance NodeJS)

## Prepare and update the system first

If you're a serious guy, you have to install homebrew package manager.
You'll need it later for important up to date softwares you'll need in your daily work.
I let you figure out how to install it as this information may change at the time I'm writing this manual.
Once homebrew is installed, update the system with:
`brew update`
If necessary, upgrade all installed packages on your system:
`brew upgrade`

## Essential packages

Those packages can be installed using homebrew:
`brew install dos2unix git tmux`

#### Generating your keys

Of course no keys are provided within this repository. You have to generate
your own. Feel free to take a look at various documentation on that topic to
get a grasp on how to do it. Don't worry, it's kinda easy.

## Development activities packages and installations

This package group contains a lot of packages to deal with
LLVM:

`brew install llvm`

This formulae is keg only. It means you need to modify your path environment
variable to use this formulae instead of the llvm package shipped with macos.
Don't worry as it's easy and homebrew will tell you how to do it. Moreover, the
`~/.zshd/.zsh_exports` file you installed before should be correctly
configured.

cmake is also great:

`brew install cmake cmake-doc`

Any serious programmer should strive to get fully automated test suites. One
way to get strong ones is by using catch2:

`brew install catch2`

A good alternative to iostream and sprintf familly of function is fmt. Simple
to use, robust and proven:

`brew install fmt`

At the time of this writing, the standard library implement parts of the `fmt`
library. However, some feature do not exist yet in the standard library:
[What are the differences between libfmt and std::format?](https://stackoverflow.com/questions/63586747/what-are-the-differences-between-libfmt-and-stdformat).

Python's pip utility is important too, especially for neovim integration.

- `brew install python3`
- `pip3 install neovim`

ctag is fundamental too and used in neovim plugins

`brew install universal-ctags`

vim-plug is the package manager for neovim:

`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`.

This step is optional as a version of vim plug should be installed when
applying neovim configuration later on.

deno, the modern typescript engine is also necessary for certain vim plugins

`brew install deno`

ripgrep, a fast command line search tool

`brew install rip-grep`

Neovim of course:

`brew install neovim`

And also NodeJS:

- `brew install node`
- `npm install -g neovim`

NodeJs is used by neovim for some of its plugins

### A word about NodeJS

The `.npmrc` file in the `nodejs/$HOME` directory set both the `cache` and the
`prefix` variable to the home folder.

## Remaining configuration

Everything you need is located in its very own sub directory under the `macos`
one. You only need to copy paste it in the right location to make things
working.

