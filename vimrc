set noswapfile

" ================ auto reload vimrc when editing it ================
autocmd! bufwritepost .vimrc source ~/.vimrc

" ================ define your colors for todo task note in code ================
if !exists("autocmd_colorscheme_loaded")
  let autocmd_colorscheme_loaded = 1
  autocmd ColorScheme * highlight TodoRed      ctermbg=darkgreen guibg=#002b37 ctermfg=LightRed     guifg=#E01B1B
  autocmd ColorScheme * highlight TodoOrange   ctermbg=darkgreen guibg=#002b37 ctermfg=LightMagenta guifg=#E0841B
  autocmd ColorScheme * highlight TodoYellow   ctermbg=darkgreen guibg=#002b37 ctermfg=LightYellow  guifg=#E0D91B
endif
  if has("autocmd")
    if v:version > 701
      autocmd Syntax * call matchadd('TodoRed',  '\W\zs\(TODO1\)')
      autocmd Syntax * call matchadd('TodoOrange', '\W\zs\(TODO2\)')
      autocmd Syntax * call matchadd('ToDoYellow', '\W\zs\(TODO3\)')
    endif
  endif

"================ General Settings ================
set ruler 		" show the cursor position all the time
set autoread		" auto read when the file is changed from the outside
syntax on		" blah blah
filetype on 		" file type detection
filetype indent on	" smart indent
filetype plugin on      " for pydiction
set softtabstop=2
set shiftwidth=2        " ..
set tabstop=4
set expandtab           " expand tabs to spaces
set formatoptions+=n    " support for numbered/bullet lists
set textwidth=80        " wrap at 80 chars by default
set autoindent
set number
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set mouse=a 		" enable using the mouse if terminal emulator
set visualbell		" I don't like noise

" ================ path to pydiction plugin ================
"let g:pydiction_location = '~/.pydiction/complete-dict'

if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  " terminal color settings
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
  "runtime! plugin/guicolorscheme.vim
  "autocmd VimEnter * GuiColorScheme spacegray
  colorscheme spacegray
  "colorscheme flattr
else
  " Gui color settings
  set guifont=Monospace
  set background=light 
  set t_Co=256          " 256 color mode
  " set cursorline        " highlight current line
  colorscheme spacegray 
endif

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
