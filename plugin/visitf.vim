if exists('g:loaded_visitf')
  finish
endif
let g:loaded_visitf = 1

nnoremap <silent> <Plug>(visitf-next)
\ :<C-u>call visitf#next()<CR>

let g:visitf_rules = get(g:, 'visitf_rules', [])
