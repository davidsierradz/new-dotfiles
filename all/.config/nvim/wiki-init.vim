"--------------------------------Plugins---------------------------------------" {{{
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
"----------------Basics----------------- {{{
" Using this until the unlisted netrw buffer bug is solved.
Plug 'justinmk/vim-dirvish'

" Allows you to configure % to match more than just single characters.
Plug 'andymass/vim-matchup'
let g:loaded_matchit = 1

" Visualize your Vim undo tree.
Plug 'simnalamburt/vim-mundo'

" Change or add pair of chars surrouding an object.
Plug 'tpope/vim-surround'

" Enable repeating supported plugin maps with '.'
Plug 'tpope/vim-repeat'

" Pairs of handy bracket mappings.
Plug 'tpope/vim-unimpaired'

" Readline style insertion.
Plug 'tpope/vim-rsi'

" Replace operator for Vim
Plug 'svermeulen/vim-subversive'

" Vim plugin that maintains a yank history to cycle between when pasting.
Plug 'svermeulen/vim-yoink'

" Plugin that adds a 'cut' operation separate from 'delete'.
Plug 'svermeulen/vim-cutlass'

" Super-powered writing things.
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical'

" Execute a :command and show the output in a temporary buffer.
Plug 'AndrewRadev/bufferize.vim'

Plug 'tommcdo/vim-exchange'

Plug 'wellle/targets.vim'

Plug 'easymotion/vim-easymotion'

Plug 'tmsvg/pear-tree'
"}}}

"--------------Interface---------------- {{{
" Minimal colorscheme for vim.
Plug 'davidsierradz/vim-colors-pencil'

" Smart close of buffers.
Plug 'Asheq/close-buffers.vim'

" Search your selection text with * or #.
Plug 'haya14busa/vim-asterisk'

" Lightline (statusbar) plugins.
Plug 'itchyny/lightline.vim'
Plug 'davidsierradz/lightline-gruvbox.vim'
Plug 'maximbaz/lightline-trailing-whitespace'

" Draw boxes and arrows in ascii.
Plug 'gyim/vim-boxdraw', { 'for': 'markdown' }

" Smooth scrolling for Vim done right.
" Plug 'psliwka/vim-smoothie'

" Vim plugin that shows keybindings in popup.
Plug 'liuchengxu/vim-which-key'

" Put colors on hex values.
Plug 'norcalli/nvim-colorizer.lua'

Plug 'scr1pt0r/crease.vim'
"}}}

"-------------Integrations-------------- {{{
" FZF.
Plug 'junegunn/fzf.vim'

" Personal Wiki for Vim.
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" markdown preview plugin for (neo)vim.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"}}}

"-------Completions and omnifuncs------- {{{
" List of snippets for Ultisnips.
Plug 'honza/vim-snippets'

" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode.
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"}}}

"------Syntax files and Languages------- {{{
" Yet Another JavaScript Syntax for Vim.
Plug 'yuezk/vim-js'

" Typescript syntax files for Vim.
Plug 'leafgarland/typescript-vim'
let g:typescript_indent_disable = 1

" React JSX syntax highlighting and indenting for vim.
Plug 'maxmellon/vim-jsx-pretty'
"}}}

" Initialize plugin system
call plug#end()
"--------------------------------End Plugins-----------------------------------"
"}}}


