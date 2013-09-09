set guioptions-=T
colorscheme mustang
highlight Cursor guifg=yellow guibg=red
highlight iCursor guifg=red guibg=white
highlight visual guifg=red guibg=yellow


macmenu &File.New\ Tab key=<Nop>
noremap <D-t> :CommandT <CR>

macmenu &File.New\ Window key=<Nop>
map <silent><D-n> :tabnew<CR>

macmenu &Tools.Make key=<Nop>
map <silent><D-b> :Gblame<CR>

macmenu Window.Select\ Next\ Tab key=<Nop>
macmenu Window.Select\ Previous\ Tab key=<Nop>
noremap <D-}> :bn<CR>
noremap <D-{> :bp<CR>


set guifont=Menlo:h15
 
:so $HOME/.vim/config/Buftabs_config.vim
