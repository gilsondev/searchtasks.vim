" searchtasks.vim - Search TODO, FIXME and XXX tasks
" Maintainer:   Gilson Filho <http://gilsondev.com>
" Version:      1.0

if exists("g:searchtasks_list") || &cp || v:version < 700
  finish
endif

let g:searchtasks_list=["TODO", "FIXME", "XXX"]


" Search tasks {{{
function s:SearchTasks(directory)
  if !a:directory
    echo "Directory is required (e.g: SearchTasks **/*.c)."
    return ''
  endif

  for task in g:searchtasks_list
    execute 'vimgrepadd /' . task . '/gj ' . a:directory
  endfor

  " show results
  cwindow
endfunction
" }}}

command -nargs=1 SearchTasks silent call s:SearchTasks('<args>')
" vim:set sw=2 sts=2:
