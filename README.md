# dotfiles

### If your home directory is empty
```shell
$ git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anguzmar/dotfiles $HOME
```

### If your home directory is **NOT** empty
```shell
$ git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anguzmar/dotfiles $HOME/dotfiles-tmp
$ shopt -s dotglob  # Allow globbing to expand hidden files 
$ mv $HOME/dotfiles-tmp/* $HOME
$ shopt -u dotglob
$ rm -r $HOME/dotfiles-tmp/
```
