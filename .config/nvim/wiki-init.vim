"--------------------------------Plugins---------------------------------------" {{{
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

"----------------Basics----------------- {{{
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
"}}}

"--------------Interface---------------- {{{
" Minimal colorscheme for vim.
Plug 'davidsierradz/vim-colors-pencil'

" Smart close of buffers.
Plug 'Asheq/close-buffers.vim'

" Search your selection text with * or #.
Plug 'haya14busa/vim-asterisk'

" Draw boxes and arrows in ascii.
Plug 'gyim/vim-boxdraw', { 'for': 'markdown' }

" Distraction-free writing in Vim.
Plug 'junegunn/goyo.vim'

" Smooth scrolling for Vim done right.
Plug 'psliwka/vim-smoothie'

" Vim plugin that shows keybindings in popup.
Plug 'liuchengxu/vim-which-key'
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

" Leave hidden buffers open.
set hidden

" Command-Line options.
set wildignorecase
set wildoptions=pum
set pumblend=10

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
let localmapleader = "\\"

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
let g:python3_host_prog = '/usr/bin/python3'

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
if $TERM == 'linux' || $TERM == 'screen'
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
nnoremap <silent> <C-l> :syntax sync fromstart <bar> nohlsearch <bar> diffupdate <bar> echo<CR>

" Y yanks from current cursor position to end of (wrapped) line, more logical.
nnoremap Y yg$
xnoremap Y g$y

" Disable Ex mode.
nnoremap Q <nop>

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
xnoremap ;; ;
xnoremap ,, ,

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
"}}}
""/ plugins basics {{{
"/
""/ coc.nvim {{{
"/
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
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-l> for trigger snippet expand.
imap <C-u> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-smartf
" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ;; <Plug>(coc-smartf-repeat)
nmap ,, <Plug>(coc-smartf-repeat-opposite)
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
""/ vim-cutlass {{{
"/
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D
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
""/ vim-which-key {{{
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> [       :<C-u>WhichKey '['<Cr>
nnoremap <silent> ]       :<C-u>WhichKey ']'<Cr>
"}}}
""/ vim-yoink {{{
"/
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
"}}}
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
nnoremap <Leader>fa :CocCommand explorer<CR>
nnoremap <silent> <Leader>f0 :set foldlevel=0<CR>
nnoremap <silent> <Leader>f1 :set foldlevel=1<CR>
nnoremap <silent> <Leader>f2 :set foldlevel=2<CR>
nnoremap <silent> <Leader>f3 :set foldlevel=3<CR>
nnoremap <silent> <Leader>f4 :set foldlevel=4<CR>
nnoremap <silent> <Leader>f5 :set foldlevel=5<CR>
nnoremap <silent> <Leader>f6 :set foldlevel=6<CR>
nnoremap <silent> <Leader>f7 :set foldlevel=7<CR>
nnoremap <silent> <Leader>f8 :set foldlevel=8<CR>
nnoremap <silent> <Leader>f9 :set foldlevel=9<CR>
"}}}
""/ buffers (b) {{{
"/
" Reloads a buffer.
nnoremap <leader>br :e!<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab.
nnoremap <leader>bq :bp <BAR> bd #<CR>

" Close the current buffer and move to the previous one and close the window
" This replicates the idea of closing a tab.
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

for s:i in range(1, 9)
  " <Leader>b[1-9] move to buffer [1-9]
  execute 'nnoremap <Leader>b'.s:i ':b'.s:i.'<CR>'
endfor
unlet s:i
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

" for s:i in range(1, 9)
"   " <Leader>w[1-9] move to window [1-9]
"   execute 'nnoremap <Leader>w'.s:i ' :'.s:i.'wincmd w<CR>'
" endfor
" unlet s:i
"}}}
""/ tabs (t) {{{
"/
for s:i in range(1, 9)
  " <Leader>t[1-9] move to tab [1-9]
  execute 'nnoremap <Leader>t'.s:i s:i.'gt'
endfor
unlet s:i
"}}}
""/ fzf (z) {{{
"/
nnoremap <leader>zq :Rg<CR>
nnoremap <leader>zw :Rgg<CR>
nnoremap <leader>ze :Rggg<CR>
nnoremap <leader>zQ :RgWithFileName<CR>
nnoremap <leader>zW :RggWithFileName<CR>
nnoremap <leader>zE :RgggWithFileName<CR>
nnoremap <leader>zh :History<CR>
nnoremap <leader>zx :Snippets<CR>
nnoremap <leader>zz :Buffers<CR>
nnoremap <leader>zp :Files ~/notes/<CR>
"}}}
""/ git (g) {{{
"/
"}}}
""/ lsp (l) {{{
"/
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
" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>lda  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>le  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>lc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>lo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>lj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>lk  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>lp  :<C-u>CocListResume<CR>
"}}}
""/ toggles (y) {{{
"/

" nnoremap <silent> <Leader>ya yo1
nmap <silent> <Leader>yb yob
nmap <silent> <Leader>yc yoc
nmap <silent> <Leader>yd yod
" Toggles conceallevel 0 to 3.
nnoremap <silent> <Leader>ye :<C-R>=&conceallevel is# 0 ? "set conceallevel=3" : "set conceallevel=0"<CR><CR>
" Toggles formatoptions to add comment after <CR> or o (and O).
nnoremap <silent> <Leader>yf :<C-R>=&formatoptions !~# "cro" ? "setlocal formatoptions+=cro" : "setlocal formatoptions-=cro"<CR><CR>
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


" Toggle pastemode
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
"}}}
""/ paste (p) {{{
"/
nmap <leader>pn <plug>(YoinkPostPasteSwapBack)
nmap <leader>pp <plug>(YoinkPostPasteSwapForward)
nnoremap <silent> <leader>ph  :<C-u>CocList -A --normal yank<cr>
"}}}
""/ local filetype (,) {{{
"/
""/ diff {{{
"/
" Choose one block in a 3-way merge resolution.
if &diff
  syntax off
  nnoremap <buffer> <localleader>1 :diffget LOCAL<CR>
  nnoremap <buffer> <localleader>2 :diffget BASE<CR>
  nnoremap <buffer> <localleader>3 :diffget REMOTE<CR>
endif
"}}}
""/ vim-dirvish {{{
"/
" Set <leader>cd to change directories in dirvish buffers.
augroup dirvish_events
  autocmd!
  autocmd FileType dirvish
        \ nnoremap <buffer> <localleader>cd :cd %<CR>:pwd<CR>
  autocmd FileType dirvish
        \ nnoremap <nowait><buffer><silent> <M-n> <C-\><C-n>k:call feedkeys("p")<CR>
augroup END
"}}}
""/ vim-node {{{
"/
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <localleader>f <Plug>NodeVSplitGotoFile
  \ endif
"}}}
"}}}
""/ plugins (SPC) {{{
"/
""/ vimwiki (w) {{{
"/
nmap <leader><leader>w+ <Plug>VimwikiNormalizeLink
vmap <leader><leader>w+ <Plug>VimwikiNormalizeLinkVisual
"}}}
""/ coc.nvim (c) {{{
"/
"}}}
""/ matchup (m) {{{
"/
nmap <silent> <leader><leader>mm <plug>(matchup-hi-surround)
"}}}
""/ vim-mundo (h) {{{
"/
" Start plugin.
nnoremap <leader><leader>hh :MundoToggle<CR>
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
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

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

let g:coc_extension_root = $HOME . '/.config/coc/extensions-wiki'
let g:coc_config_home = $HOME . '/.config/nvim/wiki'

let g:coc_global_extensions = [
      \ 'coc-dictionary',
      \ 'coc-emmet',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-pairs',
      \ 'coc-prettier',
      \ 'coc-smartf',
      \ 'coc-snippets',
      \ 'coc-yank',
      \ ]

augroup Smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

let g:coc_filetype_map = {
      \ 'vimwiki': 'markdown',
      \ }
"}}}
""/ editorconfig/editorconfig-vim {{{
"/
" Don't output 'cursorcolumn'.
let g:EditorConfig_max_line_indicator = "none"
"}}}
""/ fzf.vim {{{
"/
let $FZF_DEFAULT_COMMAND = 'rg --smart-case --files-with-matches --color never --no-heading --no-ignore-vcs --hidden ""'

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
  \ 'ctrl-f': function('s:goto_line')
  \  }

" Show preview window with '?'.
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>,
    \ fzf#vim#with_preview('right:50%:hidden', '?'),
    \ <bang>0)

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
  set winblend=10

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

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
else
  " FZF position.
  let g:fzf_layout = { 'window': '-tabnew' }
endif
"}}}
""/ Goyo {{{
"/
" Open Goyo.
nnoremap <F5> :Goyo<CR>

" Mantains set number.
let g:goyo_linenr=1

" Width.
let g:goyo_width=80
let g:goyo_height='100%'

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) is# 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

function! s:goyo_start(...)
  if v:vim_did_enter
    Goyo
  endif
endfunc

call timer_start(10, function('s:goyo_start'))
"}}}
""/ markdown-preview.nvim {{{
"/
let g:mkdp_browser = '/usr/bin/qutebrowser'
"}}}
""/ vim-asterisk {{{
"/
" Enable keepCursor feature.
let g:asterisk#keeppos = 1
"}}}
""/ Pencil {{{
"/
" Start pencil on vimwiki buffers.
augroup pencil
    autocmd!
    autocmd filetype vimwiki call pencil#init()
                \ | call lexical#init()
                \ | setl iskeyword+=-
                \ | setl spell spl=es,en noru nu rnu cul spf=~/.config/nvim/spell/es.utf-8.add
                \ | setl dictionary+=/usr/share/dict/words complete+=kspell
augroup END

let g:pencil#wrapModeDefault = 'soft'
let g:pencil#textwidth = 74
let g:pencil#joinspaces = 0
let g:pencil#cursorwrap = 0
let g:pencil#conceallevel = 3
let g:pencil#concealcursor = 'nc'
let g:pencil#softDetectSample = 20
let g:pencil#softDetectThreshold = 130
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
        \ setlocal foldenable | set foldexpr=VimwikiFoldLevelCustom(v:lnum)
augroup END
"}}}
""/ vim-boxdraw {{{
" The cursor can go nuts.
augroup setvirtualedit
  autocmd!
  autocmd BufLeave *.md setlocal virtualedit-=all
  autocmd BufEnter *.md setlocal virtualedit+=all
augroup end
"}}}
""/ vim-matchup {{{
"/

" let g:matchup_matchparen_enabled = 0

" To enable the delete surrounding (ds%) and change surrounding (cs%) maps.
let g:matchup_surround_enabled = 1

let g:matchup_matchparen_status_offscreen = 0

"let g:matchup_matchparen_deferred = 1
"let g:matchup_matchparen_hi_surround_always = 1
"}}}
""/ vim-mundo {{{
"/
" Put preview window below current window.
let g:mundo_preview_bottom = 1

" Automatically close the Mundo windows when reverting.
let g:gundo_close_on_revert = 1

" let g:mundo_auto_preview = 0
"}}}
""/ vim-rsi {{{
"/
" Disable <M-*> mappings.
let g:rsi_no_meta = 1
"}}}
""/ vim-which-key {{{
"/
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2

let g:which_key_floating_opts = { 'row': '+1', 'width': '+3' }

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
      \   'a' : '<Plug>(easymotion-s)',
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
      \ 'a': 'coc-explorer toggle',
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
      \ 'r': 'relativenumber',
      \ 's': 'spell',
      \ 'u': 'cursorcolumn',
      \ 'v': 'virtualedit',
      \ 'w': 'wrap',
      \ 'x': 'cursorlin cursorcolor',
      \ }

let g:which_key_map.s = {
      \ 'name' : '+settings',
      \ 'c': 'pwd-current-path',
      \ }

let g:which_key_map.r = {
      \ 'name' : '+registers',
      \ 'z': 'copy " to z',
      \ '%': 'copy % to +',
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
"}}}
""/ vim-yoink {{{
"/
let g:yoinkMoveCursorToEndOfPaste=1
let g:yoinkSavePersistently=1
let g:yoinkIncludeDeleteOperations=1
"}}}
"--------------------------------End Plugins Configuration---------------------"
"}}}


"--------------------------------User Commands---------------------------------"{{{
" :W sudo saves the file.
command! W w !sudo tee % > /dev/null

" :TabMessage command
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
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
  autocmd CursorHold * silent! checktime

  " Surround ** with € (Right Control).
  autocmd FileType vimwiki let b:surround_8364 = "**\r**"

  " Formatters.
  autocmd FileType javascript setlocal formatprg=prettier\ --parser\ babel
  autocmd FileType json setlocal formatprg=prettier\ --parser\ json
  autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
  autocmd FileType html setlocal formatprg=prettier\ --parser\ html
  autocmd FileType scss setlocal formatprg=prettier\ --parser\ scss
  autocmd FileType css setlocal formatprg=prettier\ --parser\ css
  autocmd FileType yaml setlocal formatprg=prettier\ --parser\ yaml
  autocmd FileType vimwiki setlocal formatprg=prettier\ --parser\ markdown

  autocmd InsertEnter * set noignorecase
  autocmd InsertLeave * set ignorecase
augroup END
"--------------------------------End Auto Commands-----------------------------"
"}}}


"--------------------------------Functions-------------------------------------"{{{
" Function to pipe an Ex command to a buffer in a new tab.
" Usage :TabMessage command
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use 'new' instead of 'tabnew' below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction

" Function to execute a recorded macro over a selected text.
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! DeleteWindowIfNotLast()
  if (winnr('$') > 1 && len(getbufinfo({'buflisted':1})) > 1)
    execute ":bp\<BAR>bd#\<BAR>q"
    return 1
  endif

  echo "Only one window or buffer."
  return 0
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
"--------------------------------End Functions---------------------------------"
"}}}


"--------------------------------Colors----------------------------------------"{{{
" Custom Highlight groups.
function! MyHighlights() abort
  highlight MatchParen guibg=NONE
  highlight SpellBad gui=undercurl guifg=NONE
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
colorscheme pencil
"--------------------------------End Colors------------------------------------"
"}}}
" vim: set fdm=marker fmr={{{,}}} fdl=4 :
