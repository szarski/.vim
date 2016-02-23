let g:ag_prg="ag --nogroup --column"

let s:ag_ignored_directories = [ '.git', 'bin', 'log', 'build', 'node_modules', '.bundle', '.tmp' ]

for dir in s:ag_ignored_directories
  let g:ag_prg .= " --ignore-dir=" . dir
endfor
