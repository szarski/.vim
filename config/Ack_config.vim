" Ack config

let g:ack_ignored_directories = [ '.git', 'bin', 'log', 'script', 'build', 'node_modules', '.bundle' ]

function! BetterAck (args)
  "let g:ackprg="ack\\ -H\\ --nocolor\\ --nogroup"
  let ackprg_copy = g:ackprg

  for dir in g:ack_ignored_directories
    let g:ackprg .= "\\ --ignore-dir=" . dir
  endfor

  call Ack(a:args)

  let g:ackprg = ackprg_copy
endfunction
