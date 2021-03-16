" set foldmethod=indent
" set foldlevel=999
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()

if (exists("g:pear_tree_pairs"))
  let b:pear_tree_pairs = extend(deepcopy(g:pear_tree_pairs), {
        \ '`': {'closer': '`'},
        \ '/\*\*': {'closer': '\*/'},
        \ '<*>': {'closer': '</*>',
        \         'not_if': ['br', 'hr', 'img', 'input', 'link', 'meta',
        \                    'area', 'base', 'col', 'command', 'embed',
        \                    'keygen', 'param', 'source', 'track', 'wbr'],
        \         'not_like': '/$'
        \        }
        \ }, 'keep')
endif

" let b:coc_pairs = [["`", ]]
