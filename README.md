# dotfiles

### If your home directory is empty.
```shell
$ git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anguzmar/dotfiles $HOME
```

### If your home directory is **NOT** empty.
```shell
$ git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anguzmar/dotfiles $HOME/dotfiles-tmp
$ mv $HOME/dotfiles-tmp/* $HOME
$ rm -r $HOME/dotfiles-tmp/
```
