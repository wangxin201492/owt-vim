
" ==============================vundle begin
filetype off                  " required  /** 从这行开始，vimrc配置 **/

" set mapleader
let mapleader = ","


" ###########################################################################
" ##                                
" ###########################################################################
" 如果支持python，那么优先使用YC
if has('pythonx')
	let g:useYCM = 1
else
	let g:useYCM = 0
endif

function LangConfigGo()
    " vim-go
    Plugin 'fatih/vim-go' " {
        " vim-go settings
        let g:go_fmt_command = "goimports"
        let g:go_fmt_autosave=0


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
     " }

    " echo "load go config done."
endfunction

function LangConfigPython()
    " 自动缩进
    Plugin 'vim-scripts/indentpython.vim'

    " python PEP8 {
    "    au BufNewFile,BufRead *.py
    "        \ set shiftwidth=4
    "        \ set expandtab
    "        \ set fileformat=unix
    " }
    " echo "load python config done."
endfunction

function LangConfigFrontend()
    " js/html/css {
        au BufNewFile,BufRead *.js, *.html, *.css
            \ set tabstop=2
            \ set softtabstop=2
            \ set shiftwidth=2
    " }
    " echo "load frontend config done."
endfunction

function GlobalPlugin()
    " 语法检查
    " Plugin 'scrooloose/syntastic'

	" 多文档编辑
	Plugin 'fholgado/minibufexpl.vim' " {
		let g:miniBufExplMapWindowNavVim = 1
		let g:miniBufExplMapWindowNavArrows = 1
		let g:miniBufExplMapCTabSwitchBufs = 1
		let g:miniBufExplModSelTarget = 1
		let g:miniBufExplMoreThanOne=0

		map <F10> :MBEbp<CR>
		map <F11> :MBEbn<CR>
	" }

    " air-line
    Plugin 'vim-airline/vim-airline' " {
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|'
        let g:airline#extensions#whitespace#enabled = 0
        " let g:airline_theme='wombat'
    " }
    Plugin 'vim-airline/vim-airline-themes' 

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

    Plugin 'Yggdroot/indentLine' " {
        let g:indentLine_color_term = 239
    " }

    Plugin 'scrooloose/nerdtree' " {
        map <F7> :NERDTreeToggle<CR>
		" 修改树的显示图标
		" let g:NERDTreeDirArrowExpandable = '+'
		" let g:NERDTreeDirArrowCollapsible = '-'
		" 窗口位置
		let g:NERDTreeWinPos='left'
		" 窗口尺寸
		let g:NERDTreeSize=30
		" 窗口宽度
		let NERDTreeWinSize=30
		" 不显示隐藏文件
		let g:NERDTreeHidden=0
		" 打开vim时如果没有文件自动打开NERDTree
		"autocmd vimenter * if !argc()|NERDTree|endif
		" 当NERDTree为剩下的唯一窗口时自动关闭
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
		" 打开vim时自动打开NERDTree
		"autocmd vimenter * NERDTree</cr></F7>
		" 忽略以下文件的显示
		let NERDTreeIgnore=['\.pyc','\~$','\.swp']
    " }

    Plugin 'jistr/vim-nerdtree-tabs'
	Plugin 'Xuyuanp/git-nerdtree'


    " 代码折叠
    Plugin 'tmhedberg/SimpylFold' " {
        let g:SimpylFold_docstring_preview=1 " 看到折叠代码的文档字符串
    " }

    if g:useYCM == 1 
        " YouCompleteMe : 代码自动补全
        Plugin 'Valloric/YouCompleteMe' " {
            let g:ycm_autoclose_preview_window_after_completion=1 " 完成操作之后，自动补全窗口不会消失
            let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
            let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
            let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
            let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
            let g:ycm_collect_identifiers_from_tags_files = 1

            "let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开

            " 跳转到定义处, 分屏打开
            " let g:ycm_goto_buffer_command = 'horizontal-split'
            " nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
            " nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
            " nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
            " map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR> " 定义了“转到定义”的快捷方式
            let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
            let g:ycm_key_list_previous_completion=[ '<C-p>' , '<Up>' ]

			"  FIXME : NoExtraConfDetected: No .ycm_extra_conf.py file detected, so no compile flags are available.
			" 这里如果设置了ycm_global_ycm_extra_conf，则会有语法检测；不设置则会有上面的报错
			let g:ycm_global_ycm_extra_conf = ""
            " old version
            " if !empty(glob("~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"))
                " let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py"
            " endif
            " " new version
            " if !empty(glob("~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
                " let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
            " endif
            " let g:ycm_confirm_extra_conf = 0
        " }
    endif

    Plugin 'majutsushi/tagbar' " { 
        nmap <F8> :TagbarToggle<CR>
    " }

    call GlobalPluginDependOnLocal()
endfunction

function GlobalPluginDependOnLocal()
    " ctags
    if executable("ctags") 
        map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
    endif

    if executable("ack") 
        " Plugin 'mileszs/ack.vim' " {
        " :map <F4> :Ack -i
        " }
    endif

    if executable("ag") 
        Plugin 'rking/ag.vim' " {
            map <F4> :Ag -i 
        " }
    endif

endfunction

function GlobalMap()
    "split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    map <F6> :set nu!<CR>:set list!<CR>

    "关于tab的快捷键
    " map tn :tabnext<cr>
    " map tp :tabprevious<cr>
    " map td :tabnew .<cr>
    " map te :tabedit
    " map tc :tabclose<cr>

    " map
    vnoremap // y/<c-r>"<cr>

    " Tab操作快捷方式!
    " nnoremap <C-TAB> :tabnext<CR>
    " nnoremap <C-S-TAB> :tabprev<CR>

    " 正向遍历同名标签
    nmap <Leader>tn :tnext<CR>
    " 反向遍历同名标签
    nmap <Leader>tp :tprevious<CR>
endfunction


" ==============================normal config begin
function GlobalConfig()
    " GlobalConfigIndent
        set tabstop=4 "一个制表符的长度
        set softtabstop=4 "一个制表符的长度（可以大于tabstop）
        set shiftwidth=4 "一个缩进的长度
        set expandtab "使用空格替代制表符
        set smarttab "智能制表符
        set autoindent "自动缩进
        set smartindent "只能缩进

    " GlobalConfigFold
        " Enable folding with the spacebar
        nnoremap <space> za
        set foldenable      " 允许折叠 
        set foldmethod=indent "代码折叠
        " set foldmethod=syntax
        set foldlevel=999
        " set foldcolumn=2

    set nocompatible " 不要使用vi的键盘模式，而是vim自己的 
    set paste
    syn on "语法支持
    set laststatus=2 "始终显示状态栏

    set number "显示行号
    set ruler "显示位置指示器
    set list
    " set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
    set listchars=eol:$,tab:\|\ ,trail:~,extends:>,precedes:<
    set backupdir=/tmp "设置备份文件目录
    set directory=/tmp "设置临时文件目录
    set ignorecase "检索时忽略大小写
    set hls "检索时高亮显示匹配项
    set helplang=cn "帮助系统设置为中文
    set textwidth=100 "设置超过100字符自动换行 
    set backspace=indent,eol,start
    set scrolloff=7 " 光标移动到buffer的顶部和底部时保持3行距离
    " set mouse=a "设置在哪些模式下使用鼠标功能，mouse=a 表示所有模式
    " set nowrap "不自动换行
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
    " set guifont=Literation_Mono_Powerline:h16
    " set t_Co=256
    " colorscheme solarized
endfunction
" ==============================normal config end




" #######################################################################################
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" PEP8代码风格检查
" Plugin 'nvie/vim-flake8'

call LangConfigGo()
call LangConfigPython()
call GlobalPlugin()

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

call GlobalConfig()
call GlobalMap()