"--------------------------------General---------------------------------------"{{{
" Settings for tabs and space indents.
set tabstop=2
set shiftwidth=2
let &softtabstop =&shiftwidth
set expandtab
set wildmode=longest:full,full

" Leave hidden buffers open.
set hidden

" Command-Line options.
set wildignorecase
set wildoptions=pum
set pumblend=0

" Ignore case for completion in insert mode.
set infercase

" Stop certain movements from always going to the first character of a line.
set nostartofline

" Raise a dialog instead of failing a command.
set confirm

" Make ~ an operator.
set tildeop

" Only save folds with :mksession.
set viewoptions=folds

" Round indenting with < and > to shiftwidth.
set shiftround

" Select with the mouse.
set mouse=a

" Sync clipboard with +.
set clipboard+=unnamedplus

" Remove tags from completions.
set complete=.,w,b,u

" Set the title for current terminal instance.
set title

" Set <Space> as leader key and \ as localleader.
let mapleader = " "
let maplocalleader = "\\"

" Wait time for pending mode.
set timeoutlen=500

" Enable persistent undo so that undo history persists across vim sessions.
set undofile

" Allow vim to automatically put VISUAL selection in the * buffer (?).
set guioptions=a

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Fixes for :checkhealth command.
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

" Allow backspace and cursor keys to cross line boundaries.
set whichwrap+=<,>

" Don't share history with main instance.
let &shadafile = stdpath('data') . '/shada/vimwiki.shada'
"--------------------------------End General-----------------------------------"
"}}}


"--------------------------------Visuals---------------------------------------"{{{
" Show matched brace for a brief time.
set showmatch

" Scroll options.
set scrolloff=0
set sidescrolloff=0

" Enable true color support
if $TERM == 'linux' || $TERM == 'screen' || $TERM == 'tmux' || $IS_TTY == 'yes'
  set notermguicolors
else
  set termguicolors
endif

" Live substitution
set inccommand=nosplit

" Break words if the wrap option is set.
set linebreak

" Indent a wrapped line.
set breakindent

" Disable two spaces in join commands.
set nojoinspaces

" Special chars.
set listchars=tab:→\ ,eol:₋,extends:⟩,precedes:⟨,trail:·,space:·

" Dont show current mode in command line.
set noshowmode
"--------------------------------End Visuals-----------------------------------"
"}}}


"--------------------------------Search----------------------------------------"{{{
" Search options
set ignorecase
set smartcase

" Use global in substitution per default.
set gdefault
"--------------------------------End Search------------------------------------"
"}}}


"--------------------------------Splits----------------------------------------"{{{
" Splitting to the right by default.
set splitright
"--------------------------------End Splits------------------------------------"
"}}}


"--------------------------------General Mappings------------------------------"{{{
""/ basics {{{
"/
" Use j and k in wrap lines unless preceded by a count.
noremap <expr> j v:count ? 'j' : 'gj'
noremap <expr> k v:count ? 'k' : 'gk'

" Toggle paste mode with F2 in insert mode.
set pastetoggle=<F2>

" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-l> :syntax sync fromstart <bar> nohlsearch <bar> diffupdate <bar> call lightline#enable() <bar> redraw! <bar> echo<CR>

" Y yanks from current cursor position to end of (wrapped) line, more logical.
nnoremap Y yg$
xnoremap Y g$y

" execute the current line of text as a shell command.
" noremap  Q !!$SHELL<CR>
" vnoremap Q !$SHELL<CR>

" Change à (Alt-`) to -> in insert mode.
inoremap <M-1> ->

" Change <Alt-1> to => in insert mode.
inoremap <M-2> =>

" Transpose two chars in insert mode <C-t>.
inoremap <C-t> <ESC>Xpa

" Select text inside line.
nnoremap vv g^vg$

" Select from current cursor position to before EOL.
nnoremap <M-v> vg$

" Go to start or end of non-blank line chars.
noremap H g^
noremap L g$
vnoremap L g_

" Swap join lines behaviour.
nnoremap <silent> gJ mzJ`zldiw:delmarks z<cr>

" Execute a macro in visual mode.
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Re-select visual block after indenting.
xnoremap < <gv
xnoremap > >gv

" map _ to - see :help -.
nnoremap _ -

" Yank non-blank current line.
nnoremap <silent> <M-y> mzg^yg$`z:delmarks z<cr>

" Cut non-blank current line.
nmap <silent> <M-x> mzg^xg$`z:delmarks z<cr>

" Split a line.
nnoremap <silent> K i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w:delmarks w<cr>

" Keep the cursor in place while joining lines.
nnoremap <silent> J mzJ`z:delmarks z<cr>

" Expand spaces from (|) to ( | ).
" inoremap <M-Space> <Space><Space><Left>

" (|) -> (|.
inoremap <M-BS> <Right><BS>

" Use U as redo.
nnoremap U <c-r>

" Colon-related mappings.
nnoremap ; :
xnoremap ; :

" make ; always "find" forward and , backward
nnoremap <expr> ;; getcharsearch().forward ? ';' : ','
nnoremap <expr> ,, getcharsearch().forward ? ',' : ';'
xnoremap <expr> ;; getcharsearch().forward ? ';' : ','
xnoremap <expr> ,, getcharsearch().forward ? ',' : ';'

cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l
tnoremap <M-`> <C-\><C-N>

tnoremap <C-A-j> <C-\><C-N>gT
tnoremap <C-A-k> <C-\><C-N>gt
nnoremap <C-A-j> gT
nnoremap <C-A-k> gt
inoremap <C-A-j> <C-\><C-N>gT
inoremap <C-A-k> <C-\><C-N>gt

nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

inoremap <M-h> <C-\><C-N><C-w>h
inoremap <M-j> <C-\><C-N><C-w>j
inoremap <M-k> <C-\><C-N><C-w>k
inoremap <M-l> <C-\><C-N><C-w>l
inoremap <M-`> <C-\><C-N>

nnoremap <M-w> :w<CR>

" Run xdg-open over a file path.
" TODO: make function to open directories in vifm (:!$TERMINAL vifm /home/neuromante/).
nnoremap gx :silent !xdg-open "<cfile>:p"<cr>
nnoremap gX :silent !xdg-open "<cfile>:p" &<cr>
"}}}
""/ leader (SPC) {{{
"/
""/ terminal (`) {{{
"/
nnoremap <silent> <Leader>`` :terminal<CR>
nnoremap <silent> <Leader>`c :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>Acd $VIM_DIR<CR>
"}}}
""/ quit (q) {{{
"/
nnoremap <silent> <Leader>qq  :q<CR>
nnoremap <silent> <Leader>qw  :wqa<CR>
nnoremap <silent> <Leader>qQ  :qa!<CR>
nnoremap <silent> <Leader>qa  :qa<CR>
"}}}
""/ file/find/folds (f) {{{
"/
" File save
nnoremap <silent> <Leader>ff :write<CR>
"}}}
""/ buffers (b) {{{
"/
" Reloads a buffer.
nnoremap <leader>br :e!<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab.
nnoremap <leader>bq :bp <BAR> bd #<CR>

nnoremap <leader>bt :bd %<CR>

" Close the current buffer and move to the previous one and close the window
" This replicates the idea of closing a tab.
function! DeleteWindowIfNotLast()
  if (winnr('$') > 1 && len(getbufinfo({'buflisted':1})) > 1)
    execute ":bp\<BAR>bd#\<BAR>q"
    return 1
  endif

  echo "Only one window or buffer."
  return 0
endfunction
nnoremap <leader>bw :call DeleteWindowIfNotLast()<CR>

" Remap go to last file with backspace.
nnoremap <leader>bb <C-^>

" Call close-buffers.vim plugin to list an options menu.
nnoremap <silent> <leader>bd :Bwipeout menu<CR>

nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bf :bfirst<CR>
nnoremap <silent> <Leader>bl :blast<CR>
nnoremap <silent> <Leader>bj :bd<CR>
nnoremap <silent> <Leader>bk :bw<CR>
nnoremap <silent> <Leader>ba :ls<CR>

" for s:i in range(1, 9)
"   " <Leader>b[1-9] move to buffer [1-9]
"   execute 'nnoremap <Leader>b'.s:i ':b'.s:i.'<CR>'
" endfor
" unlet s:i
"}}}
""/ windows (w) {{{
"/
" nnoremap <Leader>ww <C-W>w
" nnoremap <Leader>wr <C-W>r
" nnoremap <Leader>wd <C-W>c
" nnoremap <Leader>wq <C-W>q
" nnoremap <Leader>wj <C-W>j
" nnoremap <Leader>wk <C-W>k
" nnoremap <Leader>wh <C-W>h
" nnoremap <Leader>wl <C-W>l
" nnoremap <Leader>wH <C-W>H
" nnoremap <Leader>wL <C-W>L
" nnoremap <Leader>wJ <C-W>J
" nnoremap <Leader>wK <C-W>K
" nnoremap <Leader>w= <C-W>=
" nnoremap <leader>ws <c-w>s
" nnoremap <leader>wv <c-w>v
" nnoremap <leader>w\| <c-w>\|
" nnoremap <leader>w_ <c-w>_
" nnoremap <leader>wo <c-w>o
" nnoremap <leader>w+ <c-w>\|<c-w>_
" nnoremap <leader>wz <c-w>\|<c-w>_

" for s:i in range(1, 9)
"   " <Leader>w[1-9] move to window [1-9]
"   execute 'nnoremap <Leader>w'.s:i ' :'.s:i.'wincmd w<CR>'
" endfor
" unlet s:i
"}}}
""/ tabs (t) {{{
"/
" for s:i in range(1, 9)
"   " <Leader>t[1-9] move to tab [1-9]
"   execute 'nnoremap <Leader>t'.s:i s:i.'gt'
" endfor
" unlet s:i
"}}}
""/ toggles (y) {{{
"/
" Toggles conceallevel 0 to 3.
nnoremap <silent> <Leader>ye :<C-R>=&conceallevel is# 0 ? "set conceallevel=3" : "set conceallevel=0"<CR><CR>
" Toggles formatoptions to add comment after <CR> or o (and O).
nnoremap <silent> <Leader>yf :<C-R>=&formatoptions !~# "cro" ? "setlocal formatoptions+=cro" : "setlocal formatoptions-=cro"<CR><CR>
nnoremap <silent> <Leader>yq :<C-R>=&scrollback is# 1 ? "setlocal scrollback=50000" : "setlocal scrollback=1"<CR><CR>
nnoremap <silent> <Leader>yz :<C-R>=&dictionary is# "/usr/share/dict/words" ? "set dictionary=/usr/share/dict/spanish" : "set dictionary=/usr/share/dict/words"<CR><CR>
"}}}
""/ settings (s) {{{
"/
" Change pwd to current file path.
nnoremap <leader>sc :cd %:p:h<CR>:pwd<CR>
"}}}
""/ registers (r) {{{
"/
" Copy the unnamed register to the z register.
nnoremap <silent> <leader>rz :let @z=@"<CR>
" Copy the % register (current file path) to + register (clipboard).
nnoremap <leader>r% :let @+=@%<CR>
" Copy the current line number to + register.
nnoremap <silent> <leader>r. :call setreg('+', line('.'))<CR>
"}}}
""/ local filetype (,) {{{
"/
""/ diff {{{
"/
" Choose one block in a 3-way merge resolution.
" if &diff
"   syntax off
"   nnoremap <buffer> <LocalLeader>1 :diffget LOCAL<CR>
"   nnoremap <buffer> <LocalLeader>2 :diffget BASE<CR>
"   nnoremap <buffer> <LocalLeader>3 :diffget REMOTE<CR>
" endif
"}}}
"}}}
""/ others (o) {{{
"/
" Run gq in all buffer and return to same place.
nnoremap <F12> mzgggqG`z:delmarks z<cr>

" Echo syntax group of word under cursor.
nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"}}}
"}}}
"--------------------------------End General Mappings--------------------------"
"}}}


"--------------------------------Plugins Configuration-------------------------"{{{
""/ close-buffers.vim {{{
"/
"}}}
""/ coc.nvim {{{
"/
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=1000

" don't give |ins-completion-menu| messages.
set shortmess=atOIc

" always show signcolumns
set signcolumn=no

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! CocPrettierFormatUseGlobal()
  call coc#config('prettier.onlyUseLocalVersion', v:false)
  call coc#config('prettier.requireConfig', v:false)
  call CocAction('reloadExtension', 'coc-prettier')
  call CocAction('runCommand', 'prettier.formatFile')
  call coc#config('prettier.onlyUseLocalVersion', v:true)
  call coc#config('prettier.requireConfig', v:true)
  call CocAction('reloadExtension', 'coc-prettier')
endfunction
command! CocPrettierFormatUseGlobal call CocPrettierFormatUseGlobal()

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

let g:coc_data_home = $HOME . '/.config/coc-wiki'
let g:coc_config_home = $HOME . '/.config/nvim/wiki'

let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-cspell-dicts',
      \ 'coc-lists',
      \ 'coc-dictionary',
      \ 'coc-emmet',
      \ 'coc-explorer',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-spell-checker',
      \ 'coc-yank',
      \ ]

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#cc241d gui=bold
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

let g:coc_filetype_map = {
      \ 'vimwiki': 'markdown',
      \ }

" augroup Pairs
"   autocmd FileType vimwiki let b:coc_pairs = [["```", "```"]]
" augroup end

function CocExplorerDirvish() abort
  if &filetype=='dirvish'
    if isdirectory(expand("<cfile>"))
      execute 'CocCommand explorer --reveal=' . expand('<cfile>:p:h')
    else
      execute 'CocCommand explorer --reveal=' . expand('<cfile>:p')
    endif
  else
    execute 'CocCommand explorer'
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <M-CR> pumvisible() && coc#rpc#request('hasSelected', []) ? "\<C-y>"
"       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
imap <silent><expr> <M-CR> complete_info()["selected"] != "-1" ? "\<C-y>"
      \: "\<Plug>(PearTreeExpand)"

" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" coc-smartf
" press <esc> to cancel.
" nmap <C-Space> <Plug>(coc-smartf-forward)
" nmap <M-Space> <Plug>(coc-smartf-backward)
" nmap ;; <Plug>(coc-smartf-repeat)
" nmap ,, <Plug>(coc-smartf-repeat-opposite)

nmap <silent> [[ <Plug>(coc-diagnostic-prev)
nmap <silent> ]] <Plug>(coc-diagnostic-next)

nnoremap <Leader>fa :call CocExplorerDirvish()<CR>
nnoremap <Leader>fA :CocCommand explorer --position tab<CR>

nmap <silent> <leader>l[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>l] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>lgd <Plug>(coc-definition)
nmap <silent> <leader>lgv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> <leader>lgs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> <leader>lgt :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> <leader>lgy <Plug>(coc-type-definition)
nmap <silent> <leader>lgi <Plug>(coc-implementation)
nmap <silent> <leader>lgr <Plug>(coc-references)
nnoremap <silent> <leader>lgk :call <SID>show_documentation()<CR>
nmap <leader>lr <Plug>(coc-rename)
xmap <leader>lf  <Plug>(coc-format-selected)
nmap <leader>lf  <Plug>(coc-format-selected)
xmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>la  <Plug>(coc-codeaction-selected)
nmap <leader>lac  <Plug>(coc-codeaction)
nmap <leader>lqf  <Plug>(coc-fix-current)
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

nnoremap <silent> <leader>ph  :<C-u>CocList -A --normal yank<cr>

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>cda  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>
nnoremap <silent> <leader>cR  :<C-u>CocRestart<CR>
nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

xmap <silent> <leader>ca :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"}}}
""/ crease.vim {{{
"/
set fillchars=fold:‧
let g:crease_foldtext = { 'default': '%{CreaseIndent()}%t%= %l lines %{CreasePercentage()}' }
function CreasePercentage() abort
  let foldSize = 1 + v:foldend - v:foldstart
  let lineCount = line("$")
  let foldPercentage = "[" . printf("%4s", printf("%.1f", (foldSize*1.0)/lineCount*100)) . "%] "
  return foldPercentage
endfunction
function CreaseIndent() abort
  let fs = nextnonblank(v:foldstart)
  let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  let foldLevelStr = repeat(' ', match(line,'\S'))
  return foldLevelStr
endfunction
"}}}
""/ editorconfig/editorconfig-vim {{{
"/
" Don't output 'cursorcolumn'.
let g:EditorConfig_max_line_indicator = "none"
"}}}
""/ fzf.vim {{{
"/
let $FZF_DEFAULT_COMMAND = 'rg --smart-case --files --color never --no-heading --hidden "."'

let $FZF_PREVIEW_COMMAND = 'cat {}'

function! s:goto_def(lines) abort
  silent! exe 'e +BTags '.a:lines[0]
  call timer_start(10, {-> execute('startinsert') })
endfunction

function! s:goto_line(lines) abort
  silent! exe 'e '.a:lines[0]
  call timer_start(10, {-> feedkeys(':', 'n') })
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-g': function('s:goto_def'),
  \ 'ctrl-f': function('s:goto_line'),
  \ 'ctrl-l': {l -> execute('args ' . join(map(l, {_, v -> fnameescape(v)}), ' '))},
  \  }

" Show preview window with '?'.
function! FilesFZF(query, fullscreen)
  let $FZF_DEFAULT_COMMAND = 'rg --smart-case --files --color never --no-heading --hidden "."'
  call fzf#vim#files(a:query, fzf#vim#with_preview('right:50%:hidden', '?'), a:fullscreen)
endfunction

command! -nargs=* -bang -complete=dir Files call FilesFZF(<q-args>, <bang>0)

function! AllFilesFzf(query, fullscreen)
  let $FZF_DEFAULT_COMMAND = 'rg -uu --smart-case --files --color never --no-heading --hidden "."'
  call fzf#vim#files(a:query, fzf#vim#with_preview('right:50%:hidden', '?'), a:fullscreen)
endfunction

command! -nargs=* -bang -complete=dir AFiles call AllFilesFzf(<q-args>, <bang>0)

function! RipgrepFzf(query, fullscreen)
  let $FZF_DEFAULT_COMMAND = 'rg --smart-case --files --color never --no-heading --hidden "."'
  let initial_command = 'rg --smart-case --files --color never --no-heading --hidden "."'
  let reload_command = 'rg -uu --smart-case --files --color never --no-heading --hidden "." || true'
  call fzf#vim#files(a:query, fzf#vim#with_preview({'options': [
        \ '--bind',
        \ 'ctrl-r:reload:'.reload_command,
        \ '--bind',
        \ 'ctrl-alt-r:reload:'.initial_command,
        \ '--bind', '?:toggle-preview',
        \ '--header',
        \ 'Press CTRL-R/CTRL-ALT-R to toggle hide files',
        \ '--preview-window',
        \ 'right:50%:hidden',
        \ ]}), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Show preview window with '?'
command! -bang -nargs=* Ag
    \ call fzf#vim#ag(<q-args>,
    \ '--color-path 400 --color-line-number 400 --color-match 400 --hidden --path-to-ignore ~/.ignore --skip-vcs-ignores',
    \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
    \ <bang>0)

" rg --smart-case --files-with-matches --color never --no-heading --no-ignore --hidden ""
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
    \   <bang>0)

command! -bang -nargs=* RgWithFileName
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

command! -bang -nargs=* Rgg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --hidden --no-ignore-vcs '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
    \   <bang>0)

command! -bang -nargs=* RggWithFileName
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --hidden --no-ignore-vcs '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

command! -bang -nargs=* Rggg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --hidden --no-ignore -uu '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
    \   <bang>0)

command! -bang -nargs=* RgggWithFileName
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --hidden --no-ignore -uu '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)


if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Terminal buffer options for fzf

augroup fzf
  autocmd! FileType fzf
  autocmd FileType fzf set noshowmode noruler nonu
augroup END

if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=0

  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') is# -1
    let $FZF_DEFAULT_OPTS .= ' --border --margin=0,2'
  endif

  function! FloatingFZF()
    let opts = { 'relative': 'editor',
               \ 'row': 0,
               \ 'col': 0,
               \ 'width': &columns,
               \ 'height': &lines }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
  endfunction

  " let g:fzf_layout = { 'window': 'call FloatingFZF()' }
  let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
else
  " FZF position.
  let g:fzf_layout = { 'window': '-tabnew' }
endif

nnoremap <leader>zq :Rg<CR>
nnoremap <leader>zw :Rgg<CR>
nnoremap <leader>ze :Rggg<CR>
nnoremap <leader>zQ :RgWithFileName<CR>
nnoremap <leader>zW :RggWithFileName<CR>
nnoremap <leader>zE :RgggWithFileName<CR>
nnoremap <leader>zh :History<CR>
nnoremap <leader>zx :Snippets<CR>
nnoremap <leader>zz :Buffers<CR>
nnoremap <leader>zp :RG ~/notes/<CR>
nnoremap <leader>zP :AFiles<CR>
"}}}
""/ lightline.vim {{{
"/

" Use autocmd to force lightline update.
augroup lightline#coc
  autocmd!
  autocmd User CocDiagnosticChange call lightline#update()
  autocmd User CocStatusChange call lightline#update()
augroup END

let g:lightline = {
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['readonly', 'relativefilepath', 'modified'],
      \     ],
      \     'right': [
      \       ['mixed', 'trailing'],
      \       ['coc_error', 'coc_warning', 'coc_hint', 'coc_info', 'coc_fix'],
      \       ['virtuallineinfo', 'percentage', 'cocstatus'],
      \       ['foldlevel', 'gitbranch', 'fileformat', 'fileencoding', 'filetype']
      \     ]
      \   },
      \   'inactive': {
      \     'left': [
      \       ['readonly', 'relativefilepath', 'modified'],
      \     ],
      \     'right': []
      \   },
      \   'component': {
      \     'mode': '%{lightline#mode()}',
      \     'relativefilepath': '%<%{LightLineFilename()}',
      \     'percentage': '%p%%',
      \     'virtuallineinfo': '%l-%c%V',
      \   },
      \   'component_function': {
      \     'foldlevel': 'FoldLevel',
      \     'cocstatus': 'coc#status',
      \   },
      \   'component_expand': {
      \     'trailing': 'lightline#trailing_whitespace#component',
      \     'coc_error'        : 'LightlineCocErrors',
      \     'coc_warning'      : 'LightlineCocWarnings',
      \     'coc_info'         : 'LightlineCocInfos',
      \     'coc_hint'         : 'LightlineCocHints',
      \     'coc_fix'          : 'LightlineCocFixes',
      \     'mixed'            : 'Check_mixed_indent_file',
      \   },
      \   'component_type': {
      \     'coc_error' : 'error',
      \     'coc_warning' : 'warning',
      \     'coc_info' : 'tabsel',
      \     'coc_hint' : 'tabsel',
      \     'coc_fix' : 'tabsel',
      \     'trailing': 'warning',
      \     'mixed': 'warning',
      \   },
      \ }

function! FoldLevel()
  return &foldlevel && strlen(&foldlevel) !=# '0' ? &foldlevel : ''
endfunction

function! Strcharpart(...)
  return call('strcharpart',  a:000)
endfunction

function! s:lightline_coc_diagnostic(kind, sign) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = ''
  endtry
  return printf('%s %d', s, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint')
endfunction

let g:lightline#trailing_whitespace#indicator='•'

function! Check_mixed_indent_file()
  let indent_tabs = search('\v(^\t+)', 'nw')
  let indent_spc  = search('\v(^ +)', 'nw')
  if indent_tabs > 0 && indent_spc > 0
    return printf("")
  else
    return ''
  endif
endfunction

function! LightLineFilename()
  let l:fname = expand('%:t')
  let l:fpath = expand('%')
  return &filetype ==# 'dirvish' ?
        \   (l:fpath ==# getcwd() . '/' ? fnamemodify(l:fpath, ':~') :
        \   fnamemodify(l:fpath, ':~:.')) :
        \ &filetype ==# 'fzf' ? 'fzf' :
        \ '' !=# l:fname ? fnamemodify(l:fpath, ':~:.') : '[No Name]'
endfunction
"}}}
""/ markdown-preview.nvim {{{
"/
let g:mkdp_browser = '/usr/bin/qutebrowser'
"}}}
""/ pear-tree {{{
"/
imap <BS> <Plug>(PearTreeBackspace)
" imap <Esc> <Plug>(PearTreeFinishExpansion)
imap <M-Space> <Plug>(PearTreeSpace)
imap <C-g><C-g> <Plug>(PearTreeJump)
let g:pear_tree_pairs = {
      \ '(': {'closer': ')'},
      \ '[': {'closer': ']'},
      \ '{': {'closer': '}'},
      \ "'": {'closer': "'"},
      \ '"': {'closer': '"'},
      \ '`': {'closer': '`'},
      \ '```': {'closer': '```'},
      \ '<!--': {'closer': '-->'},
      \ }

let g:pear_tree_repeatable_expand = 0
let g:pear_tree_map_special_keys = 0
let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 0
"}}}
""/ vim-asterisk {{{
"/
" Enable keepCursor feature.
let g:asterisk#keeppos = 1
"}}}
""/ vimwiki {{{
"/
let g:vimwiki_list = [
      \ {'path': '~/notes/',
      \ 'links_space_char': '-',
      \ 'automatic_nested_syntaxes': 0,
      \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_global_ext = 0

let g:vimwiki_folding = 'custom'

let g:vimwiki_auto_header = 1

nnoremap <F4> "=strftime("%Y-%m-%d_%H:%M:%S")<CR>P
inoremap <F4> <C-R>=strftime("%Y-%m-%d_%H:%M:%S")<CR>
iab <expr> dts strftime("%Y-%m-%d_%H:%M:%S")

" autocmd FileType vimwiki setlocal fdm=marker fmr={{{,}}}

let g:vimwiki_listsyms = ' .oOx'

" set to 1 to fold blank lines
let g:vimwiki_fold_blank_lines = 0
" set to '=' for wiki syntax
let g:vimwiki_header_type = '#'

function! Fold(lnum)
  let fold_level = strlen(matchstr(getline(a:lnum), '^' . g:vimwiki_header_type . '\+'))
  if (fold_level && !vimwiki#u#is_codeblock(a:lnum))
    return '>' . fold_level  " start a fold level
  endif
  if getline(a:lnum) =~? '\v^\s*$'
    if (strlen(matchstr(getline(a:lnum + 1), '^' . g:vimwiki_header_type . '\+')) > 0 && !g:vimwiki_fold_blank_lines)
      return '-1' " don't fold last blank line before header
    endif
  endif
  return '=' " return previous fold level
endfunction

function! VimwikiFoldLevelCustom(lnum) abort
  let line = getline(a:lnum)

  " Header/section folding...
  if line =~# vimwiki#vars#get_syntaxlocal('rxHeader') && !vimwiki#u#is_codeblock(a:lnum)
    return '>'.vimwiki#u#count_first_sym(line)
  else
    return '='
  endif
endfunction

augroup VimrcAuGroup
  autocmd!
  autocmd FileType vimwiki setlocal foldmethod=expr |
        \ setlocal foldenable | set foldexpr=Fold(v:lnum)
  " In kitty we are mapping shift+enter to <M-<> for this to work.
  autocmd FileType vimwiki inoremap <silent> <M-lt>
        \ <Esc>:VimwikiReturn 2 2<CR>
  " Check if current lines is a codeblock (```), if yes use coc#on_enter
  " if not, use VimwikiReturn (for lists)
  " autocmd FileType vimwiki imap <silent><expr> <CR>
  "       \ vimwiki#u#is_codeblock(line(".")) ?
  "           \ complete_info()["selected"] != "-1" ?
  "               \  "\<C-y>"
  "               \: "\<Plug>(PearTreeExpand)"
  "           \: "<C-]><Esc>:VimwikiReturn 1 5<CR>"
augroup END

imap <silent><expr> <CR>
      \ vimwiki#u#is_codeblock(line(".")) ?
        \ complete_info()["selected"] != "-1" ?
          \  "\<C-y>"
          \: "\<Plug>(PearTreeExpand)"
      \: "<C-]><Esc>:VimwikiReturn 1 5<CR>"

let g:vimwiki_conceallevel = 3

function! FollowLink()
  VimwikiFollowLink
  normal zv
endfunction

nmap <leader><leader>w+ <Plug>VimwikiNormalizeLink
vmap <leader><leader>w+ <Plug>VimwikiNormalizeLinkVisual
nmap <leader><leader>w<Space> <Plug>VimwikiToggleListItem
vmap <leader><leader>w<Space> <Plug>VimwikiToggleListItem
nmap <leader><leader>w[ <Plug>VimwikiGoToPrevHeader
nmap <leader><leader>w] <Plug>VimwikiGoToNextHeader

augroup initvim
  au!
  autocmd BufReadPost,BufNewFile ~/notes/index.md setlocal foldlevel=2
  autocmd filetype vimwiki nmap <buffer> <F7> <Plug>VimwikiFollowLink
  autocmd filetype vimwiki nnoremap <buffer> <silent> <CR> :call FollowLink()<CR>
augroup END
"}}}
""/ vim-asterisk {{{
"/
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
"}}}
""/ vim-boxdraw {{{
"/
" The cursor can go nuts.
" augroup setvirtualedit
"   autocmd!
"   autocmd BufLeave *.md setlocal virtualedit-=all
"   autocmd BufEnter *.md setlocal virtualedit+=all
" augroup end
"}}}
""/ vim-cutlass {{{
"/
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D
"}}}
""/ vim-dirvish {{{
"/
" Put dirs first.
let g:dirvish_mode = ':sort ,^\v(.*[\/])|\ze,'

" Doesnt work with g:dirvish_mode dirs first.
let g:dirvish_relative_paths = 1

" Set <leader>cd to change directories in dirvish buffers.
augroup dirvish_events
  autocmd!
  autocmd FileType dirvish setlocal cursorline
augroup END

" Set <leader>cd to change directories in dirvish buffers.
augroup dirvish_config
  autocmd!

  " Map `t` to open in new tab.
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> <LocalLeader>t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> <LocalLeader>t :call dirvish#open('tabedit', 0)<CR>

  " Map `gr` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer> <LocalLeader>gr :<C-U>:Dirvish %<CR>

  " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ <LocalLeader>gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>

  autocmd FileType dirvish
        \ nnoremap <buffer> <LocalLeader>cd :cd %<CR>:pwd<CR>
  autocmd FileType dirvish
        \ nnoremap <nowait><buffer><silent> <M-n> <C-\><C-n>k:call feedkeys("p")<CR>
augroup END
"}}}
""/ vim-easymotion {{{
"/
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap Q <Plug>(easymotion-s)
xmap Q <Plug>(easymotion-s)
omap Q <Plug>(easymotion-s)
nmap <leader><leader>ef <Plug>(easymotion-f)
nmap <leader><leader>eF <Plug>(easymotion-F)
nmap <leader><leader>e, <Plug>(easymotion-prev)
nmap <leader><leader>e; <Plug>(easymotion-next)
"}}}
""/ vim-matchup {{{
"/
" let g:matchup_matchparen_enabled = 0

" To enable the delete surrounding (ds%) and change surrounding (cs%) maps.
let g:matchup_surround_enabled = 1

let g:matchup_matchparen_status_offscreen = 0

"let g:matchup_matchparen_deferred = 1
"let g:matchup_matchparen_hi_surround_always = 1

nmap <silent> <leader><leader>mm <plug>(matchup-hi-surround)
"}}}
""/ vim-mundo {{{
"/
" Put preview window below current window.
let g:mundo_preview_bottom = 1

" Automatically close the Mundo windows when reverting.
let g:gundo_close_on_revert = 1

" let g:mundo_auto_preview = 0

nnoremap <leader><leader>hh :MundoToggle<CR>
"}}}
""/ vim-node {{{
"/
autocmd User Node
      \ if &filetype == "javascript" |
      \   nmap <buffer> <LocalLeader>f <Plug>NodeVSplitGotoFile |
      \ endif
"}}}
""/ vim-rsi {{{
"/
" Disable <M-*> mappings.
let g:rsi_no_meta = 1
if empty(mapcheck('<C-k>', 'i'))
  inoremap <C-k> <C-o>C
endif
if empty(mapcheck('<C-k>', 'c'))
  cnoremap <C-k> <C-\>estrpart(getcmdline(), 0, getcmdpos()-1)<CR>
endif
"}}}
""/ vim-subversive {{{
"/
nmap s <plug>(SubversiveSubstitute)
xmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)
"}}}
""/ vim-unimpaired {{{
"/
" nnoremap <silent> <Leader>ya yo1
nmap <silent> <Leader>yb yob
nmap <silent> <Leader>yc yoc
nmap <silent> <Leader>yd yod
nmap <silent> <Leader>yh yoh
nmap <silent> <Leader>yi yoi
nmap <silent> <Leader>yl yol
nmap <silent> <Leader>yn yon
nmap <silent> <Leader>yp yop
nmap <silent> <Leader>yr yor
nmap <silent> <Leader>ys yos
nmap <silent> <Leader>yu you
nmap <silent> <Leader>yv yov
nmap <silent> <Leader>yw yow
nmap <silent> <Leader>yx yox
"}}}
""/ vim-which-key {{{
"/
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2

let g:which_key_floating_opts = { 'row': '+1', 'width': '+3' }
let g:which_key_disable_default_offset = 1

call which_key#register('<Space>', "g:which_key_map")

let g:which_key_map =  {}

let g:which_key_map['name'] = 'root'

let g:which_key_map['?'] = [ 'Maps', 'show-keybindings' ]

let g:which_key_map['`'] = {
      \ 'name' : '+terminal',
      \ '`': 'open-terminal',
      \ 'c': 'open-terminal-current-working-directory'
      \ }

let g:which_key_map[' '] = {
      \ 'name' : '+plugins',
      \ 'w' : {
      \   'name' : '+vimwiki',
      \   '+' : '<Plug>VimwikiNormalizeLink',
      \   },
      \ 'c' : {
      \   'name' : '+coc',
      \   },
      \ 'u' : {
      \   'name' : '+ultisnips',
      \   },
      \ 'e' : {
      \   'name' : '+easymotion',
      \   'f' : '<Plug>(easymotion-f)',
      \   'F' : '<Plug>(easymotion-F)',
      \   ';' : '<Plug>(easymotion-next)',
      \   ',' : '<Plug>(easymotion-prev)',
      \   },
      \ 'm' : {
      \   'name' : '+matchup',
      \   'm' : 'highlight-surround',
      \   },
      \ 'h' : {
      \   'name' : '+mundo',
      \   'h' : 'toggle',
      \   },
      \ }

let g:which_key_map.q = {
      \ 'name' : '+quit',
      \ 'q': 'quit',
      \ 'qa': 'quit-all',
      \ 'w': 'write-all-quit',
      \ 'Q': 'quit-no-confirm',
      \ }

let g:which_key_map.f = {
      \ 'name' : '+files/find/fold',
      \ '[0-9]': 'foldlevel [0-9]',
      \ 'f': 'write',
      \ 'a': 'CocExplorerDirvish',
      \ 'A': 'coc-explorer toggle',
      \ '0': 'which_key_ignore',
      \ '1': 'which_key_ignore',
      \ '2': 'which_key_ignore',
      \ '3': 'which_key_ignore',
      \ '4': 'which_key_ignore',
      \ '5': 'which_key_ignore',
      \ '6': 'which_key_ignore',
      \ '7': 'which_key_ignore',
      \ '8': 'which_key_ignore',
      \ '9': 'which_key_ignore',
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ '[1-9]': 'buffer [1-9]',
      \ '1': 'which_key_ignore',
      \ '2': 'which_key_ignore',
      \ '3': 'which_key_ignore',
      \ '4': 'which_key_ignore',
      \ '5': 'which_key_ignore',
      \ '6': 'which_key_ignore',
      \ '7': 'which_key_ignore',
      \ '8': 'which_key_ignore',
      \ '9': 'which_key_ignore',
      \ 'a': 'list',
      \ 'r': 'reload',
      \ 'q': 'close',
      \ 't': 'close-with-tab',
      \ 'w': 'close-with-window',
      \ 'b': 'back',
      \ 'd': 'menu',
      \ 'p': 'previous',
      \ 'n': 'next',
      \ 'f': 'first',
      \ 'l': 'last',
      \ 'j': 'unload',
      \ 'k': 'kill',
      \ }

" let g:which_key_map.w = {
"       \ 'name' : '+windows',
"       \ '[1-9]': 'window [1-9]',
"       \ '1': 'which_key_ignore',
"       \ '2': 'which_key_ignore',
"       \ '3': 'which_key_ignore',
"       \ '4': 'which_key_ignore',
"       \ '5': 'which_key_ignore',
"       \ '6': 'which_key_ignore',
"       \ '7': 'which_key_ignore',
"       \ '8': 'which_key_ignore',
"       \ '9': 'which_key_ignore',
"       \ 'w': 'next',
"       \ 'r': 'rotate',
"       \ 'd': 'close',
"       \ 'q': 'quit',
"       \ 'j': 'go-down',
"       \ 'k': 'go-up',
"       \ 'h': 'go-left',
"       \ 'l': 'go-right',
"       \ 'H': 'move-left',
"       \ 'L': 'move-right',
"       \ 'J': 'move-down',
"       \ 'K': 'move-up',
"       \ '=': 'balance',
"       \ '+': 'max-all',
"       \ 's': 'split',
"       \ 'v': 'vsplit',
"       \ '_': 'max-vertical',
"       \ '|': 'max-horizontal',
"       \ 'o': 'only',
"       \ }

let g:which_key_map.t = {
      \ 'name' : '+tabs',
      \ '[1-9]': 'window [1-9]',
      \ '1': 'which_key_ignore',
      \ '2': 'which_key_ignore',
      \ '3': 'which_key_ignore',
      \ '4': 'which_key_ignore',
      \ '5': 'which_key_ignore',
      \ '6': 'which_key_ignore',
      \ '7': 'which_key_ignore',
      \ '8': 'which_key_ignore',
      \ '9': 'which_key_ignore',
      \ }

let g:which_key_map.z = {
      \ 'name' : '+fzf',
      \ 'q': 'rg',
      \ 'w': 'rgg',
      \ 'e': 'rggg',
      \ 'h': 'history',
      \ 'x': 'snippets',
      \ 'z': 'buffers',
      \ 'p': 'files',
      \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ '': '',
      \ }

let g:which_key_map.y = {
      \ 'name' : '+toggles',
      \ 'a': 'comments color',
      \ 'b': 'background',
      \ 'c': 'cursorline',
      \ 'd': 'diff',
      \ 'e': 'conceallevel',
      \ 'f': 'formatoptions',
      \ 'h': 'hlsearch',
      \ 'i': 'ignorecase',
      \ 'l': 'list',
      \ 'n': 'number',
      \ 'p': 'paste',
      \ 'q': 'term scrollback',
      \ 'r': 'relativenumber',
      \ 's': 'spell',
      \ 'u': 'cursorcolumn',
      \ 'v': 'virtualedit',
      \ 'w': 'wrap',
      \ 'x': 'cursorlin cursorcolor',
      \ 'z': 'dictionary(en,es)',
      \ }

let g:which_key_map.s = {
      \ 'name' : '+settings',
      \ 'c': 'pwd-current-path',
      \ }

let g:which_key_map.r = {
      \ 'name' : '+registers',
      \ 'z': 'copy " to z',
      \ '%': 'copy % to +',
      \ '.': 'copy . to +',
      \ }

let g:which_key_map.p = {
      \ 'name' : '+paste',
      \ 'n': 'cycle back stack',
      \ 'p': 'cycle forward stack',
      \ 'h': 'coc-list yank',
      \ }

let g:which_key_map.o = {
      \ 'name' : '+others',
      \ '': '',
      \ }

let g:which_key_map.c = {
      \ 'name' : '+coc',
      \ 't' : {
      \   'name' : '+coc-jest',
      \   'a' : 'current project',
      \   'c' : 'current file',
      \   't' : 'current test',
      \   },
      \ '': '',
      \ }

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <LocalLeader> :<c-u>WhichKey  '\'<CR>
vnoremap <silent> <LocalLeader> :<c-u>WhichKeyVisual '\'<CR>
nnoremap <silent> [       :<C-u>WhichKey '['<Cr>
nnoremap <silent> ]       :<C-u>WhichKey ']'<Cr>
"}}}
""/ vim-yoink {{{
"/
let g:yoinkMoveCursorToEndOfPaste=1
let g:yoinkSavePersistently=1
let g:yoinkIncludeDeleteOperations=1
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap <leader>pn <plug>(YoinkPostPasteSwapBack)
nmap <leader>pp <plug>(YoinkPostPasteSwapForward)
"}}}
"--------------------------------End Plugins Configuration---------------------"
"}}}


"--------------------------------User Commands---------------------------------"{{{
" :W sudo saves the file (doesn't work in neovim).
command! W w !sudo tee % > /dev/null
"--------------------------------End User Commands-----------------------------"
"}}}


"--------------------------------Auto Commands---------------------------------"{{{
augroup initvim
  au!
  " Return to last edit position when opening files (You want this!).
  " autocmd BufReadPost *
  "       \ if line("'\"") > 0 && line("'\"") <= line("$") |
  "       \     execute 'normal! g`"zvzz' |
  "       \ endif

  " Update the auto read of a file after 4 seconds.
  autocmd CursorHold * silent! checktime | syntax sync fromstart | redraw! | echo

  " Surround ** with € (Right Control).
  autocmd FileType vimwiki let b:surround_8364 = "**\r**"

  " Formatters.
  " autocmd FileType javascript setlocal formatprg=prettier\ --parser\ babel
  " autocmd FileType json setlocal formatprg=prettier\ --parser\ json
  " autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
  " autocmd FileType html setlocal formatprg=prettier\ --parser\ html
  " autocmd FileType scss setlocal formatprg=prettier\ --parser\ scss
  " autocmd FileType css setlocal formatprg=prettier\ --parser\ css
  " autocmd FileType yaml setlocal formatprg=prettier\ --parser\ yaml
  " autocmd FileType vimwiki setlocal formatprg=prettier\ --parser\ markdown

  " Check if this is what is damaging the lightline statusbar.
  " autocmd FilterWritePost * if &diff | syntax off | else | syntax on | endif
  " autocmd DiffUpdated * if &diff | syntax off | else | syntax on | endif

  autocmd InsertEnter * set noignorecase
  autocmd InsertLeave * set ignorecase
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}
augroup END

augroup markdownCode
  autocmd!
  autocmd filetype vimwiki setl iskeyword+=-
        \ | setl noru nu rnu nocul wrap conceallevel=3 concealcursor=nc
        \ | setl dictionary+=/usr/share/dict/words,/usr/share/dict/spanish complete+=kspell
augroup END
"--------------------------------End Auto Commands-----------------------------"
"}}}


"--------------------------------Functions-------------------------------------"{{{
" Function to execute a recorded macro over a selected text.
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Return some highlight group as a dictionary.
function! GetHighlight(group)
  let output = execute('hi ' . a:group)
  let list = split(output, '\s\+')
  let dict = {}
  for item in list
    if match(item, '=') > 0
      let splited = split(item, '=')
      let dict[splited[0]] = splited[1]
    endif
  endfor
  return dict
endfunction

" returns 1 if line is a markdown code block.
function! Is_codeblock(lnum) abort
  let syn_g = synIDattr(synID(a:lnum,1,1),'name')
  if  syn_g ==? 'markdownCode'
    return 1
  else
    return 0
  endif
endfunction

" fold markdown filetype.
function! Fold(lnum)
  let fold_level = strlen(matchstr(getline(a:lnum), '^' . g:vimwiki_header_type . '\+'))
  if (fold_level && !vimwiki#u#is_codeblock(a:lnum))
    return '>' . fold_level  " start a fold level
  endif
  if getline(a:lnum) =~? '\v^\s*$'
    if (strlen(matchstr(getline(a:lnum + 1), '^' . g:vimwiki_header_type . '\+')) > 0 && !g:vimwiki_fold_blank_lines)
      return '-1' " don't fold last blank line before header
    endif
  endif
  return '=' " return previous fold level
endfunction

" Modification of https://github.com/chrisbra/vim_dotfiles/blob/master/plugin/CustomFoldText.vim
" Always show some delimiters (the argument of CustomFoldText) and the tail of
" the folded line, that is, the number of lines folded (absolute and relative)
" function! CustomFoldText(delim)
"   "get first non-blank line
"   let fs = nextnonblank(v:foldstart)
"
"   if fs > v:foldend
"     let line = getline(v:foldstart)
"   else
"     let line = substitute(getline(fs), '\t', repeat('  ', &tabstop), 'g')
"   endif
"
"   " indent foldtext corresponding to foldlevel
"   let indent = repeat(' ',shiftwidth())
"   " let indentTwo = repeat('',shiftwidth())
"   let foldLevelStr = repeat(' ', match(getline(fs),'\S'))
"   let foldLineHead = substitute(line, '^\s*', foldLevelStr, '')
"
"   " size foldtext according to window width
"   let w = winwidth(0) - &foldcolumn - (&number ? &numberwidth : 0) - (&l:signcolumn is# 'yes' ? 2 : 0)
"   let foldSize = 1 + v:foldend - v:foldstart
"
"   " estimate fold length
"   let foldSizeStr = " " . foldSize . " lines "
"   let lineCount = line("$")
"   if has("float")
"     try
"       let foldPercentage = "[" . printf("%4s", printf("%.1f", (foldSize*1.0)/lineCount*100)) . "%] "
"     catch /^Vim\%((\a\+)\)\=:E806/	" E806: Using Float as String
"       let foldPercentage = printf("[of %d lines] ", lineCount)
"     endtry
"   endif
"
"   " build up foldtext
"   let foldLineTail = foldSizeStr . foldPercentage
"   let lengthTail = strwidth(foldLineTail)
"   let lengthHead = w - (lengthTail + indent)
"
"   if strwidth(foldLineHead) > lengthHead
"     let foldLineHead = strpart(foldLineHead, 0, lengthHead-2) . '..'
"   endif
"
"   let lengthMiddle = w - strwidth(foldLineHead.foldLineTail)
"
"   " truncate foldtext according to window width
"   let expansionString = repeat(a:delim, lengthMiddle)
"
"   let foldLine = foldLineHead . expansionString . foldLineTail
"   return foldLine
" endfunction

" set foldtext=CustomFoldText('\ ')

" fu! CustomFoldTextTwo()
"   "get first non-blank line
"   let fs = v:foldstart
"   while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
"   endwhile
"   if fs > v:foldend
"     let line = getline(v:foldstart)
"   else
"     let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
"   endif
"
"   let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
"   let foldSize = 1 + v:foldend - v:foldstart
"   let foldSizeStr = " " . foldSize . " lines "
"   let foldLevelStr = repeat("+--", v:foldlevel)
"   let lineCount = line("$")
"   let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
"   let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
"   return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
" endf

" set foldtext=CustomFoldTextTwo()

" augroup setvirtualedit
"   autocmd!
"   autocmd BufLeave *.md setlocal virtualedit-=all
"   autocmd BufEnter *.md setlocal virtualedit+=all
" augroup end
"--------------------------------End Functions---------------------------------"
"}}}


"--------------------------------Colors----------------------------------------"{{{
" Custom Highlight groups.
function! MyHighlights() abort
  highlight MatchParen guibg=NONE gui=bold
  highlight SpellBad gui=undercurl guifg=NONE
  highlight! link CocExplorerFileFullpath Operator
  highlight! link CocExplorerFileLinkTarget Operator
  highlight! link CocExplorerFileGitStage Operator
  highlight! link CocExplorerBookmarkPosition Operator
  highlight! link CocExplorerBookmarkAnnotation Operator
  highlight! link CocExplorerHelpHint Operator
  highlight! link CocExplorerHelpDescription Operator
  if exists('g:loaded_lightline')
    runtime plugin/lightline-gruvbox.vim
    call lightline#colorscheme()
  endif
  highlight VimwikiLink guifg=#cb4b16
  highlight CursorLine ctermbg=NONE guibg=NONE
  highlight CursorLineNr ctermbg=NONE guibg=NONE
  highlight VimwikiPre ctermfg=8 ctermbg=229 guifg=#777777 gui=bold
  if &background is? 'light'
    nnoremap <silent> <Leader>ya :<C-R>=GetHighlight("Comment")["guifg"] is? "#cccccc" ? "hi Comment guifg=#777777" : "hi Comment guifg=#cccccc"<CR><CR><C-l>
  else
    nnoremap <silent> <Leader>ya :<C-R>=GetHighlight("Comment")["guifg"] is? "#777777" ? "hi Comment guifg=#333333" : "hi Comment guifg=#777777"<CR><CR><C-l>
  endif
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

set background=light

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme pencil
let g:lightline.colorscheme = 'gruvbox'

lua require 'colorizer'.setup({markdown = {names = false}})
"--------------------------------End Colors------------------------------------"
"}}}
" vim: set fdm=marker fmr={{{,}}} :
