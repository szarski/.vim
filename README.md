.vim
====

This is just my .vim configuration

Usage
-----

Clone the repo, install Vundle and link files
```bash
git clone https://github.com/szarski/.vim.git ~/.vim
mkdir ~/.vim/backup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "source ~/.vim/vimrc" > ~/.vimrc
echo "source ~/.vim/gvimrc" > ~/.gvimrc
```

Install plugins in vi
```vimscript
:PluginInstall
```

Install Command-T
```bash
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
```
