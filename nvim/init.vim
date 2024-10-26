
call plug#begin()
"File and folder management
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'nvim-neo-tree/neo-tree.nvim'

"Snippets

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'

" Language support
Plug 'tpope/vim-projectionist'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Flutter
Plug 'thosakwe/vim-flutter'

" Transparence
Plug 'xiyaowong/transparent.nvim'


"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'


"Typescript
" Plug 'ianks/vim-tsx'
" Plug 'leafgarland/typescript-vim'

" Git
" Plug 'tpope/vim-fugitive'
" Plug 'vim-airline/vim-airline'

" for nerdtree icons
"Plug 'nvim-tree/nvim-web-devicons'

Plug 'ryanoasis/vim-devicons'


"Theme
Plug 'morhetz/gruvbox'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'itchyny/lightline.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'powerline/powerline'
" Float Terminal
Plug 'voldikss/vim-floaterm'

Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }

Plug 'adelarsq/image_preview.nvim'
call plug#end()

let g:airline_theme='wombat'
"let g:airline_theme='ayu_dark'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'default'
"let g:Powerline_symbols = 'fancy'

" Testes
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline#extensions#tabline#formatter = 'default'


colorscheme gruvbox


" NerdTree config

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree

"let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         


let g:NERDTreeIgnore = ['^node_modules$']


set noerrorbells                                              " Don't add sounds for errors
set number
set nohlsearch
set smartcase
set noswapfile
set nobackup
set undofile
set incsearch
set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2
set colorcolumn=120
set clipboard=unnamedplus
set backspace=indent,eol,start
set hidden
" highlight ColorColumn ctermbg=1 guibg=lightgreen

" Ativar quebra automática de linhas
set wrap

" Definir largura máxima de coluna
set textwidth=120

" Ativar quebra de palavra ao atingir a largura máxima
set linebreak
set breakindent
set showbreak=++\ \

" Desativar a quebra automática de linhas em modo de inserção
autocmd InsertEnter * set nowrap
autocmd InsertLeave * set wrap






let mapleader=" "
nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>
map <leader>h :wincmd h <CR>
map <leader>j :wincmd j <CR>
map <leader>k :wincmd k <CR>
map <leader>l :wincmd l <CR>

nnoremap <C-b> :NERDTreeToggle<CR>
" nnoremap <C-S-b> :NERDTreeFind<CR>

let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>do <Plug>(coc-codeaction)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>



" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <C-P> :FZF<CR>

nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'


set title

" Quebra linha automaticamente
" set textwidth=80
" set wrap

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-clangd',
  \ 'coc-sh',
  \ 'coc-rome',
  \ 'coc-vetur',
  \ ]

let g:NERDTreeGitStatusWithFlags = 1


" --------------------------------------------
" Personal Keymaps

" Utils
nnoremap <C-z> :undo <CR>

" Tab

nnoremap <C-T> :tabnew<CR>
nnoremap <C-e> :tabn<CR>

nnoremap <C-d> :tabp<CR>
" Keymap to move selected text up or down.
vnoremap <silent> <S-j> :m '<-2<CR>gv=gv
vnoremap <silent> <S-k> :m '>+1<CR>gv=gv

" Personal Configuration

" FLOATERM

" Set floaterm window's background to black
" hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
"hi FloatermBorder guibg=yellow guifg=white


":FloatermNew --height=0.6 --width=0.4 --wintype=float --name=floaterm1 --position=topleft --autoclose=2 ranger --cmd="cd ~"


nnoremap   <silent>   <S-t>    :FloatermNew --height=0.6 --width=0.4 --wintype=float --name=floaterm1 --position=topright<CR>

nnoremap   <silent>   <S-n>    :FloatermNew --height=0.3 --width=0.4 --wintype=float --name=floaterm2 --position=bottomright<CR>
"nnoremap   <silent>   <S-t>    :FloatermNew<CR>
nnoremap   <silent>   <S-Left>    :FloatermPrev<CR>
nnoremap   <silent>   <S-Right>    :FloatermNext<CR>
nnoremap   <silent>   <S-u>   :FloatermToggle<CR>







