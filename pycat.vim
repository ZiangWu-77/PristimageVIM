" Name: pycat.vim
" Author: Gemini, inspired by fijicat by Jacklanda
" Description: A Python-focused colorscheme based on fijicat.

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "pycat"

" ==============================================================================
" Editor Chrome
" ==============================================================================

" General UI colors from fijicat
hi Normal       ctermfg=254 ctermbg=233
hi NonText      ctermfg=59
hi Comment      ctermfg=243 cterm=italic

hi Cursor       ctermfg=16  ctermbg=253
hi CursorLine   ctermbg=236 cterm=none
hi CursorLineNr ctermfg=214 ctermbg=236 cterm=none
hi LineNr       ctermfg=250 ctermbg=233

hi VertSplit    ctermfg=244 ctermbg=236 cterm=bold
hi StatusLine   ctermfg=238 ctermbg=253
hi StatusLineNC ctermfg=244 ctermbg=232

hi Visual       ctermfg=232 ctermbg=198
hi Search       ctermfg=15  ctermbg=208 cterm=bold
hi IncSearch    ctermfg=208 ctermbg=15

hi Title        ctermfg=166
hi ErrorMsg     ctermfg=199 ctermbg=16 cterm=bold
hi WarningMsg   ctermfg=231 ctermbg=238 cterm=bold

" Popup menu (Pmenu)
hi Pmenu        ctermfg=250 ctermbg=238
hi PmenuSel     ctermfg=238 ctermbg=214
hi PmenuSbar    ctermfg=248 ctermbg=236
hi PmenuThumb   ctermfg=81

" ==============================================================================
" Syntax Groups (Semantic)
" ==============================================================================

" These are the core semantic colors based on fijicat
hi Statement    ctermfg=82  cterm=bold      " if, for, while, else, try, except, finally
hi Operator     ctermfg=82                  " +, -, *, =, and, or, in
hi Type         ctermfg=45  cterm=none      " int, str, list, dict
hi Constant     ctermfg=135 cterm=bold      " True, False, None, self
hi Number       ctermfg=135                 " 123, 0.45
hi Function     ctermfg=135 cterm=italic    " function names
hi Identifier   ctermfg=208 cterm=none      " variable names (and others)
hi PreProc      ctermfg=82  cterm=none      " import, from, include
hi String       ctermfg=245 cterm=italic
hi Special      ctermfg=160 cterm=bold      " Decorators, special symbols

" ==============================================================================
" Python-specific Linking
" ==============================================================================

" Link Python groups to our semantic groups for consistency
if has("python")
  hi link pythonStatement     Statement
  hi link pythonOperator      Operator
  hi link pythonBuiltinType   Type
  hi link pythonBuiltin       Constant
  hi link pythonNumber        Number
  hi link pythonFunction      Function
  hi link pythonDecorator     Special
  hi link pythonInclude       PreProc
  hi link pythonException     Statement
  hi link pythonString        String
  hi link pythonComment       Comment

  " Special handling for f-strings
  hi pythonFString      ctermfg=245 cterm=italic
  hi pythonInterpolation ctermfg=160 cterm=bold " Highlight the {} part in f-strings
endif

" Set background to dark
set background=dark
