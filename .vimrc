" Plugins----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

  Plug 'junegunn/vim-easy-align'
  Plug 'preservim/nerdtree'               "File explorer
  Plug 'tpope/vim-commentary'             "Commenting utility
  Plug 'vim-airline/vim-airline'          "Status bar
  Plug 'airblade/vim-gitgutter'           "Git integration
  Plug 'dense-analysis/ale'               "For real-time syntax-checking
  Plug 'christoomey/vim-tmux-navigator'   "Tmux
  Plug 'morhetz/gruvbox'                  "Custom colourscheme
  Plug 'junegunn/vim-emoji'               "Custom emojis
  Plug 'jiangmiao/auto-pairs'             "Auto-completion of brackets
  Plug 'RRethy/vim-illuminate'            "Reference highlighting in scope

call plug#end()

" General settings-------------------------------------------------------------
set termguicolors                   "Enable 24-bit RGB colours
set colorcolumn=80                  "Enables column for line breakage marker
set number                          "Show line numbers
set cursorline                      "Highlight current line
set tabstop=2                       "Number of spaces tabs count for
set shiftwidth=2                    "Number of spaces for autoindent
set expandtab                       "Use spaces instead of tabs
set smartindent                     "Smart indentation
set clipboard=unnamedplus           "Use system clipboard
syntax enable                       "Enable syntax highlighting
set background=dark                 "Dark background
colorscheme gruvbox                 "Sets colorscheme to plugged gruvbox
filetype plugin indent on           "Enable plugins and auto indentation
set mouse=a                         "Enables cursor control with mouse
set scrolloff=0                     "Prevents scrolling beyond last line

                                    "Forces Vim to source colorscheme
autocmd VimEnter * colorscheme gruvbox
                                    "Forces Vim to write comments in Italic
autocmd BufEnter * highlight Comment cterm=italic gui=italic

" Key mappings-----------------------------------------------------------------
                                    "Opens NERDTree with Ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>
                                    "Auto completion by using TAB
inoremap <expr> <Tab> getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible()
      \ ? '<C-N>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() \|\| getline('.')[col('.')-2] !~ '^\s\?$'
      \ ? '<C-P>' : '<Tab>'
autocmd CmdwinEnter * inoremap <expr> <buffer> <Tab>
      \ getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible()
      \ ? '<C-X><C-V>' : '<Tab>'
                                    "gc comments out marked code in Visual mode
autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s
autocmd FileType tex setlocal commentstring=%\ %s

" Scope highlighting-----------------------------------------------------------


" ALE configuration------------------------------------------------------------
                                    "Enables ALE
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'always'     
let g:ale_lint_on_enter = 1
                                    "Enables linting on text change and saving
let g:ale_lint_on_save = 1
                                    "Displays the linting results in the gutter
let g:ale_sign_column_always = 1 

" Enable real-time inline error messages---------------------------------------
                                    "Set the sign for error
let g:ale_sign_error = '✘'
                                    "Set the sign for warning
let g:ale_sign_warning = '⚠'
                                    "Set the style for virtual text 
let g:ale_virtualtext_cursor = 1
                                    "Inline error messages
let g:ale_virtualtext_prefix = '>> '
                                    "Prefix for errors
let g:ale_virtualtext_error = '>> '
                                    "Prefix for warnings
let g:ale_virtualtext_warning = '>> '

let g:ale_lint_on_text_changed = 'always'

let g:ale_lint_on_save = 1
                                    "Automatically fix issues when saving
let g:ale_fix_on_save = 1 

" ALE linters for multiple file types------------------------------------------
let g:ale_linters = {
\   'cpp': ['clangtidy', 'cppcheck'],
\   'c': ['gcc', 'clang', 'cppcheck'],
\   'sql': ['sqlint'],
\   'tex': ['chktex'],
\}

" Airline configuration--------------------------------------------------------
                                    "Enable tabline
let g:airline#extensions#tabline#enabled = 1	
                                    "Airline theme
let g:airline_theme='dark'           
                                    "Enables powerline fonts if installed
let g:airline_powerline_fonts = 1      

" GitGutter configuration------------------------------------------------------
                                    "Enable GitGutter
let g:gitgutter_enabled = 1 		                

" gruvbox configuration--------------------------------------------------------
                                    "Sets hardness of colorscheme contrast
let g:gruvbox_contrast_dark = 'hard'
                                    "Sets Italic font for certain text
let g:gruvbox_italic = 1
