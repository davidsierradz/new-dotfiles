" let guile_repl = {
"       \ 'bin': 'guile',
"       \ 'args': ['-L', '.', '-q'],
"       \ 'syntax': 'scheme.guile',
"       \ 'title': 'Guile REPL',
"       \ }

" Throw an error if there is already a scheme.guile REPL defined
" call repl#define_repl('scheme.guile', guile_repl, 'force')

let b:pear_tree_pairs = {
      \ '`': {'closer': '`'},
      \ '"': {'closer': '"'},
      \ '{': {'closer': '}'},
      \ '(': {'closer': ')'},
      \ '[': {'closer': ']'},
      \ }

set fdm=marker
set fmr={{{,}}}
