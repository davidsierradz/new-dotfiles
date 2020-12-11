autocmd BufReadPost,BufNewFile *.md setlocal foldlevel=1

let b:current_mkdcode = v:false

setlocal foldmethod=expr
setlocal foldexpr=Fold(v:lnum)
setlocal foldenable

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
  return '=' " return previous fold level
endfunction
