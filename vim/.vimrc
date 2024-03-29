" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" ------------------------------------------------------------------------------
" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-surround'
NeoBundle 'sakuraiyuta/commentout.vim'
NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
NeoBundle "Shougo/unite-outline"
NeoBundle 'bling/vim-airline'

NeoBundle 'elzr/vim-json.git'

let g:vim_json_syntax_conceal = 0
let g:vim_json_warnings=0

" ------------------------------------------------------------------------------

call neobundle#end()

filetype plugin indent on     " Required!
filetype indent on

" ------------------------------------------------------------------------------
"  Shortcut settings

map <F12> :Unite -vertical -direction=rightbelow -winwidth=50 outline<CR>


" 加算/減算 キーマッピング変更
noremap + <C-A>
noremap - <C-X>

" マウスモード
set mouse=a
set ttymouse=xterm2

" 強調表示設定
syntax on

" カーソル行のハイライト
set cursorline

" カラースキーマ設定
colorscheme desert

" 検索で、大文字小文字を区別しない
set ignorecase

" 検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set wrapscan

" インクリメンタルサーチを行う
set incsearch

" 検索結果をハイライトする
set hlsearch

" タブの代わりに空白文字を挿入する
set expandtab

" タブ幅設定
set tabstop=4

" 行番号を表示する
set number

"シフト移動幅
set shiftwidth=4

" 自動インデントを無効にする
set noautoindent

" バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup

" UNDOファイルを作るディレクトリ
set undodir=$HOME/vimundo

" スワップファイル用のディレクトリ
set directory=$HOME/vimbackup

" タブ文字、行末など不可視文字を表示する
set list

" listで表示される文字のフォーマットを指定する
set listchars=tab:>\ ,extends:<"
set lcs=tab:>.,trail:_,extends:¥

" 全角スペースのハイライトを設定
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666 gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

" ツールバー非表示
set guioptions-=T

"Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR>

" ------------------------------------------------------------------------------
"  キーマップ設定
" ------------------------------------------------------------------------------
map <C-S> :tabnext<CR>
map <C-A> :tabprev<CR>
map <F2> :<C-u>Unite bookmark -default-action=lcd<CR>
inoremap <F2> <ESC>:<C-u>Unite bookmark -default-action=lcd<CR>

map <F3> :VimFiler<CR>
if has('win32')
    map <F3> :VimFiler $HOME<CR>
elseif has('mac')
    map <F3> :VimFiler<CR>
endif

map <F4> :VimShell<CR>
map <F9> :e ++enc=utf-8<CR>

setlocal iskeyword+=\/,-,.

" 前の単語へ移動
cnoremap <C-w> <S-Left>
" 次の単語へ移動
cnoremap <C-b> <S-Right>




" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"  VimFiler
" ------------------------------------------------------------------------------
let g:vimfiler_edit_action = 'tabopen'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
let g:vimfiler_enable_auto_cd=1

" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"  unite
" ------------------------------------------------------------------------------
let g:unite_source_history_yank_enable =1  "history/yankの有効化
nnoremap <silent> ,gy :<C-u>Unite history/yank<CR>
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"  neocomplcache
" ------------------------------------------------------------------------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php' : $HOME.'/.vim/dict/php.dict',
    \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal omnifunc=
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" ------------------------------------------------------------------------------


" ------------------------------------------------------------------------------
"  Neosnippet
" ------------------------------------------------------------------------------

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/Dropbox/Env/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"  VimShell
" ------------------------------------------------------------------------------
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '"



" ------------------------------------------------------------------------------

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
