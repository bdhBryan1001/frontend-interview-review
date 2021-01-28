"==========================================
" 基本设置
"==========================================
" 编码
set enc=utf-8

" 不和 vi 兼容
set nocompatible

" 备份和撤销文件
set nobackup
set noswapfile

if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undodir
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
  endif
endif

" 中文
set fileencodings=ucs-bom,utf-8,gb18030,latin1

" 鼠标支持
if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif

set clipboard=unnamed

" 设置文本菜单
if has('gui_running')
  let do_syntax_sel_menu = 1
  let do_no_lazyload_menus = 1
endif

if !has('gui_running')
  if has('wildmenu')
    set wildmenu
    set cpoptions-=<
    set wildcharm=<C-Z>
    nnoremap <F10>      :emenu <C-Z>
    inoremap <F10> <C-O>:emenu <C-Z>
  endif
endif

" 查找
set ignorecase
set smartcase
set hlsearch
set incsearch

nnoremap <silent> <F2>      :nohlsearch<CR>
inoremap <silent> <F2> <C-O>:nohlsearch<CR>

set scrolloff=1


"==========================================
"  常用键映射
"==========================================
" Esc键映射为jj
inoremap jj <Esc>





"==========================================
"  显示设置
"==========================================
" 显示行号
set number
hi CursorLineNr term=bold cterm=bold ctermbg=237

" 设置缩进
set shiftwidth=2
set tabstop=2

" 突出显示当前行 
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=237

" 启动 vim 时关闭折叠代码
set nofoldenable

" 主题
syntax enable
colorscheme gruvbox
set background=dark

" 背景透明
hi Normal ctermfg=252 ctermbg=none






"==========================================
" vim-plug
"==========================================

call 	plug#begin('~/.vim/plugged')

" -----------------------------------------------
" 树形目录
" -----------------------------------------------
Plug 'scrooloose/nerdtree'                            " https://github.com/preservim/nerdtree
Plug 'jistr/vim-nerdtree-tabs'                        " https://github.com/jistr/vim-nerdtree-tabs
Plug 'Xuyuanp/nerdtree-git-plugin'                    " https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'ryanoasis/vim-devicons'                         " https://github.com/ryanoasis/vim-devicons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'        " https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
Plug 'tpope/vim-eunuch'                               " https://github.com/tpope/vim-eunuch

map <C-n> :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

let g:nerdtree_tabs_open_on_console_startup = 1

" i 在新的水平分割的窗口中打开
" s 在新的竖直分割的窗口中打开
" t 在标签页中打开
" go 预览文件
" r 刷新光标所在的目录
" R 刷新当前根路径
" I 显示隐藏文件
" m 显示文件操作菜单
" C 将根路径设置为光标所在的目录
" u 设置上级目录为根路径
" gT 前一个 tab
" gt 后一个 tab
" <C-W> 加方向键（h、j、k、l、<Left> 等）可以在窗口之间跳转
" <C-W> + w 跳转到下一个窗口
" <C-W> + s 和 :split 作用相同，把当前窗口横向一分为二
" <C-W> + v 和 :vsplit 作用相同，把当前窗口纵向一分为二
" <C-W> + o 或 :only 只保留当前窗口，关闭其他所有窗口






" -----------------------------------------------
" 标签
" -----------------------------------------------
Plug 'majutsushi/tagbar'                         " https://github.com/majutsushi/tagbar

nnoremap <F9>      :TagbarToggle<CR>
inoremap <F9> <C-O>:TagbarToggle<CR>

let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }






" -----------------------------------------------
" 自动补全
" -----------------------------------------------
Plug 'Valloric/YouCompleteMe'                         " https://github.com/ycm-core/YouCompleteMe
Plug 'Raimondi/delimitMate'                           " https://github.com/Raimondi/delimitMate

nnoremap <Leader>fi :YcmCompleter FixIt<CR>
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>

" 升级YouCompleteMe需要重新用cmake编译命令如下:
" ~/.vim/plugged/YouCompleteMe/install.py --clang-completer --system-libclang






" -----------------------------------------------
" 语法高亮，检查
" -----------------------------------------------
Plug 'sheerun/vim-polyglot'                           " https://github.com/sheerun/vim-polyglot
Plug 'w0rp/ale'                                       " https://github.com/w0rp/ale

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▶'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)





" -----------------------------------------------
" 全局搜索，快速打开文件
" -----------------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " https://github.com/junegunn/fzf
Plug 'junegunn/fzf.vim'                               " https://github.com/junegunn/fzf.vim
Plug 'ctrlpvim/ctrlp.vim'                             " https://github.com/ctrlpvim/ctrlp.vim

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_regexp = 1

" <c-r>: 切换匹配模式
" <c-t>：在新的 tab 中打开
" :Rg






" -----------------------------------------------
" 状态条
" -----------------------------------------------
Plug 'vim-airline/vim-airline'                        " https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline-themes'                 " https://github.com/vim-airline/vim-airline-themes

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#nerdtree_statusline = 0
let g:airline_section_c = ''





" -----------------------------------------------
" 注释
" -----------------------------------------------
Plug 'scrooloose/nerdcommenter'                       " https://github.com/preservim/nerdcommenter

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" <leader>c<space> 注释/取消注释
" <leader>ca 切换　// 和 /* */
" <leader>cs /* 块注释 */
" <leader>cm 只用一组符号注释
" <leader>cA 在行尾添加注释






" -----------------------------------------------
" git
" -----------------------------------------------
Plug 'airblade/vim-gitgutter'                         " https://github.com/airblade/vim-gitgutter
Plug 'tpope/vim-fugitive'                             " https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-rhubarb'                              " https://github.com/tpope/vim-rhubarb

set updatetime=100
let g:gitgutter_max_signs = -1

" jump to next hunk: ]c
" jump to previous hunk: [c
" stage the hunk: <Leader>hs
" undo the hunk: <Leader>hu
" preview the hunk: <Leader>hp

" :G
" :Gvdiffsplit
" :GBrowse
"
" s: 加到暂存区中
" u: 重置加入暂存区的修改
" X: 丢弃修改
" ca: 更改上一次提交
" ce: 使用上一次提交
" =: 切换 diff 显示
" cc: 提交当前暂存区中的文件






" -----------------------------------------------
" Markdown
" -----------------------------------------------
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }      " https://github.com/iamcco/markdown-preview.nvim

" :MarkdownPreview
" :MarkdownPreviewStop






" -----------------------------------------------
" Emmet
" -----------------------------------------------
Plug 'mattn/emmet-vim'                                " https://github.com/mattn/emmet-vim

let g:user_emmet_leader_key='<C-Z>'

" <C-Z>,






" -----------------------------------------------
" Prettier
" -----------------------------------------------
Plug 'prettier/vim-prettier', { 'do': 'npm install' }     " https://github.com/prettier/vim-prettier

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" :PrettierAsync






" -----------------------------------------------
" Wakatime
" -----------------------------------------------
" Plug 'wakatime/vim-wakatime'                              " https://github.com/wakatime/vim-wakatime






" -----------------------------------------------
" Whitespace
" -----------------------------------------------
Plug 'ntpeters/vim-better-whitespace'                     " https://github.com/ntpeters/vim-better-whitespace

let g:better_whitespace_enabled=1

" :StripWhitespace






call plug#end()

" PlugInstall
" PlugUpdate
" PlugClean
" PlugUpgrade
" PlugStatus
" PlugDiff
" PlugSnapshot


