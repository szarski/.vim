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

  set rtp+=~/.vim/bundle/vundle/
   call vundle#rc()

  Bundle 'gmarik/vundle'
  Bundle 'scrooloose/syntastic'
  Bundle 'mileszs/ack.vim'
  Bundle 'scrooloose/nerdtree'
  Bundle 'tpope/vim-fugitive'
  Bundle 'airblade/vim-rooter'
  Bundle 'wincent/Command-T'
  Bundle 'moll/vim-bbye'
  Bundle 'szarski/buftabs'
  Bundle 'rking/ag.vim'
  Bundle 'flazz/vim-colorschemes'
  Bundle 'vim-scripts/ScrollColors'

  "Language-specific:
  Bundle 'rodjek/vim-puppet'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'nono/vim-handlebars'
  Bundle 'vim-ruby/vim-ruby'
  Bundle 'tpope/vim-bundler'

"" Config files to source from """""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  :so $HOME/.vim/config/NerdTree_config.vim
  :so $HOME/.vim/config/Ack_config.vim
  :so $HOME/.vim/config/Ag_config.vim
  :so $HOME/.vim/config/Buftabs_config.vim
  :so $HOME/.vim/config/OverLength_config.vim

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

  autocmd BufEnter * :Rooter
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
