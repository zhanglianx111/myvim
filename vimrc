set nocompatible              " be iMproved, required
set nobackup
set noswapfile
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'tpope/vim-sensible'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/TaskList.vim', { 'on': 'TaskList' }
Plugin 'majutsushi/tagbar', { 'on': 'TagBar' }
Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTree'] }
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'nacitar/a.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/loremipsum'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plugin 'mhinz/vim-startify'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'
Plugin 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plugin 'dyng/ctrlsf.vim'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'scrooloose/syntastic'
Plugin 'elzr/vim-json'
Plugin 'marijnh/tern_for_vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'vim-script/winmanager'
" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader>ee :e ~/.vimrc<cr>
map <silent> <leader>n :nohlsearch<cr>
inoremap <C-g> <Esc>
inoremap jj <Esc>
inoremap jk <ESC>

nmap ? /\<\><Left><Left>

set guifont=Monaco:h15
set guifontwide=Monaco:h15
set background=dark
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
colorscheme solarized

" Chinese encodingcoding
set encoding=utf-8
set fileencodings=utf-8,gbk,chinese,cp936,gb18030,utf-16le,utf-16,big5,euc-jp,euc-kr,latin-1
set fileencoding=utf-8

set number
setlocal noswapfile
set smartindent       "set smart indent
set expandtab
set tabstop=4
set shiftwidth=4
set nofoldenable
set foldmethod=indent
set showmatch
set matchtime=2
set matchpairs+=<:>
set hlsearch
set ignorecase smartcase
set completeopt=longest,menu
let do_syntax_sel_menu=1
set updatetime=200

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" some autocmd
autocmd FileType ruby,html,javascript,css,json setlocal shiftwidth=2 tabstop=2

:command W w
:command Q q
:command Qa qa
:command Wa wa
:command Wqa wqa
:command WQa wqa

"" Recommended key-mappings. For no inserting <CR> key.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-n>\<C-y>" : "\<CR>"
endfunction

cs add cscope.out

source $VIMRUNTIME/macros/matchit.vim

" Plugin config.
" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](bower_components|node_modules|vendor|target|dist|_site|nginx_runtime|build|logs|data)|(\.(swp|ico|git|svn))$'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set wildignore+=*.pyc,*.sqlite,*.sqlite3,cscope.out
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/nginx_runtime/*,*/build/*,*/logs/*

" ctrlp_extensions
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
:com! -n=0 D CtrlPFunky
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" CtrlSF
:com! -n=* F CtrlSF <args>
:com! -n=0 FOpen CtrlSFOpen
"let g:ctrlsf_auto_close = 0

" Tasklist
let g:tlTokenList = ['TODO' , 'WTF', 'FIX']

" Startify
let g:startify_custom_header = [
    \'  YYYYYY       YYYYYYYY EEEEEEEEEEEEEEEEEEEEE    SSSSSSSSSSSSSSS',
    \'  Y:::::Y       Y:::::Y E::::::::::::::::::::E  SS:::::::::::::::S',
    \'  Y:::::Y       Y:::::Y E::::::::::::::::::::E S:::::SSSSSS::::::S',
    \'  Y::::::Y     Y::::::Y EE::::::EEEEEEEEE::::E S:::::S     SSSSSSS',
    \'  YYY:::::Y   Y:::::YYY   E:::::E       EEEEEE S:::::S',
    \'     Y:::::Y Y:::::Y      E:::::E              S:::::S',
    \'      Y:::::Y:::::Y       E::::::EEEEEEEEEE     S::::SSSS',
    \'       Y:::::::::Y        E:::::::::::::::E      SS::::::SSSSS',
    \'        Y:::::::Y         E:::::::::::::::E        SSS::::::::SS',
    \'         Y:::::Y          E::::::EEEEEEEEEE           SSSSSS::::S',
    \'         Y:::::Y          E:::::E                          S:::::S',
    \'         Y:::::Y          E:::::E       EEEEEE             S:::::S',
    \'         Y:::::Y        EE::::::EEEEEEEE:::::E SSSSSSS     S:::::S',
    \'      YYYY:::::YYYY     E::::::::::::::::::::E S::::::SSSSSS:::::S',
    \'      Y:::::::::::Y     E::::::::::::::::::::E S:::::::::::::::SS',
    \'      YYYYYYYYYYYYY     EEEEEEEEEEEEEEEEEEEEEE  SSSSSSSSSSSSSSS',
    \'',
    \]

" Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
map tb :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1
let g:tagbar_width=25
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
" NERDTree
"autocmd VimEnter * NERDTree "启动Vim时自动打开nerdtree
let NERDTreeShowBookmarks=0 "一直显示书签
let NERDTreeChDirMode=2 "打开书签时，自动将Vim的pwd设为打开的目录，如果你的项目有tags文件，你会发现这个命令很有帮助
let NERDTreeIgnore=['\.pyc', '\.out$', 'bak$', 'node_modules', 'dist']
"let g:NERDTreeWidth=9
let NERDTreeWinSize=25
map nt :NERDTreeToggle<CR>

" YCM
nnoremap <buffer> <silent> gd :YcmCompleter GoTo<cr>
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_server_log_level = 'error'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" Vim-go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nmap <leader>b <Plug>(go-build)

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers = ["jshint"]
let g:syntastic_shell = "/bin/sh"

" winmanager
"map <c-w><c-f> :FirstExplorerWindow<cr> 
"map <c-w><c-b> :BottomExplorerWindow<cr> 
"map <c-w><c-t> :WMToggle<cr> 
nmap wm :WMToggle<cr>

 

"下面的代码放到自己的vimrc配置中即可"
 
"let g:winManagerWindowLayout='NERDTree|Tagbar'
"let g:winManagerWidth=30
"let g:AutoOpenWinManager = 1 "这里要配合修改winmanager.vim文件，见下方说明"
 
"let g:NERDTree_title = "[NERDTree]"
"function! NERDTree_Start()
"    exe 'q' "执行一个退出命令，关闭自动出现的窗口"
"    exe 'NERDTree'
"endfunction
 
"function! NERDTree_IsValid()
"    return 1
"endfunction
 
"noremap <f5> :NERDTreeFind<cr>
 "执行一个退出命令，关闭自动出现的窗口"

"let g:Tagbar_title = "[Tagbar]"
"function! Tagbar_Start()
"    exe 'q'
"    exe 'TagbarOpen'
"endfunction
 
"function! Tagbar_IsValid()
"    return 1
"endfunction
"let g:tagbar_vertical = 30
