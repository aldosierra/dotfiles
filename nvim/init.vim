"" Nvim General Settings
set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set termguicolors
set encoding=UTF-8
set completeopt-=preview
set clipboard=unnamedplus
set autoindent
set expandtab
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

"" Keybindings
let g:mapleader=' '
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
inoremap <silent> jk <ESC>
inoremap <silent> kj <ESC>
nnoremap <silent> <leader>e :NvimTreeToggle<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>Q :wq<CR>
nnoremap <silent> <leader>x :bdel<CR>
nnoremap <silent> <leader>s :source %<CR>
nnoremap <silent> <leader>f :Telescope find_files<CR>
nnoremap <silent> <leader>r :Telescope live_grep<CR>
vnoremap <silent> < <gv 
vnoremap <silent> > >gv 
nnoremap <silent> <Tab> :BufferLineCycleNext<CR>
nnoremap <silent> <S-Tab> :BufferLineCyclePrev<CR>

"" Plugins
call plug#begin('~/Projects/dotfiles/nvim/plugged')

  "" Lualine
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  "" Bufferline
  Plug 'akinsho/bufferline.nvim'
  "" Nvim Tree
  Plug 'kyazdani42/nvim-tree.lua'
  "" Toggleterm
  Plug 'akinsho/toggleterm.nvim'
  "" Colors
  Plug 'ap/vim-css-color'
  "" Comments
  Plug 'terrortylor/nvim-comment'
  "" Git signs
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-lua/plenary.nvim'
  "" Dashboard
  Plug 'glepnir/dashboard-nvim'
  "" Telescope
  Plug 'nvim-telescope/telescope.nvim'
  "" Tokyonight theme
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  "" Conquer of completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"" Plugins Settings
let g:nvim_tree_width = 25
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_quit_on_open = 1

"" Coc Config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"" Call Lua Plugins
lua << END
require'lualine'.setup()
require("bufferline").setup{}
require'nvim-tree'.setup {auto_open = true, auto_close = true, git = {ignore = true}}
require'toggleterm'.setup {
  size = 12,
  open_mapping = [[<c-\>]],
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 1,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal'
}
require('nvim_comment').setup({
  comment_empty = false,
  line_mapping = '<leader>cl',
  operator_mapping = '<leader>c',
})
require('gitsigns').setup()
require('telescope').setup {
  defaults = {
    layout_config = {width = 0.75, prompt_position = "top", preview_cutoff = 120, horizontal = {mirror = false}, vertical = {mirror = false}},
    find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-q>"] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
        ["<esc>"] = require('telescope.actions').close,
        ["<CR>"] = require('telescope.actions').select_default + require('telescope.actions').center
      },
      n = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-q>"] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist
      }
    }
  }
}
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_header = {
  [[               ████ ███        ]],
  [[              ██▒▒▒█▒▒▒█       ]],
  [[            ██▒         █      ]],
  [[         ██████  ██ ██  █      ]],
  [[        ██████   ██ ██  █      ]],
  [[        ██▒▒▒█          ███    ]],
  [[        ██▒▒▒▒▒▒   ▒  ██████   ]],
  [[       ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒███ ]],
  [[      ██▒▒▒▒     ▒▒▒▒▒▒▒▒▒▒▒▒█ ]],
  [[      ██▒▒▒       ▒▒▒▒▒▒▒█▒█▒██]],
  [[       ██▒▒       ▒▒▒▒▒▒▒▒▒▒▒▒█]],
  [[        ██▒▒     █▒▒▒▒▒▒▒▒▒▒▒▒█]],
  [[        ███▒▒   ██▒▒▒▒▒▒▒▒▒▒▒▒█]],
  [[         ███▒▒   █▒▒▒▒▒▒▒▒▒▒▒█ ]],
  [[        ██▀█▒▒    █▒▒▒▒▒▒▒▒██  ]],
  [[      ██▀██▒▒▒    █████████    ]],
  [[    ██▀███▒▒▒▒    █▒▒██        ]],
  [[█████████▒▒▒▒▒█   ██  ██       ]],
  [[█▒▒▒▒▒▒█▒▒▒▒▒█    ████▒▒█      ]],
  [[█▒▒▒▒▒▒█▒▒▒▒▒▒█   ███▒▒▒█      ]],
  [[█▒▒▒▒▒▒█▒▒▒▒▒█    █▒▒▒▒▒█      ]],
  [[██▒▒▒▒▒█▒▒▒▒▒▒█   █▒▒▒███      ]],
  [[ ██▒▒▒▒███████   ██████        ]],
  [[  ██▒▒▒▒▒██     ██             ]],
  [[   ██▒▒▒██     ██              ]],
  [[    █████     ███              ]],
  [[    █████▄   █████▄            ]],
  [[  ▄█▓▓▓▓▓█▄ █▓▓▓▓▓█▄           ]],
  [[  █▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓█          ]],
  [[  █▓▓▓▓▓▓▓▓██▓▓▓▓▓▓▓█          ]],
  [[  ▀████████▀▀███████▀          ]]
}
vim.g.dashboard_custom_section = {
  a = {description = {'  Find File          '}, command = 'Telescope find_files'},
  d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
  b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
  c = {description = {'  New File           '}, command = 'tabnew'},
  e = {description = {'  Config             '}, command = 'edit ~/.config/nvim/init.vim'}
}
vim.g.dashboard_custom_footer = {''}
END
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_transparent = 1
let g:tokyonight_transparent_sidebar = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "vim_plug" ]
colorscheme tokyonight
