
"" INDENTATION AND SYNTAX """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  :set shiftwidth=2
  :set expandtab
  :set hidden
  :set nu

  set backupdir=~/.vim/backup/
  set directory=~/.vim/backup/

  cmap w!! w !sudo tee >/dev/null %

  syntax on
  filetype plugin on
  filetype plugin indent on
  au BufRead,BufNewFile *.hamlc set ft=haml
  au BufRead,BufNewFile *.coffee set ft=coffee
  au BufRead,BufNewFile *.handlebars set ft=handlebars
  au BufRead,BufNewFile *.pp set ft=puppet
  au BufRead,BufNewFile *.rb set ft=ruby

"" VUNDLER """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'scrooloose/syntastic'
  Plugin 'mileszs/ack.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-fugitive'
  Plugin 'airblade/vim-rooter'
  Plugin 'wincent/Command-T'
  Plugin 'moll/vim-bbye'
  Plugin 'szarski/buftabs'
  Plugin 'rking/ag.vim'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'vim-scripts/ScrollColors'
  Plugin 'ngmy/vim-rubocop'

  "Language-specific:
  Plugin 'rodjek/vim-puppet'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'nono/vim-handlebars'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-bundler'

  call vundle#end()            " required
  filetype plugin indent on    " required

"" Config files to source from """""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  :so $HOME/.vim/config/NerdTree_config.vim
  :so $HOME/.vim/config/Ack_config.vim
  :so $HOME/.vim/config/Ag_config.vim
  :so $HOME/.vim/config/Buftabs_config.vim
  :so $HOME/.vim/config/OverLength_config.vim
  :so $HOME/.vim/config/Rubocop_config.vim
  :so $HOME/.vim/config/CommandT_config.vim
  :so $HOME/.vim/config/Syntastic_config.vim

"" MAPPINGS AND COMMANDS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " normal mode
  nmap <C-l> :bn <CR>
  nmap <C-h> :bp <CR>
  map <C-j> 5j
  map <C-k> 5k

  "nmap <C-m> :bd <CR>
  "Closes buffer without closing its windows:
  nmap <C-m> :Bdelete <CR>

  nmap <Esc><Esc><Esc> <C-w><C-w>
  nmap <Esc><Esc> :call SmartToggleNerdTree() <CR>
  nmap <expr> <C-e> Elocal()

  " command mode
  cnoremap <C-a> <Home>
  cnoremap <C-d> <Delete>
  cnoremap <C-e> <End>
  cnoremap <C-p> <Up>
  cnoremap <C-n> <Down>
  cnoremap <C-b> <Left>
  cnoremap <C-f> <Right>
    "Alt + b
  cnoremap ļ <S-Left>
    "Alt + f
  cnoremap ń <S-Right>

  "Ack BAck command
  command! -nargs=* -complete=file BAck call BetterAck(<q-args>)

  command! RemoveSwap call RemoveSwapFiles()


"" AUTOCMDs """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  "autocmd BufEnter * :Rooter
  autocmd BufWritePost * execute "CommandTFlush"

"" FUNCTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  function! GetUnlistedBuffers()
    let kept_buffer_names = ['GoToFile']
    return filter(filter(filter(range(0, bufnr('$')), 'bufnr(v:val)!=-1'), 'buflisted(v:val)==0'), 'index(kept_buffer_names, bufname(v:val)) == -1')
  endfunction

  function! WipeoutUnlistedBuffers()
    let bufferIds = GetUnlistedBuffers()
    if len(bufferIds) == 0
      echo "No unlisted buffers found!"
    else
      echo 'Unlisted buffers: ' . string(bufferIds)
      for i in bufferIds
        echo "killing buffer nr " . i
        exec 'bwipeout ' . i
      endfor
      if len(GetUnlistedBuffers()) == 0
        echo "done!"
      else
        echo "DID NOT REMOVE ALL UNLISTED BUFFERS!"
      endif
    endif
  endfunction

  function! Elocal ()
    let dir = getcwd()
    return ":e " . expand('%:p:h') . "/"
  endfunction

  function! OpenThisDir ()
    let fdir = expand('%:p:h')
    return ":tabnew | :args" . fdir . '/* | vertical all'
  endfunction

  function! RemoveSwapFiles()
    exec "!rm " . &backupdir . "*"
  endf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
