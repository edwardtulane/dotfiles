" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

set number

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set backupdir=~/.vim/tmp
  set undofile		" keep an undo file (undo changes after closing)
  set undodir=~/.vim/undo
endif
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ignorecase
set smartcase
set smarttab

nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_left = 1
" nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Auto_Open = 0
let Tlist_Show_One_File = 1

let g:pep8_map = '<F10>'

set encoding=utf-8


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
" map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
" this only works in the GUI
" set mousefocus
  
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
" set t_Co=256
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
" colorscheme desert256
  colorscheme wombat256 " my new favourite!
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" Word wrap and line breaks
set wrap
set linebreak
set fdc=3

" Insert linebreak after every sentence
" function! MyFormatExpr(start, end)
"     silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
" endfunction
" 
" set formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)


" format options for latex
" set formatoptions="tcq12"
" set fo+=n
" let &l:flp='^\s*\\\(item\|end\|begin\)\s*'

" remap leader and some tweaks
let mapleader=','
let maplocalleader=','
set hidden
set title
set nolist
set listchars=tab:>.,trail:.,extends:#,nbsp:.

nnoremap <leader>. (gq)

" Python options
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'


" vim LaTeX plugin
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let tex_no_error = 1

" vimtex setup
"
" vimtex fold
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_fold_preamble = 1

" let g:vimtex_enabled = 0

" vimtex index
let g:vimtex_index_resize = 1
let g:vimtex_index_split_width = 38

let g:vimtex_labels_refresh_always = 0
let g:vimtex_toc_refresh_always = 0

let g:vimtex_labels_enabled = 0
let g:vimtex_toc_enabled = 1

let g:vimtex_disable_recursive_main_file_detection = 1


" vimtex toc
let g:vimtex_toc_tocdepth = 1
let g:vimtex_toc_fold = 1
let g:vimtex_toc_fold_level_start = 1

" custom matcher. quick hack for the intro
 let g:vimtex_toc_custom_matchers = [
            \ { 'title' : 'Introduction',
            \   're' : '\v^\s*\\addchap\{',
            \   'get_entry' : function('vimtex#parser#toc#get_entry_general'),
            \}]
let g:vimtex_compiler_latexmk = { 
        \ 'continuous' : 0, }
"         'build_dir' : '/tmp'
"       \ 'backend' : DEPENDS ON SYSTEM (SEE BELOW),
"       \ 'background' : 1,
"       \ 'build_dir' : '',
"       \ 'callback' : 1,
"       \ 'executable' : 'latexmk',
"       \ 'options' : [
"       \   '-pdf',
"       \   '-verbose',
"       \   '-file-line-error',
"       \   '-synctex=1',
"       \   '-interaction=nonstopmode',
"       \ ],
"       \}
let g:vimtex_quickfix_mode = 0


" set foldlevelstart =3 

let g:vimtex_indent_enabled = 0
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'
let g:vimtex_format_enabled = 0
let g:vimtex_complete_close_braces = 1

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wombat'
let g:airline#extensions#wordcount#enabled = 1
" let g:airline#extensions#wordcount#filetypes = 'markdown','rst','org','help','text','tex','mail'
let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|rst|org|text|asciidoc|tex|mail|votl'

let g:airline#extensions#whitespace#enabled = 0

" airline-vimtex
"left and right delimiters (shown only when status string is not empty) >
  let g:airline#extensions#vimtex#left = "«"
  let g:airline#extensions#vimtex#right = "»"

" the current tex file is the main project file (nothing is shown by default) >
  let g:airline#extensions#vimtex#main = ""

" the current tex file is a subfile of the project
" and the compilation is set for the main file >
  let g:airline#extensions#vimtex#sub_main = ""

" the current tex file is a subfile of the project
" and the compilation is set for this subfile >
  let g:airline#extensions#vimtex#sub_local = "l"

" single compilation is running >
  let g:airline#extensions#vimtex#compiled = "c₁"

" continuousr compilation is running >
  let g:airline#extensions#vimtex#continuous = "c"

" viewer is opened >
  let g:airline#extensions#vimtex#viewer = "v"



" UltiSnippets configuration
" According to the help file, we need this:
" set runtimepath+=/home/felix/.vim/ultisnips_rep
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsListSnippets = '<leader-q>'
let g:UltiSnipsEditSplit = 'context'
let g:ultisnips_python_style = 'numpy'

set tgc  " termguicolors
set nojs " only one space after periods when reformatting text
"
" remap Escape to shift+enter
" inoremap <S-CR> <Esc>
" nmap <C-a> :wa <CR> 
" This was not so clever. Mapped to raise a number by default
"
" Kill the escape delay
set timeoutlen=1000 ttimeoutlen=0

" Plugins for vim-plug
call plug#begin()
"Plug 'lervag/vimtex' ", {'commit': '11ca64c035e4858d79b67f5f696ad223a859941e'}
Plug 'lervag/vimtex' ", {'commit': '11ca64c035e4858d79b67f5f696ad223a859941e'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'reedes/vim-wordy'
Plug 'ervandew/supertab'
Plug 'fmoralesc/vim-pad', {'branch': 'devel'}
Plug 'vimoutliner/vimoutliner'
Plug 'vim-voom/VOoM'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'arnar/vim-matchopen'
call plug#end()
" Plug 'roman/golden-ratio'

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
map <leader>g :Goyo <CR>
let g:goyo_width = '80%'
let g:goyo_height = '90%'

" vim-pad options
let g:pad#dir = '~/write/notes/'
let g:pad#default_format = "votl"
let g:pad#window_height = 16



 " path to directory where library can be found
 let g:clang_library_path='/usr/lib/libclang.so'

 " options for golden-ratio
" let g:golden_ratio_exclude_nonmodifiable = 1
" let g:golden_ratio_wrap_ignored = 1

" nmap <leader>r 4 <C-w>h 35<C-\|>
set noequalalways

" create a new file in vertical split
nnoremap <leader>v :vnew <CR>
set splitright
