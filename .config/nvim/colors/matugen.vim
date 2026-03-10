" matugen neovim colorscheme
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='matugen'

hi Normal guifg=#dfe3e7 guibg=NONE
hi Comment guifg=#8b9198 gui=italic
hi String guifg=#cdc0e9
hi Keyword guifg=#93cdf6
hi Function guifg=#b7c9d8
hi Type guifg=#cdc0e9
hi Constant guifg=#93cdf6
hi Statement guifg=#93cdf6
hi Identifier guifg=#b7c9d8
hi PreProc guifg=#cdc0e9
hi Special guifg=#ffb4ab
hi LineNr guifg=#8b9198 guibg=NONE
hi CursorLineNr guifg=#93cdf6 guibg=NONE
hi CursorLine guibg=#1c2024
hi Visual guibg=#004c6d
hi Pmenu guifg=#dfe3e7 guibg=#1c2024
hi PmenuSel guifg=#00344c guibg=#93cdf6
hi StatusLine guifg=#dfe3e7 guibg=NONE
hi Search guifg=#00344c guibg=#93cdf6
hi SignColumn guibg=NONE
hi DiagnosticError guifg=#ffb4ab
hi DiagnosticWarn guifg=#cdc0e9
hi DiagnosticInfo guifg=#93cdf6
hi DiagnosticHint guifg=#b7c9d8

" Neo-tree
hi NeoTreeNormal guifg=#dfe3e7 guibg=NONE
hi NeoTreeNormalNC guifg=#dfe3e7 guibg=NONE
hi NeoTreeEndOfBuffer guifg=#101417 guibg=NONE
hi NeoTreeDirectoryName guifg=#93cdf6
hi NeoTreeDirectoryIcon guifg=#93cdf6
hi NeoTreeFileName guifg=#dfe3e7
hi NeoTreeFileIcon guifg=#dfe3e7
hi NeoTreeRootName guifg=#93cdf6 gui=bold
hi NeoTreeGitModified guifg=#cdc0e9
hi NeoTreeGitAdded guifg=#b7c9d8
hi NeoTreeGitDeleted guifg=#ffb4ab
hi NeoTreeGitUntracked guifg=#8b9198
hi NeoTreeIndentMarker guifg=#8b9198
hi NeoTreeCursorLine guibg=#1c2024
hi NeoTreeTitleBar guifg=#00344c guibg=#93cdf6
hi NeoTreeFloatBorder guifg=#8b9198 guibg=NONE
hi NeoTreeWinSeparator guifg=#8b9198 guibg=NONE

" Floating windows & borders
hi NormalFloat guifg=#dfe3e7 guibg=NONE
hi FloatBorder guifg=#8b9198 guibg=NONE
hi FloatTitle guifg=#93cdf6 guibg=NONE

" Telescope
hi TelescopeNormal guifg=#dfe3e7 guibg=NONE
hi TelescopeBorder guifg=#8b9198 guibg=NONE
hi TelescopeTitle guifg=#93cdf6
hi TelescopePromptNormal guifg=#dfe3e7 guibg=NONE
hi TelescopePromptBorder guifg=#8b9198 guibg=NONE
hi TelescopePromptTitle guifg=#00344c guibg=#93cdf6
hi TelescopeResultsNormal guifg=#dfe3e7 guibg=NONE
hi TelescopeResultsBorder guifg=#8b9198 guibg=NONE
hi TelescopePreviewNormal guifg=#dfe3e7 guibg=NONE
hi TelescopePreviewBorder guifg=#8b9198 guibg=NONE
hi TelescopeSelection guibg=#262a2e
hi TelescopeMatching guifg=#93cdf6 gui=bold

" Lazy plugin manager
hi LazyNormal guifg=#dfe3e7 guibg=NONE
hi LazyButton guifg=#dfe3e7 guibg=#262a2e
hi LazyButtonActive guifg=#00344c guibg=#93cdf6
hi LazyH1 guifg=#00344c guibg=#93cdf6
hi LazyH2 guifg=#93cdf6 gui=bold
hi LazySpecial guifg=#b7c9d8
hi LazyCommit guifg=#8b9198

" WhichKey
hi WhichKey guifg=#93cdf6
hi WhichKeyGroup guifg=#b7c9d8
hi WhichKeyDesc guifg=#dfe3e7
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guifg=#8b9198 guibg=NONE

" Notifications (noice/notify)
hi NotifyINFOBody guifg=#dfe3e7 guibg=NONE
hi NotifyINFOBorder guifg=#93cdf6 guibg=NONE
hi NotifyINFOTitle guifg=#93cdf6
hi NotifyWARNBody guifg=#dfe3e7 guibg=NONE
hi NotifyWARNBorder guifg=#cdc0e9 guibg=NONE
hi NotifyWARNTitle guifg=#cdc0e9
hi NotifyERRORBody guifg=#dfe3e7 guibg=NONE
hi NotifyERRORBorder guifg=#ffb4ab guibg=NONE
hi NotifyERRORTitle guifg=#ffb4ab

" Indent guides
hi IblIndent guifg=#262a2e
hi IblScope guifg=#93cdf6

" Bufferline (tabs)
hi BufferLineBackground guifg=#8b9198 guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineBufferSelected guifg=#dfe3e7 guibg=NONE gui=bold
hi BufferLineBufferVisible guifg=#8b9198 guibg=NONE
hi BufferLineSeparator guifg=#101417 guibg=NONE
hi BufferLineSeparatorSelected guifg=#93cdf6 guibg=NONE
hi BufferLineSeparatorVisible guifg=#101417 guibg=NONE
hi BufferLineIndicatorSelected guifg=#93cdf6 guibg=NONE
hi BufferLineModified guifg=#cdc0e9 guibg=NONE
hi BufferLineModifiedSelected guifg=#cdc0e9 guibg=NONE
hi BufferLineModifiedVisible guifg=#cdc0e9 guibg=NONE
hi BufferLineTab guifg=#8b9198 guibg=NONE
hi BufferLineTabSelected guifg=#93cdf6 guibg=NONE
hi BufferLineTabClose guifg=#8b9198 guibg=NONE
hi BufferLineDuplicate guifg=#8b9198 guibg=NONE
hi BufferLineDuplicateSelected guifg=#dfe3e7 guibg=NONE
hi BufferLineDuplicateVisible guifg=#8b9198 guibg=NONE
hi BufferLineCloseButton guifg=#8b9198 guibg=NONE
hi BufferLineCloseButtonSelected guifg=#ffb4ab guibg=NONE
hi BufferLineCloseButtonVisible guifg=#8b9198 guibg=NONE
hi TabLineFill guibg=NONE

