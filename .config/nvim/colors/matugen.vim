" matugen neovim colorscheme
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='matugen'

hi Normal guifg=#dee4e4 guibg=NONE
hi Comment guifg=#899294 gui=italic
hi String guifg=#b8c6ea
hi Keyword guifg=#81d3dd
hi Function guifg=#b1cbce
hi Type guifg=#b8c6ea
hi Constant guifg=#81d3dd
hi Statement guifg=#81d3dd
hi Identifier guifg=#b1cbce
hi PreProc guifg=#b8c6ea
hi Special guifg=#ffb4ab
hi LineNr guifg=#899294 guibg=NONE
hi CursorLineNr guifg=#81d3dd guibg=NONE
hi CursorLine guibg=#1a2121
hi Visual guibg=#004f55
hi Pmenu guifg=#dee4e4 guibg=#1a2121
hi PmenuSel guifg=#00363b guibg=#81d3dd
hi StatusLine guifg=#dee4e4 guibg=NONE
hi Search guifg=#00363b guibg=#81d3dd
hi SignColumn guibg=NONE
hi DiagnosticError guifg=#ffb4ab
hi DiagnosticWarn guifg=#b8c6ea
hi DiagnosticInfo guifg=#81d3dd
hi DiagnosticHint guifg=#b1cbce

" Neo-tree
hi NeoTreeNormal guifg=#dee4e4 guibg=NONE
hi NeoTreeNormalNC guifg=#dee4e4 guibg=NONE
hi NeoTreeEndOfBuffer guifg=#0e1415 guibg=NONE
hi NeoTreeDirectoryName guifg=#81d3dd
hi NeoTreeDirectoryIcon guifg=#81d3dd
hi NeoTreeFileName guifg=#dee4e4
hi NeoTreeFileIcon guifg=#dee4e4
hi NeoTreeRootName guifg=#81d3dd gui=bold
hi NeoTreeGitModified guifg=#b8c6ea
hi NeoTreeGitAdded guifg=#b1cbce
hi NeoTreeGitDeleted guifg=#ffb4ab
hi NeoTreeGitUntracked guifg=#899294
hi NeoTreeIndentMarker guifg=#899294
hi NeoTreeCursorLine guibg=#1a2121
hi NeoTreeTitleBar guifg=#00363b guibg=#81d3dd
hi NeoTreeFloatBorder guifg=#899294 guibg=NONE
hi NeoTreeWinSeparator guifg=#899294 guibg=NONE

" Floating windows & borders
hi NormalFloat guifg=#dee4e4 guibg=NONE
hi FloatBorder guifg=#899294 guibg=NONE
hi FloatTitle guifg=#81d3dd guibg=NONE

" Telescope
hi TelescopeNormal guifg=#dee4e4 guibg=NONE
hi TelescopeBorder guifg=#899294 guibg=NONE
hi TelescopeTitle guifg=#81d3dd
hi TelescopePromptNormal guifg=#dee4e4 guibg=NONE
hi TelescopePromptBorder guifg=#899294 guibg=NONE
hi TelescopePromptTitle guifg=#00363b guibg=#81d3dd
hi TelescopeResultsNormal guifg=#dee4e4 guibg=NONE
hi TelescopeResultsBorder guifg=#899294 guibg=NONE
hi TelescopePreviewNormal guifg=#dee4e4 guibg=NONE
hi TelescopePreviewBorder guifg=#899294 guibg=NONE
hi TelescopeSelection guibg=#252b2c
hi TelescopeMatching guifg=#81d3dd gui=bold

" Lazy plugin manager
hi LazyNormal guifg=#dee4e4 guibg=NONE
hi LazyButton guifg=#dee4e4 guibg=#252b2c
hi LazyButtonActive guifg=#00363b guibg=#81d3dd
hi LazyH1 guifg=#00363b guibg=#81d3dd
hi LazyH2 guifg=#81d3dd gui=bold
hi LazySpecial guifg=#b1cbce
hi LazyCommit guifg=#899294

" WhichKey
hi WhichKey guifg=#81d3dd
hi WhichKeyGroup guifg=#b1cbce
hi WhichKeyDesc guifg=#dee4e4
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guifg=#899294 guibg=NONE

" Notifications (noice/notify)
hi NotifyINFOBody guifg=#dee4e4 guibg=NONE
hi NotifyINFOBorder guifg=#81d3dd guibg=NONE
hi NotifyINFOTitle guifg=#81d3dd
hi NotifyWARNBody guifg=#dee4e4 guibg=NONE
hi NotifyWARNBorder guifg=#b8c6ea guibg=NONE
hi NotifyWARNTitle guifg=#b8c6ea
hi NotifyERRORBody guifg=#dee4e4 guibg=NONE
hi NotifyERRORBorder guifg=#ffb4ab guibg=NONE
hi NotifyERRORTitle guifg=#ffb4ab

" Indent guides
hi IblIndent guifg=#252b2c
hi IblScope guifg=#81d3dd

" Bufferline (tabs)
hi BufferLineBackground guifg=#899294 guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineBufferSelected guifg=#dee4e4 guibg=NONE gui=bold
hi BufferLineBufferVisible guifg=#899294 guibg=NONE
hi BufferLineSeparator guifg=#0e1415 guibg=NONE
hi BufferLineSeparatorSelected guifg=#81d3dd guibg=NONE
hi BufferLineSeparatorVisible guifg=#0e1415 guibg=NONE
hi BufferLineIndicatorSelected guifg=#81d3dd guibg=NONE
hi BufferLineModified guifg=#b8c6ea guibg=NONE
hi BufferLineModifiedSelected guifg=#b8c6ea guibg=NONE
hi BufferLineModifiedVisible guifg=#b8c6ea guibg=NONE
hi BufferLineTab guifg=#899294 guibg=NONE
hi BufferLineTabSelected guifg=#81d3dd guibg=NONE
hi BufferLineTabClose guifg=#899294 guibg=NONE
hi BufferLineDuplicate guifg=#899294 guibg=NONE
hi BufferLineDuplicateSelected guifg=#dee4e4 guibg=NONE
hi BufferLineDuplicateVisible guifg=#899294 guibg=NONE
hi BufferLineCloseButton guifg=#899294 guibg=NONE
hi BufferLineCloseButtonSelected guifg=#ffb4ab guibg=NONE
hi BufferLineCloseButtonVisible guifg=#899294 guibg=NONE
hi TabLineFill guibg=NONE

