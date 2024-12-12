"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    _____    ______   ______   __   __   ______   __   __ __   __    __    
"   /\  __-. /\___  \ /\  __ \ /\ '-.\ \ /\  __ \ /\ \ / //\ \ /\ '-./  \   
"   \ \ \/\ \\/_/  /__\ \  __ \\ \ \-.  \\ \  __ \\ \ \'/ \ \ \\ \ \-./\ \  
"    \ \____-  /\_____\\ \_\ \_\\ \_\\''_\\ \_\ \_\\ \__|  \ \_\\ \_\ \ \_\ 
"     \/____/  \/_____/ \/_/\/_/ \/_/ \/_/ \/_/\/_/ \/_/    \/_/ \/_/  \/_/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
  Plug 'mhinz/vim-startify'               "Shows ASCII art at the start

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
                                    "Map Ctrl+Shift+Arrow keys for word-wise 
                                    "selection in Visual mode
vnoremap <C-S-Left> b
vnoremap <C-S-Right> e
                                    "Map Ctrl+Shift+Arrow keys in Normal mode 
                                    "to start selection
nnoremap <C-S-Left> vB
nnoremap <C-S-Right> vE
                                    "Map Ctrl+Shift+Up/Down for selecting 
                                    "entire lines
vnoremap <C-S-Up> k
vnoremap <C-S-Down> j
                                    "Map Ctrl+Shift+Up/Down in Normal mode to 
                                    "start line selection
nnoremap <C-S-Up> vVk
nnoremap <C-S-Down> vVj
                                    "Set the path for the tags file
set tags=./tags;
                                    "Key mappings for navigation (optional, as 
                                    "Ctrl-] and Ctrl-o are defaults)
nmap <C-]> <C-]>
nmap <C-o> <C-o>
                                    "Forward navigation
nmap <C-i> <C-i>
                                    "gc comments out marked code in Visual mode
autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s
autocmd FileType tex setlocal commentstring=%\ %s

" Scope highlighting-----------------------------------------------------------


" ALE configuration------------------------------------------------------------

                                    "Enable ALE for linting and fix formatting
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
                                    "Configure ALE signs and virtual text
                                    "Show inline error messages near the cursor                                   
let g:ale_virtualtext_cursor = 1    
                                    "Enable gutter for errors
let g:ale_sign_error = '🟥'         
                                    "Enable gutter for warnings
let g:ale_sign_warning = '🟨'       
                                    "Enable echoing errors in the status line
let g:ale_echo_cursor = 1
                                    "Show virtual text near errors/warnings
let g:ale_virtualtext_cursor = 1
                                    "Use Neomake-style virtual text colors for 
                                    "errors and warnings
highlight ALEVirtualTextError guifg=red ctermfg=red
highlight ALEVirtualTextWarning guifg=yellow ctermfg=yellow
                                    "Avoid linting on every text change
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1

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

" Custom header----------------------------------------------------------------
let g:startify_custom_header = [
\ '    _____    ______   ______   __   __   ______   __   __ __   __    __    ',
\ '   /\  __-. /\___  \ /\  __ \ /\ "-.\ \ /\  __ \ /\ \ / //\ \ /\ "-./  \   ',
\ '   \ \ \/\ \\/_/  /__\ \  __ \\ \ \-.  \\ \  __ \\ \ \"/ \ \ \\ \ \-./\ \  ',
\ '    \ \____-  /\_____\\ \_\ \_\\ \_\\"-_\\ \_\ \_\\ \__|  \ \_\\ \_\ \ \_\ ',
\ '     \/____/  \/_____/ \/_/\/_/ \/_/ \/_/ \/_/\/_/ \/_/    \/_/ \/_/  \/_/ '
\ ]
