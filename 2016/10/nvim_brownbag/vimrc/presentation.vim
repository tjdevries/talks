" {{{ Setting up this path
set rtp+=~/Dropbox/my_talks/2016-10_nvim_brownbag/vimrc/,

let s:dropbox_prefix = expand('~/Dropbox/my_talks/2016-10_nvim_brownbag/')

" source s:dropbox_prefix . 'vimrc/plug.vim'
source ~/Dropbox/my_talks/2016-10_nvim_brownbag/vimrc/plug.vim

let g:my_tags_manager = 'gutentags'
let g:my_current_uniter = 'unite'
" }}}
" Plugin setup {{{
let g:python_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python2_host_prog = expand('~/.pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

let s:plugin_location = s:dropbox_prefix . 'plugins/'

" Show updating with :PlugUpdate
call plug#begin(s:plugin_location)

" Select some pieces from my config
Plug 'tjdevries/config_manager'
Plug 'morhetz/gruvbox'
" Plug 'tjdevries/gruvbox-tj'

" Presentation software
Plug 'trapd00r/vimpoint'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi',  { 'for': 'python' }
Plug 'shougo/neco-vim'
" ... Put other sources here

" Unite
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'
Plug 'ujihisa/unite-colorscheme'
Plug 'Shougo/neoyank.vim'       " Yank ring for unit

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Snippets management
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'

call plug#end()

" My configuration
" source ~/Dropbox/my_talks/2016-10_nvim_brownbag/plugins/config_manager/nvim/init/
source ~/Dropbox/my_talks/2016-10_nvim_brownbag/plugins/config_manager/nvim/init/01-basic_configuration.vim
source ~/Dropbox/my_talks/2016-10_nvim_brownbag/plugins/config_manager/nvim/init/03-tags.vim
source ~/Dropbox/my_talks/2016-10_nvim_brownbag/plugins/config_manager/nvim/init/04-keymaps.vim
source ~/Dropbox/my_talks/2016-10_nvim_brownbag/plugins/config_manager/nvim/init/05-deoplete.vim
" }}}
" {{{ Colorscheme
set background=dark
colorscheme gruvbox
" }}}
" {{{ Unite
nnoremap <silent> <leader>il :<C-u>Unite -start-insert line<CR>
nnoremap <silent> <leader>if :<C-u>Unite -start-insert buffer<CR>
nnoremap <silent> <leader>it :<C-u>Unite -start-insert tab:no-current<CR>
nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files -winheight=10 file_rec/neovim<CR>


let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.init_vim = {
          \ 'description': 'Edit your important init.vim information'
          \ }
let g:unite_source_menu_menus.init_vim.file_candidates = [
          \ ['nvim/', '~/.config/nvim/'],
          \ ['  init', '~/.config/nvim/init.vim'],
          \ ['after/', '~/.config/nvim/after/'],
          \ ['autoload/', '~/.config/nvim/autoload/'],
          \ ['init/', '~/.config/nvim/init/'],
          \ ['  basic configuration', '~/.config/nvim/init/01-basic_configuration.vim'],
          \ ['  colorscheme', '~/.config/nvim/init/03-colorscheme.vim'],
          \ ['  plugins', '~/.config/nvim/init/02-plugins.vim'],
          \ ]
nnoremap <leader>en :Unite menu:init_vim -start-insert<CR>
" }}}
" {{{ Snippets
let g:UltiSnipsSnippetsDir = "~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]

" Trigger configuration.
let g:UltiSnipsExpandTrigger='<leader>e'
let g:UltiSnipsJumpForwardTrigger='<leader>r'
let g:UltiSnipsJumpBackwardTrigger='<leader>w'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
let g:UltiSnipsUsePythonVersion = 3
" }}}
" Functions for presentation

function! SetupVimrcExample() abort
  set filetype=vim
endfunction

function! SetupCExample() abort
  set filetype=c
  call deoplete#enable()
endfunction

function! SetupCompletionExample() abort
  set filetype=python
  call deoplete#disable()
endfunction

function! SetupDeopleteExample() abort
  set filetype=python
  call deoplete#enable()
endfunction

nnoremap ,vimrc :call SetupVimrcExample()<CR>
nnoremap ,nod :call SetupCompletionExample()<CR>
nnoremap ,yesd :call SetupDeopleteExample()<CR>

" TODO: Unite menu for commands.
