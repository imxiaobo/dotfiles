" INSTALL PLUGINS
call plug#begin('~/.vim/plugged')
" Add plugins to &runtimepath
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --omnisharp-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'a.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
call plug#end()

" CONFIG
set nocompatible
filetype plugin indent on
syntax enable
set shortmess=atl
colorscheme solarized
set background=dark
set encoding=utf-8
set t_Co=256
call togglebg#map("<F10>")
set modified
set hid
set switchbuf=useopen,usetab,newtab
set stal=2
set showmode
set virtualedit=all
set pastetoggle=<F11>
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set shiftround
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set showmatch
set ignorecase
set smartcase
set smarttab
set scrolloff=7
set hlsearch
set incsearch
set gdefault
set fileformats="unix,dos,mac"
set foldenable
set foldcolumn=1
set foldmethod=syntax
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldtext=MyFoldText()
set lazyredraw
set laststatus=2
set cmdheight=1
set autoread
set autowrite
set nobackup
set noswapfile
set nospell
set spelllang=en_us
set ttyfast
set ttymouse=xterm2
set mouse=a
set undodir=~/.vim/undos
set undofile
set undolevels=100000
set undoreload=100000
set directory=~/.vim/.tmp,~/tmp,/tmp
set exrc
set secure
set sessionoptions+=unix,slash
set viminfo='500,f1,<500,s10,h
set history=10000
set listchars=tab:<-,trail:.,extends:#,nbsp:.,eol:$
set whichwrap+=<,>,h,l,[,]
set clipboard=unnamed
set nowrap
set linebreak
set colorcolumn=80
set formatoptions=tcrqnl
set magic
set wildmenu
set wildignore+=*.a,*.o,*.pyc,*.bmp,*.gif,*.ico,*.jpg,*.png,*~,*.swp,*.tmp
set wildmode=list:longest,full
set completeopt=menu,longest,preview
set ruler
set textwidth=80

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" autocmd
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
au BufReadPost * 
  \ if line("'\"") > 1 && line("'\"") <= line("$") | 
  \   exe "normal! g`\"" | 
  \ endif
autocmd FileType mail,human,text,markdown setlocal formatoptions+=tna spell spelllang=en

" filetypes
augroup vim_files
  au!
  autocmd filetype vim setlocal foldmethod=marker
augroup end
augroup python_files
  au!
  autocmd filetype python setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  autocmd filetype python setlocal formatoptions-=t
  autocmd filetype python,rst setlocal nofoldenable foldmethod=expr
  autocmd filetype python nnoremap <buffer><leader>bp :normal Oimport pdb; pdb.set_trace()<Esc>
augroup end
augroup cpp_files
  au!
  autocmd BufReadPre,FileReadPre *.c,*.cpp,*.cxx,*.cc,*.h,*.hpp,*.C,*.H setlocal ft=cpp
augroup end
 
" key mappings
let mapleader=","
let maplocalleader="\\"

map <silent><leader>ccb :Bclose<CR>
map <silent><leader>cab :1,1000 bd!<CR>
map <silent><leader>tbn :tabnew<CR>
map <silent><leader>tbo :tabonly<CR>
map <silent><leader>tbc :tabclose<CR>
map <silent><leader>tbm :tabmove
map <silent><leader>tbe :tabedit <C-r>=expand("%:p:h")<CR>/
map <silent><leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
inoremap <leader>w <C-o>:w<CR>
cnoremap w!! w !sudo tee % >/dev/null
nnoremap <leader>W:%s/\s\+$//<CR>let @/=''<CR>
nnoremap / /\v
vnoremap / /\v
nnoremap <silent><leader>/ :nohlsearch<CR>
vnoremap <silent><leader>/ :nohlsearch<CR>
map j gj
map k gk
vnoremap Q gq
nnoremap Q gqap
vnoremap p <Esc>:let current_reg=@"<CR>gvdi<C-R>=current_reg<CR><ESC>
vnoremap < <gv
vnoremap > >gv
nnoremap <silent><leader>d "_d
vnoremap <silent><leader>d "_d
nnoremap Y y$
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <silent><leader>ev :e ~/.vimrc<CR>
nnoremap <silent><leader>sv :so ~/.vimrc<CR>
inoremap jj <Esc>
nnoremap <leader>ar :right<CR>
nnoremap <leader>ac :center<CR>
noremap <silent>+ :tabnext<CR>
noremap <silent>_ :tabprevious<CR>
nnoremap <silent><Tab> :bnext<CR>
nnoremap <silent><S-Tab> :bprevious<CR>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <F9> :set foldenable!<CR>
inoremap <F9> <C-o>:set foldenable!<CR>
nnoremap <Space> za
vnoremap <Space> za
nnoremap <silent><leader>ft Vatzf
nnoremap <silent><leader>v V`]
map <silent><leader>cp :cp<CR>
map <silent><leader>cn :cn<CR>
nnoremap <silent><leader>vsl :execute "leftabove vsplit" bufname('#')<CR>
nnoremap <silent><leader>vsr :execute "rightbelow vsplit" bufname('#')<CR>
nnoremap <silent><leader>inv :set list!<CR>
nnoremap <silent><leader>gsw :%s#\<<C-r>=expand("<cword>")<CR>\>#
nnoremap <silent><leader>chp :setlocal cursorline! cursorcolumn!<CR>
nnoremap <silent><leader>psm :setlocal paste!<CR>
nnoremap <silent><leader>spc :setlocal spell!<CR>
nnoremap <silent><leader>num :setlocal number!<CR>

" Aireline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
" Solarized Colorscheme
let g:solarized_termcolors=256
" Nerdtree
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeDirArrows=1
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_auto_find=1
nnoremap <silent><leader>nt :NERDTreeTabsToggle<CR>NERDTreeFocus<CR>
nnoremap <silent><leader>tb :TagbarToggle<CR>

" functions
function! MyFoldText()
    let line = getline(v:foldstart)
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart
    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')
    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' .' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")
   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif
   if bufnr("%") == l:currentBufNum
     new
   endif
   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
       
function! MyToHtml(line1, line2)
  " make sure to generate in the correct format
  let old_css = 1
  if exists('g:html_use_css')
    let old_css = g:html_use_css
  endif
  let g:html_use_css = 0
  " generate and delete unneeded lines
  exec a:line1.','.a:line2.'TOhtml'
  %g/<body/normal k$dgg
  " convert body to a table
  %s/<body\s*\(bgcolor="[^"]*"\)\s*text=\("[^"]*"\)\s*>/<table \1 cellPadding=0><tr><td><font color=\2>/
  %s#</body>\(.\|\n\)*</html>#\='</font></td></tr></table>'#i
  " restore old setting
  let g:html_use_css = old_css
endfunction
command! -range=% MyToHtml :call MyToHtml(<line1>,<line2>)

