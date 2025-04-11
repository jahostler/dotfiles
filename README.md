# My Dotfiles

## Overview

The obligatory dotfiles creed:

> These are my dotfiles. There are many like them (and probably better), but these are mine.

If you're reading this, it's probably because we were talking about Neovim. If so, I'm sorry you had to listen to my rambling, and thanks for being a good listener! But, if  you're curious and you want to give my setup a try, read on.

That being said, this is all still a VERY early work in progress, so I wouldn't recommend using them right now unless you are just curious about my setup.

These dotfiles are managed by [chezmoi](https://www.chezmoi.io/user-guide/command-overview/). Right now, they've only been tested on one distro of Linux (Manjaro), but the eventual plan is to accommodate other distros where reasonably possible, and Windows as well.

## Set Up

This should go without saying, but if you have an existing configuration, BACK IT UP first!

### Linux

1. Install chezmoi (should be available in most package managers)
2. Run the following command in your terminal: `chezmoi init https://github.com/jahostler/dotfiles.git`
3. Run `chezmoi diff` to see what all will be changed in your local config
4. If you want to apply everything wholesale, run: `chezmoi apply` (I would only recommend this if you are starting from scratch)
5. If you just want to apply one file at a time, add on the target path to the end: e.g. `chezmoi apply ~/.bashrc`

* For any chezmoi command, you can include `--dry-run --verbose` to get a detailed picture of what the operation would have done.

### Windows

Not ready yet...

### Mac

Sorry, I'm not an Apple guy... ;)
