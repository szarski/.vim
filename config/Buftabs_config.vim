let g:buftabs_in_statusline=1
set laststatus=2

let g:buftabs_formatter_pattern = '[root_tail]/[short_path_letters][filename]'
let g:buftabs_marker_start = ''
let g:buftabs_marker_end = ''
let g:buftabs_marker_modified='!!'

hi BuftabsNormal  guifg=#D2FF2F guibg=Black
hi BuftabsActive  guifg=#FFFFFF guibg=#2EE5FA

let g:buftabs_active_highlight_group='BuftabsActive'
let g:buftabs_inactive_highlight_group='BuftabsNormal'

"set statusline=%=buffers:\ %{g:BuftabsStatusline()}
