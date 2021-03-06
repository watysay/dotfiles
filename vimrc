" $HOME/.vimrc settings
" based on .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
"" set mouse=a  " on OSX press ALT and click
"" set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" noremap <C-n> :nohl<CR>
"" vnoremap <C-n> :nohl<CR>
"" inoremap <C-n> :nohl<CR>


" Quicksave command
noremap zz :update<CR>
vnoremap zz <C-C>:update<CR>
inoremap zz <C-O>:update<CR>


" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
"" noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>; <esc>:tabnext<CR>


" map sort function to a key
"" vnoremap <Leader>s :sort<CR>

" change the way to leave insert mode
imap jk <Esc>
imap kj <Esc>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
"" vnoremap < <gv  " better indentation
"" vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"" let g:solarized_termcolors=256
set t_Co=256
set background=dark
"colorscheme solarized
colorscheme default

" telling vim that sh script are in fact bash
" remove line for std sh syntax
" try here-string to test syntax
let g:is_bash    = 1


" Showing line numbers and length
set number  " show line numbers
"" set textwidth=79   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
"" set colorcolumn=80
"" highlight ColorColumn ctermbg=22 
highlight OverLength ctermbg=52 ctermfg=246 guibg=#592929
match OverLength /\%81v.\+/

" Adding statusline (bottom of screen)
set laststatus=2
highlight StatusLine ctermfg=NONE  ctermbg=NONE cterm=NONE
" Customizing the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}] "modified flag
set statusline+=%r      "read only flag

set statusline+=\ %=                        " align left
set statusline+=\ L:%l\ C:%c                " coordinates
set statusline+=\ Line:%l/%L[%p%%]          " line X of Y [percent of file]
" Colorizing the statusline when in insert mode
autocmd InsertEnter * highlight StatusLine ctermfg=black ctermbg=DarkRed
autocmd InsertLeave * highlight StatusLine ctermfg=NONE  ctermbg=NONE cterm=NONE


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
"" set history=700
"" set undolevels=700


" Real programmers don't use TABs but spaces
" Default is mostly bash
set tabstop=2
set softtabstop=2
set shiftwidth=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 " Settings for python scripts
set shiftround
set expandtab
set smarttab
set autoindent " newline as same indent as previous
" Make search case insensitive
"" set hlsearch
"" set incsearch
"" set ignorecase
"" set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle ##
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim ##
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"" call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle ##
" git clone git://github.com/Lokaltog/vim-powerline.git ##
"" set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle ##
" git clone https://github.com/kien/ctrlp.vim.git ##
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle ##
" git clone https://github.com/klen/python-mode ##
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle ##
" git clone git://github.com/davidhalter/jedi-vim.git ##
"" let g:jedi#usages_command = "<leader>z"
"" let g:jedi#popup_on_dot = 0
"" let g:jedi#popup_select_first = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin ##
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492 ##
"" set nofoldenable

