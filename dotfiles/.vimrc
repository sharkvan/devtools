execute pathogen#infect()

filetype on
filetype plugin indent on
syntax on
set ai
set ruler
set nowrap
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set shellcmdflag=-ic

" Nerdtree settings
map <LEADER>f :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 24
let g:NERDTreeMinimalUI = 1
autocmd VimEnter * if (0 == argc()) | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1
let g:airline#extensions#syntastic#enabled = 1

" elm-vim settings
let g:polyglot_disabled = ['elm']
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_setup_keybindings = 0

" YouCompleteMe
let g:ycm_semantic_triggers = {
    \ 'elm' : ['.'],
    \}
