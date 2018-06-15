
" ==============================vundle begin
set nocompatible              " be iMproved, required
filetype off                  " required  /** 从这行开始，vimrc配置 **/

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 代码自动补全
Plugin 'Valloric/YouCompleteMe' " {
    let g:ycm_autoclose_preview_window_after_completion=1 " 完成操作之后，自动补全窗口不会消失
    map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR> " 定义了“转到定义”的快捷方式
    let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion=[ '<C-p>' , '<Up>' ]
" }
Plugin 'fatih/vim-go'

" 语法检查
Plugin 'scrooloose/syntastic'

" PEP8代码风格检查
" Plugin 'nvie/vim-flake8'


" 
Plugin 'majutsushi/tagbar' " { 
    nmap <F8> :TagbarToggle<CR>
" }


"
Plugin 'scrooloose/nerdtree' " {
    map <F7> :NERDTreeToggle<CR>
    let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" }
Plugin 'jistr/vim-nerdtree-tabs'

" 代码折叠
Plugin 'tmhedberg/SimpylFold' " {
    let g:SimpylFold_docstring_preview=1 " 看到折叠代码的文档字符串
" }

" 自动缩进
Plugin 'vim-scripts/indentpython.vim'

" air-line
Plugin 'vim-airline/vim-airline' " {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#whitespace#enabled = 0
" }
Plugin 'vim-airline/vim-airline-themes' 


" 
" Plugin 'mileszs/ack.vim' " {
" :map <F4> :Ack -i
" }


" 
Plugin 'rking/ag.vim' " {
    map <F4> :Ag -i 
" }


" 
Plugin 'ctrlpvim/ctrlp.vim' " {
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" }


" Vim undo tree
Plugin 'sjl/gundo.vim' " {
    nnoremap <F5> :GundoToggle<CR>
    let g:gundo_preview_bottom=1
" }


Plugin 'scrooloose/nerdcommenter'


"
Plugin 'Yggdroot/indentLine' " {
    let g:indentLine_color_term = 239
" }


"Plugin 'SirVer/ultisnips'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ==============================vundle end

" vim-go settings
let g:go_fmt_command = "goimports"

" set mapleader
let mapleader = ","

" vim-go custom mappings
 autocmd BufWritePre *.go :GoImports
 au FileType go nmap <leader>s <Plug>(go-implements)
 au FileType go nmap <leader>i <Plug>(go-info)
 au FileType go nmap <leader>gd <Plug>(go-doc)
 au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
 au FileType go nmap <leader>r <Plug>(go-run)
 au FileType go nmap <leader>b <Plug>(go-build)
 au FileType go nmap <leader>t <Plug>(go-test)
 au FileType go nmap <leader>c <Plug>(go-coverage)
 au FileType go nmap <leader>ds <Plug>(go-def-split)
 au FileType go nmap <leader>dv <Plug>(go-def-vertical)
 au FileType go nmap <leader>dt <Plug>(go-def-tab)
 au FileType go nmap <leader>e <Plug>(go-rename)


" python PEP8 {
    au BufNewFile,BufRead *.py
        \ set tabstop=4
        \ set softtabstop=4
        \ set shiftwidth=4
        \ set textwidth=79
        \ set expandtab
        \ set autoindent
        \ set fileformat=unix
" }

" js/html/css {
    au BufNewFile,BufRead *.js, *.html, *.css
        \ set tabstop=2
        \ set softtabstop=2
        \ set shiftwidth=2
" }


map <F6> :set nu!<CR>:set list!<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" ctags
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 


" Tab操作快捷方式!
" nnoremap <C-TAB> :tabnext<CR>
" nnoremap <C-S-TAB> :tabprev<CR>

"关于tab的快捷键
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>

" map
vnoremap // y/<c-r>"<cr>

" set guifont=Literation_Mono_Powerline:h16
" let g:airline_theme='wombat'

" ==============================normal config begin
set paste
syn on "语法支持
set laststatus=2 "始终显示状态栏
set tabstop=4 "一个制表符的长度
set softtabstop=4 "一个制表符的长度（可以大于tabstop）
set shiftwidth=4 "一个缩进的长度
set expandtab "使用空格替代制表符
set smarttab "智能制表符
set autoindent "自动缩进
set smartindent "只能缩进
set number "显示行号
set ruler "显示位置指示器
set backupdir=/tmp "设置备份文件目录
set directory=/tmp "设置临时文件目录
set ignorecase "检索时忽略大小写
set hls "检索时高亮显示匹配项
set helplang=cn "帮助系统设置为中文
set foldenable      " 允许折叠 
set foldmethod=indent "代码折叠
set foldlevel=999
set backspace=indent,eol,start
set scrolloff=7 " 光标移动到buffer的顶部和底部时保持3行距离
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" set foldmethod=syntax
" let python_highlight_all=1
set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
" highlight CursorLine guibg=lightblue guifg=black ctermbg=lightgray ctermfg=black
" highlight CursorColumn guibg=lightblue ctermbg=lightgray guifg=black ctermfg=black
hi CursorLine  cterm=NONE ctermbg=darkred ctermbg=darkred ctermfg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermbg=darkred ctermfg=white
"set cursorcolumn "突出显示当前列
filetype on "命令打开文件类型检测功能，它相当于文件类型检测功能的开关
set fileencodings=utf-8,gbk,gb2312,ucs-bom,chinese,cp936,gb18030,big5,euc-jp,euc-kr,latin1 "设置文件检测编码
set encoding=utf-8 "设置内部编码
set fileencoding=utf-8 "设置新建文件保存编码
"set showmatch "设置括号匹配
set clipboard=unnamed " 系统剪贴板
" ==============================normal config end
