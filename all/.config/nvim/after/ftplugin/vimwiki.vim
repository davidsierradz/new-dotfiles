autocmd BufReadPost,BufNewFile *.md setlocal foldlevel=1

let b:current_mkdcode = v:false

setlocal foldmethod=expr
setlocal foldexpr=Fold(v:lnum)
setlocal foldenable

function! Get_item(lnum) abort
  " Returns: the mainly used data structure in this file
  " An item represents a single list item and is a dictionary with the keys
  " lnum - the line number of the list item
  " type - 1 for bulleted item, 2 for numbered item, 0 for a regular line (default)
  " mrkr - the concrete marker, e.g. '**' or 'b)' (default '')
  " cb   - the char in the checkbox or '' if there is no checkbox
  " Init default
  let item = {'lnum': a:lnum}
  let item.type = 0
  let item.mrkr = ''
  let item.cb = ''

  " Clause: Check lnum argument is in buffer line range
  if a:lnum == 0 || a:lnum > line('$')
    return item
  endif

  " Search for list on current line
  let matches = matchlist(getline(a:lnum), vimwiki#vars#get_wikilocal('rxListItem'))
  " Clause: If not on a list line => do not work
  if matches == [] ||
        \ (matches[1] ==? '' && matches[2] ==? '') ||
        \ (matches[1] !=? '' && matches[2] !=? '')
    return item
  endif

  " Fill item
  let item.cb = matches[3]
  if matches[1] !=? ''
    let item.type = 1
    let item.mrkr = matches[1]
  else
    let item.type = 2
    let item.mrkr = matches[2]
  endif

  " See you on an other stack
  return item
endfunction

if exists('*strdisplaywidth')
  function! String_length(str) abort
    return strdisplaywidth(a:str)
  endfunction
else
  function! String_length(str) abort
    return strlen(substitute(a:str, '.', 'x', 'g'))
  endfunction
endif

function! Get_level(lnum) abort
  " Returns: level of the line
  " 0 is the 'highest' level
  if getline(a:lnum) =~# '^\s*$'
    return 0
  endif
  if !vimwiki#vars#get_syntaxlocal('recurring_bullets')
    let level = indent(a:lnum)
  else
    let level = String_length(matchstr(getline(a:lnum),
          \ vimwiki#vars#get_wikilocal('rx_bullet_chars')))-1
    if level < 0
      let level = (indent(a:lnum) == 0) ? 0 : 9999
    endif
  endif
  return level
endfunction

function! Empty_item() abort
  " Craft: empty item
  return {'type': 0}
endfunction

function! Get_prev_line(lnum) abort
  " Returns: lnum-1 in most cases, but skips blank lines and preformatted text
  " 0 in case of nonvalid line and a header, because a header ends every list
  let cur_ln = a:lnum - 1

  if getline(cur_ln) =~# vimwiki#vars#get_syntaxlocal('rxPreEnd')
    while 1
      if cur_ln == 0 || getline(cur_ln) =~# vimwiki#vars#get_syntaxlocal('rxPreStart')
        break
      endif
      let cur_ln -= 1
    endwhile
  endif

  let prev_line = prevnonblank(cur_ln)

  if prev_line < 0 || prev_line > line('$') ||
        \ getline(prev_line) =~# vimwiki#vars#get_syntaxlocal('rxHeader')
    return 0
  endif

  return prev_line
endfunction

function! Get_parent(item) abort
  let parent_line = 0

  let cur_ln = prevnonblank(a:item.lnum)
  let child_lvl = Get_level(cur_ln)
  if child_lvl == 0
    return Empty_item()
  endif

  while 1
    let cur_ln = Get_prev_line(cur_ln)
    if cur_ln == 0 | break | endif
    let cur_lvl = Get_level(cur_ln)
    if cur_lvl < child_lvl
      let cur_item = Get_item(cur_ln)
      if cur_item.type == 0
        let child_lvl = cur_lvl
        continue
      endif
      let parent_line = cur_ln
      break
    endif
  endwhile
  return Get_item(parent_line)
endfunction

function! Get_next_line(lnum, ...) abort
  " Returns: lnum+1 in most cases, but skips blank lines and preformatted text,
  " 0 in case of nonvalid line.
  " If there is no second argument, 0 is returned at a header, otherwise the
  " header is skipped
  if getline(a:lnum) =~# vimwiki#vars#get_syntaxlocal('rxPreStart')
    let cur_ln = a:lnum + 1
    while cur_ln <= line('$') && getline(cur_ln) !~# vimwiki#vars#get_syntaxlocal('rxPreEnd')
      let cur_ln += 1
    endwhile
    let next_line = cur_ln + 1
  else
    let next_line = a:lnum + 1
  endif

  let next_line = nextnonblank(next_line)

  if a:0 > 0 && getline(next_line) =~# vimwiki#vars#get_syntaxlocal('rxHeader')
    let next_line = Get_next_line(next_line, 1)
  endif

  if next_line < 0 || next_line > line('$') ||
        \ (getline(next_line) =~# vimwiki#vars#get_syntaxlocal('rxHeader') && a:0 == 0)
    return 0
  endif

  return next_line
endfunction

function! Get_first_child(item) abort
  if a:item.lnum >= line('$')
    return Empty_item()
  endif
  let org_lvl = Get_level(a:item.lnum)
  let cur_item = Get_item(Get_next_line(a:item.lnum))
  while 1
    if cur_item.type != 0 && Get_level(cur_item.lnum) > org_lvl
      return cur_item
    endif
    if cur_item.lnum > line('$') || cur_item.lnum <= 0 || Get_level(cur_item.lnum) <= org_lvl
      return Empty_item()
    endif
    let cur_item = Get_item(Get_next_line(cur_item.lnum))
  endwhile
endfunction

function! Get_last_line_of_item_incl_children(item) abort
  " Returns: the last line of a (possibly multiline) item, including all children
  let cur_ln = a:item.lnum
  let org_lvl = Get_level(a:item.lnum)
  while 1
    let next_line = Get_next_line(cur_ln)
    if next_line == 0 || Get_level(next_line) <= org_lvl
      return cur_ln
    endif
    let cur_ln = next_line
  endwhile
endfunction

function! Get_next_child_item(parent, child) abort
  " Returns: the next sibling of a:child, given the parent item
  " Used for iterating over children
  " Note: child items do not necessarily have the same indent, i.e. level
  if a:parent.type == 0 | return Empty_item() | endif
  let parent_lvl = Get_level(a:parent.lnum)
  let cur_ln = Get_last_line_of_item_incl_children(a:child)
  while 1
    let next_line = Get_next_line(cur_ln)
    if next_line == 0 || Get_level(next_line) <= parent_lvl
      break
    endif
    let cur_ln = next_line
    let cur_item = Get_item(cur_ln)
    if cur_item.type > 0
      return cur_item
    endif
  endwhile
  return Empty_item()
endfunction

function! Fold(lnum)
  let fold_level = strlen(matchstr(getline(a:lnum), '^' . g:vimwiki_header_type . '\+'))
  if (fold_level && !vimwiki#u#is_codeblock(a:lnum))
    return '>' . fold_level  " start a fold level
  endif
  if getline(a:lnum) =~ '^\s*```.\+$'
    let b:current_mkdcode = v:true
    return 'a1'
  endif
  if getline(a:lnum) =~ '^\s*```$'
    let b:current_mkdcode = v:false
    return 's1'
  endif

  if getline(a:lnum) =~? '\v^\s*$'
    if (strlen(matchstr(getline(a:lnum + 1), '^' . g:vimwiki_header_type . '\+')) > 0 && !g:vimwiki_fold_blank_lines && !b:current_mkdcode)
      return strlen(matchstr(getline(a:lnum + 1), '^' . g:vimwiki_header_type . '\+')) - 1
    endif
  endif

  let cur_item = Get_item(a:lnum)
  if cur_item.type != 0
    let parent_item = Get_parent(cur_item)
    let child_item = Get_first_child(cur_item)
    let next_item = Get_next_child_item(parent_item, cur_item)
    if child_item.type != 0
      return 'a1'
    elseif next_item.type == 0
      let c_indent = indent(a:lnum) / &shiftwidth
      let n_indent = indent(a:lnum+1) / &shiftwidth
      return 's' . (c_indent - n_indent)
    endif
  endif
  " return '='

  return '=' " return previous fold level
endfunction
