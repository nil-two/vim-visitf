function! visitf#is_valid_rule(rule)
  return has_key(a:rule, 'at') && has_key(a:rule, 'rewrite')
endfunction

function! visitf#is_rule_matched(rule, path)
  let check_exists = get(a:rule, 'check_exists', 1)
  return a:path =~# a:rule.at 
  \ && (!check_exists || (check_exists && filereadable(a:path)))
endfunction

function! visitf#next_path(path)
  for rule in get(g:, 'visitf_rules', [])
    if !visitf#is_valid_rule(rule)
      continue
    endif
    if visitf#is_rule_matched(rule, a:path)
      return rule.rewrite(a:path)
    endif
  endfor
  return a:path
endfunction

function! visitf#next()
  let curr_path = expand('%:p')
  let next_path_abs = visitf#next_path(curr_path)
  let next_path_rel = fnamemodify(next_path_abs, ':~:.')
  edit `=next_path_rel`
endfunction
