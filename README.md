# dot-files

<!--toc:start-->

- [dot-files](#dot-files)
  - [nvim (deprecated)](#nvim-deprecated)
  - [nvim-v2 (use this)](#nvim-v2-use-this)
    - [Special instructions:](#special-instructions)
  - [tmux](#tmux)
  <!--toc:end-->

My dotfiles

Create symlinks to relevant folders, hold dot-files in $HOME or preferred location

## nvim (deprecated)

~~Symlink this to `ln -s ~/dot-files/nvim ~/.config/nvim`~~

## nvim-v2 (use this)

Symlink this to `ln -s ~/dot-files/nvim ~/.config/nvim`

This contains the latest LazyVim setup, and is a work in progress to be modified to suit my previous usage of LazyVim.

Things I have yet to modify:

- [ ] Change some annoying diagnostics
- [ ] Turn off notify when doing `<Shift-K>` lookups
- [ ] Turn off markdown warnings that are over zealous
- [ ] Get tokyonight-storm in my blink colorscheme

### Special instructions

packer should auto install itself
You will possibly need to run PackerCompile yourself
Use PackerStatus to see where packer installs packages, can be controled via plugins.lua

## tmux

Symlink this to `ln -s ~/dot-files/.tmux.conf ~/.tmux.conf`
