# dotfiles

### If your home directory is empty.
```shell
$ git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anguzmar/dotfiles $HOME
```

### If your home directory is **NOT** empty.
```shell
$ git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anguzmar/dotfiles $HOME/dotfiles-temp
$ rm -r $HOME/dotfiles-tmp/
$ alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
