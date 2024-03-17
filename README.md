# My dotfiles configuration

## Description
In this repository I store my dotfiles configuration. This is a simple way to keep my configuration files in sync across different machines.
If you find something useful, feel free to use it.

## Installation

### Prerequisites
In terms of valid installation of the dotfiles, the following prerequisites are required:
- ITerm2 (you may use other terminal simulator)
- [Starship](https://starship.rs/)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
- [tmux](https://github.com/tmux/tmux)
- [TPM](https://github.com/tmux-plugins/tpm)
- [LazyVim](https://www.lazyvim.org/)

### Creation of new repository
If you need to move your current configuration to git repository you can do it by following these steps:

```bash
git init --bare $HOME/.cfg #Only if you are creating new repository
```
```bash 
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
```bash 
config config --local status.showUntrackedFiles no
```
```bash 
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```
### Cloning the repository
```bash 
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
```bash 
echo ".dotfiles" >> .gitignore
```
```bash 
git clone --bare <git-repo-url> $HOME/.cfg
```
```bash 
config checkout
```
Following error may occurred if you have some of the configuration files already present in your home directory:
```bash 
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
Then it's needed to backup the files and try again.
