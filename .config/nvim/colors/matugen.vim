" matugen neovim colorscheme
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='matugen'

hi Normal guifg=#dfe3e7 guibg=NONE
hi Comment guifg=#8b9298 gui=italic
hi String guifg=#ccc1e9
hi Keyword guifg=#91cef5
hi Function guifg=#b6c9d8
hi Type guifg=#ccc1e9
hi Constant guifg=#91cef5
hi Statement guifg=#91cef5
hi Identifier guifg=#b6c9d8
hi PreProc guifg=#ccc1e9
hi Special guifg=#ffb4ab
hi LineNr guifg=#8b9298 guibg=NONE
hi CursorLineNr guifg=#91cef5 guibg=NONE
hi CursorLine guibg=#1c2024
hi Visual guibg=#004c6b
hi Pmenu guifg=#dfe3e7 guibg=#1c2024
hi PmenuSel guifg=#00344b guibg=#91cef5
hi StatusLine guifg=#dfe3e7 guibg=NONE
hi Search guifg=#00344b guibg=#91cef5
hi SignColumn guibg=NONE
hi DiagnosticError guifg=#ffb4ab
hi DiagnosticWarn guifg=#ccc1e9
hi DiagnosticInfo guifg=#91cef5
hi DiagnosticHint guifg=#b6c9d8

" Neo-tree
hi NeoTreeNormal guifg=#dfe3e7 guibg=NONE
hi NeoTreeNormalNC guifg=#dfe3e7 guibg=NONE
hi NeoTreeEndOfBuffer guifg=#0f1417 guibg=NONE
hi NeoTreeDirectoryName guifg=#91cef5
hi NeoTreeDirectoryIcon guifg=#91cef5
hi NeoTreeFileName guifg=#dfe3e7
hi NeoTreeFileIcon guifg=#dfe3e7
hi NeoTreeRootName guifg=#91cef5 gui=bold
hi NeoTreeGitModified guifg=#ccc1e9
hi NeoTreeGitAdded guifg=#b6c9d8
hi NeoTreeGitDeleted guifg=#ffb4ab
hi NeoTreeGitUntracked guifg=#8b9298
hi NeoTreeIndentMarker guifg=#8b9298
hi NeoTreeCursorLine guibg=#1c2024
hi NeoTreeTitleBar guifg=#00344b guibg=#91cef5
hi NeoTreeFloatBorder guifg=#8b9298 guibg=NONE
hi NeoTreeWinSeparator guifg=#8b9298 guibg=NONE

" Floating windows & borders
hi NormalFloat guifg=#dfe3e7 guibg=NONE
hi FloatBorder guifg=#8b9298 guibg=NONE
hi FloatTitle guifg=#91cef5 guibg=NONE

" Telescope
hi TelescopeNormal guifg=#dfe3e7 guibg=NONE
hi TelescopeBorder guifg=#8b9298 guibg=NONE
hi TelescopeTitle guifg=#91cef5
hi TelescopePromptNormal guifg=#dfe3e7 guibg=NONE
hi TelescopePromptBorder guifg=#8b9298 guibg=NONE
hi TelescopePromptTitle guifg=#00344b guibg=#91cef5
hi TelescopeResultsNormal guifg=#dfe3e7 guibg=NONE
hi TelescopeResultsBorder guifg=#8b9298 guibg=NONE
hi TelescopePreviewNormal guifg=#dfe3e7 guibg=NONE
hi TelescopePreviewBorder guifg=#8b9298 guibg=NONE
hi TelescopeSelection guibg=#262b2e
hi TelescopeMatching guifg=#91cef5 gui=bold

" Lazy plugin manager
hi LazyNormal guifg=#dfe3e7 guibg=NONE
hi LazyButton guifg=#dfe3e7 guibg=#262b2e
hi LazyButtonActive guifg=#00344b guibg=#91cef5
hi LazyH1 guifg=#00344b guibg=#91cef5
hi LazyH2 guifg=#91cef5 gui=bold
hi LazySpecial guifg=#b6c9d8
hi LazyCommit guifg=#8b9298

" WhichKey
hi WhichKey guifg=#91cef5
hi WhichKeyGroup guifg=#b6c9d8
hi WhichKeyDesc guifg=#dfe3e7
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guifg=#8b9298 guibg=NONE

" Notifications (noice/notify)
hi NotifyINFOBody guifg=#dfe3e7 guibg=NONE
hi NotifyINFOBorder guifg=#91cef5 guibg=NONE
hi NotifyINFOTitle guifg=#91cef5
hi NotifyWARNBody guifg=#dfe3e7 guibg=NONE
hi NotifyWARNBorder guifg=#ccc1e9 guibg=NONE
hi NotifyWARNTitle guifg=#ccc1e9
hi NotifyERRORBody guifg=#dfe3e7 guibg=NONE
hi NotifyERRORBorder guifg=#ffb4ab guibg=NONE
hi NotifyERRORTitle guifg=#ffb4ab

" Indent guides
hi IblIndent guifg=#262b2e
hi IblScope guifg=#91cef5

" Bufferline (tabs)
hi BufferLineBackground guifg=#8b9298 guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineBufferSelected guifg=#dfe3e7 guibg=NONE gui=bold
hi BufferLineBufferVisible guifg=#8b9298 guibg=NONE
hi BufferLineSeparator guifg=#0f1417 guibg=NONE
hi BufferLineSeparatorSelected guifg=#91cef5 guibg=NONE
hi BufferLineSeparatorVisible guifg=#0f1417 guibg=NONE
hi BufferLineIndicatorSelected guifg=#91cef5 guibg=NONE
hi BufferLineModified guifg=#ccc1e9 guibg=NONE
hi BufferLineModifiedSelected guifg=#ccc1e9 guibg=NONE
hi BufferLineModifiedVisible guifg=#ccc1e9 guibg=NONE
hi BufferLineTab guifg=#8b9298 guibg=NONE
hi BufferLineTabSelected guifg=#91cef5 guibg=NONE
hi BufferLineTabClose guifg=#8b9298 guibg=NONE
hi BufferLineDuplicate guifg=#8b9298 guibg=NONE
hi BufferLineDuplicateSelected guifg=#dfe3e7 guibg=NONE
hi BufferLineDuplicateVisible guifg=#8b9298 guibg=NONE
hi BufferLineCloseButton guifg=#8b9298 guibg=NONE
hi BufferLineCloseButtonSelected guifg=#ffb4ab guibg=NONE
hi BufferLineCloseButtonVisible guifg=#8b9298 guibg=NONE
hi TabLineFill guibg=NONE

