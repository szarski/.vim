" Ack config

let s:ackprg_base="/opt/boxen/homebrew/bin/ack -H --nocolor --nogroup --column"

let s:ack_ignored_directories = [ '.git', 'bin', 'log', 'script', 'build', 'node_modules', '.bundle', '.tmp' ]

for dir in s:ack_ignored_directories
  let s:ackprg_base .= " --ignore-dir=" . dir
endfor

let g:ackprg = s:ackprg_base

" autocmd QuickFixCmdPost *grep* cwindow " open window on ack
