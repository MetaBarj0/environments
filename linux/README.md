# linux

Linux environment configuration essential and external packages.

## Configuration

Under this folder are various sub-folders containing configuration for various
softwares. Many configuration files and folders are hidden (prefixed by '.')
that is why those items may at first look empty.

### Terminology

Some configuration folders contain a `$HOME` folder. This is a placeholder that must be replaced
by your real home folder on your system (i.e. /home/john)

### bash

The bash subdirectory contains everything you'll need to go further. Make sure
to edit `.bashrc` and files located in `.bashd` directory especially the path
part regarding version of software you install (for instance NodeJS)

## Prepare and update the system first

You'll need it later for important up to date softwares you'll need in your daily work.
I let you figure out how to install it as this information may change at the time I'm writing this manual.
Depending the distribution you're using, the package manager commands to issue
may differ. Thus I won't paste any specific command here. I may write specific
version of this manual later with specific linux distribution later, likely
Alpine Linux.

## Essential packages

Those packages can be installed using your package manager:

- tmux
- openssh

#### Generating your keys

Of course no keys are provided within this repository. You have to generate
your own. Feel free to take a look at various documentation on that topic to
get a grasp on how to do it. Don't worry, it's kinda easy.

## Remaining configuration

Everything you need is located in its very own sub directory under the `macos`
one. You only need to copy paste it in the right location to make things
working.

