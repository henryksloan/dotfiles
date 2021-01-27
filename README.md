# Dotfiles
Everyday dotfiles, and installation scripts for new systems.

## Install
The `install.sh` script will inform you of missing dependencies, install and copy utilities and files, and backup any old configs. Config files will be symlinked from the local git directory. In the desired download directory:

```
git clone https://github.com/henryksloan/dotfiles
cd dotfiles
source install.sh
```

Finally, enter neovim (using either the `vim` or `nvim` command), and run `:PlugInstall`

You may also have to logout before the default login shell changes. You may also have to change your terminal font to take one of the installed Powerline fonts.
