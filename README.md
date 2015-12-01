.vim
====

This is just my .vim configuration

Usage
-----

First:
```bash
git clone https://github.com/szarski/.vim.git ~/.vim
mkdir ~/.vim/backup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "source ~/.vim/vimrc" > ~/.vimrc
echo "source ~/.vim/gvimrc" > ~/.gvimrc
```

In VI
```vimscript
:PluginInstall
```

To install Command-T
```bash
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
```
