" English Comments for clarity
" - For Vim:    ~/.vim/plugged
" 中文注释：为插件指定一个目录
call plug#begin('~/.vim/plugged')

"======================================================================
"== PLUGINS LIST: Add all your plugins between plug#begin/plug#end.
"== 插件列表：在这里添加你所有想要的插件
"======================================================================

" Plugin for a file system explorer
" 文件树浏览器插件
Plug 'preservim/nerdtree'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-commentary'

Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'yarn install'}

Plug 'sheerun/vim-polyglot'

Plug 'ghifarit53/tokyonight-vim'

Plug 'dense-analysis/ale'

Plug 'graywh/vim-colorindent'
"======================================================================
"== END OF PLUGINS
"== 插件列表结束
"======================================================================
call plug#end()


"======================================================================
"== BASIC SETTINGS
"== 一些推荐的基础设置
"======================================================================
set number         " Show line numbers (显示行号)
set relativenumber " Show relative line numbers (显示相对行号)
set tabstop=4      " Set tab width to 4 spaces (设置Tab宽度为4个空格)
set shiftwidth=4   " Set auto-indent width to 4 spaces (设置自动缩进为4个空格)
set expandtab      " Use spaces instead of tabs (使用空格替代Tab)
set smartindent    " Enable smart auto-indenting (开启智能缩进)
set encoding=utf-8 " Set default encoding to UTF-8 (设置编码为UTF-8)
syntax on          " Enable syntax highlighting (开启语法高亮)
set cursorcolumn "高亮所在行"
set cursorline "高亮所在列"
highlight CursorLine ctermbg=240 guibg=#555555
set whichwrap=b,s,<,>,[,],h,l
set splitright
" Enable line numbers in NERDTree
let g:NERDTreeShowLineNumbers = 1
let g:python_highlight_all = 1

set termguicolors
colorscheme tokyonight          "主题
set background=dark         "暗色模式
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
let g:clap_plugin_experimental = v:true
let g:NERDTreeAutoOpen = 1
let g:NERDTreeWinPos = "left"
let NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden = 1
let NERDTreeAutoCenter=1
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
let g:ale_fix_on_save = 1
let g:ale_python_formatters = ['black']
let g:ale_linters = {
\   'python': [],
\}

"=====================================================================
"==HOTKEY
"=====================================================================

" ==============================================================================
" === Custom CoC Completion: Arrow keys to navigate, Tab/Enter to confirm.
" === 自定义 CoC 补全：方向键导航，Tab/回车确认。
" ==============================================================================

" " Helper function for Tab key behavior when PUM is not visible.
" " Tab 键在补全菜单不可见时的辅助函数。
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use Tab to confirm completion.
" " If no completion menu, trigger completion or insert a Tab character.
" " 使用 Tab 键来确认补全。
" " 如果没有补全菜单，则触发补全或插入一个 Tab 字符。
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#confirm() :
"       \ CheckBackspace() ? "\<TAB>" :
"       \ coc#refresh()

" " Use Enter to confirm completion.
" " 使用 Enter 键来确认补全。
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"

" " Use arrow keys to navigate the completion menu.
" " 使用上下方向键来导航补全菜单。
" inoremap <silent><expr> <Up> coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"
" inoremap <silent><expr> <Down> coc#pum#visible() ? coc#pum#next(1) : "\<Down>"

" https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config

" ============================================================================
" Completion navigation and confirmation keys (MODIFIED)
" ============================================================================

" NOTE: There's always a complete item selected by default. You may want to
" enable no select by `"suggest.noselect": true` in your coc-settings.json

" Use Tab to accept the selected completion item.
" If the completion menu is not visible, it will insert a literal Tab
" character or trigger a new completion.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Use <Down> and <Up> to navigate through completion items.
" If the completion menu is not visible, they function as normal arrow keys.
inoremap <silent><expr> <Down> coc#pum#visible() ? coc#pum#next(1) : "\<Down>"
inoremap <silent><expr> <Up>   coc#pum#visible() ? coc#pum#prev(1) : "\<Up>"

" The original <CR> mapping is kept, so you can also use Enter to confirm.
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" The original CheckBackspace function is still needed for the Tab key logic.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <expr> j (line('.') == line('$')) ? 'gg' : 'j'
nnoremap <expr> k (line('.') == 1) ? 'G' : 'k'

function! TrimWhitespaceAndSave()
    " 记录当前光标的位置，防止 %s 命令后光标跳走
    let l:cursor_pos = getpos('.')

    " 1. 使用 silent! 来静默执行替换，并且在没有匹配时不会报错
    silent! %s/\s\+$//e

    " 恢复光标位置
    call setpos('.', l:cursor_pos)

    " 2. 静默保存文件
    silent! w

    " 3. 使用 echom 来显示消息 (echom 的消息会保存在历史记录中)
    "    strftime('%H:%M:%S') 用来获取当前的时:分:秒
    echom "auto saved: " . strftime('%H:%M:%S')
endfunction

" --- 将快捷键映射到上面定义的函数 ---

" 在普通模式下: 直接调用函数
nnoremap <C-s> :call TrimWhitespaceAndSave()<CR>

" 在插入模式下: 退出插入模式，调用函数，然后返回插入模式
inoremap <C-s> <Esc>:call TrimWhitespaceAndSave()<CR>gi

" 在可视模式下: 退出可视模式，调用函数
vnoremap <C-s> <Esc>:call TrimWhitespaceAndSave()<CR>
