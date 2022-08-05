# Dotfiles

## Installation

For *nix environment, run:

```
bash -c "$(https://raw.githubusercontent.com/taitohaga/dotfiles/main/install.sh)"
```

For Windows, you have to enable Developer Mode in order to permit
non-priviliged users to create symlinks. 

After that, run:

```
curl https://raw.githubusercontent.com/taitohaga/dotfiles/main/install.bat | cmd.exe
```

If vim-plug fails to clone some plugins, you have to modify your settings
because git may not allow to use symlinks using some commands such as:

```
git config --global core.symlinks true
git config --file /c/ProgramData/git config core.symlinks true
git config --system core.symlinks true
```
