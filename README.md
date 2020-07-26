# dotfiles

### If your home directory is empty
```shell
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anguzmar/dotfiles $HOME
dot config status.showUntrackedFiles no
```

### If your home directory is **NOT** empty
```shell
mkdir $HOME/dotfiles-tmp
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/anguzmar/dotfiles $HOME/dotfiles-tmp
shopt -s dotglob  # Allow globbing to expand hidden files 
cp -r $HOME/dotfiles-tmp/* $HOME
shopt -u dotglob
rm -r $HOME/dotfiles-tmp/
dot config status.showUntrackedFiles no
```
