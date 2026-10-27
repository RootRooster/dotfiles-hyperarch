" matugen neovim colorscheme
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='matugen'

hi Normal guifg=#e4e1e9 guibg=NONE
hi Comment guifg=#90909a gui=italic
hi String guifg=#e6bad6
hi Keyword guifg=#bcc2ff
hi Function guifg=#c4c5dd
hi Type guifg=#e6bad6
hi Constant guifg=#bcc2ff
hi Statement guifg=#bcc2ff
hi Identifier guifg=#c4c5dd
hi PreProc guifg=#e6bad6
hi Special guifg=#ffb4ab
hi LineNr guifg=#90909a guibg=NONE
hi CursorLineNr guifg=#bcc2ff guibg=NONE
hi CursorLine guibg=#1f1f25
hi Visual guibg=#3b4279
hi Pmenu guifg=#e4e1e9 guibg=#1f1f25
hi PmenuSel guifg=#242b61 guibg=#bcc2ff
hi StatusLine guifg=#e4e1e9 guibg=NONE
hi Search guifg=#242b61 guibg=#bcc2ff
hi SignColumn guibg=NONE
hi DiagnosticError guifg=#ffb4ab
hi DiagnosticWarn guifg=#e6bad6
hi DiagnosticInfo guifg=#bcc2ff
hi DiagnosticHint guifg=#c4c5dd

" Neo-tree
hi NeoTreeNormal guifg=#e4e1e9 guibg=NONE
hi NeoTreeNormalNC guifg=#e4e1e9 guibg=NONE
hi NeoTreeEndOfBuffer guifg=#131318 guibg=NONE
hi NeoTreeDirectoryName guifg=#bcc2ff
hi NeoTreeDirectoryIcon guifg=#bcc2ff
hi NeoTreeFileName guifg=#e4e1e9
hi NeoTreeFileIcon guifg=#e4e1e9
hi NeoTreeRootName guifg=#bcc2ff gui=bold
hi NeoTreeGitModified guifg=#e6bad6
hi NeoTreeGitAdded guifg=#c4c5dd
hi NeoTreeGitDeleted guifg=#ffb4ab
hi NeoTreeGitUntracked guifg=#90909a
hi NeoTreeIndentMarker guifg=#90909a
hi NeoTreeCursorLine guibg=#1f1f25
hi NeoTreeTitleBar guifg=#242b61 guibg=#bcc2ff
hi NeoTreeFloatBorder guifg=#90909a guibg=NONE
hi NeoTreeWinSeparator guifg=#90909a guibg=NONE

" Floating windows & borders
hi NormalFloat guifg=#e4e1e9 guibg=NONE
hi FloatBorder guifg=#90909a guibg=NONE
hi FloatTitle guifg=#bcc2ff guibg=NONE

" Telescope
hi TelescopeNormal guifg=#e4e1e9 guibg=NONE
hi TelescopeBorder guifg=#90909a guibg=NONE
hi TelescopeTitle guifg=#bcc2ff
hi TelescopePromptNormal guifg=#e4e1e9 guibg=NONE
hi TelescopePromptBorder guifg=#90909a guibg=NONE
hi TelescopePromptTitle guifg=#242b61 guibg=#bcc2ff
hi TelescopeResultsNormal guifg=#e4e1e9 guibg=NONE
hi TelescopeResultsBorder guifg=#90909a guibg=NONE
hi TelescopePreviewNormal guifg=#e4e1e9 guibg=NONE
hi TelescopePreviewBorder guifg=#90909a guibg=NONE
hi TelescopeSelection guibg=#29292f
hi TelescopeMatching guifg=#bcc2ff gui=bold

" Lazy plugin manager
hi LazyNormal guifg=#e4e1e9 guibg=NONE
hi LazyButton guifg=#e4e1e9 guibg=#29292f
hi LazyButtonActive guifg=#242b61 guibg=#bcc2ff
hi LazyH1 guifg=#242b61 guibg=#bcc2ff
hi LazyH2 guifg=#bcc2ff gui=bold
hi LazySpecial guifg=#c4c5dd
hi LazyCommit guifg=#90909a

" WhichKey
hi WhichKey guifg=#bcc2ff
hi WhichKeyGroup guifg=#c4c5dd
hi WhichKeyDesc guifg=#e4e1e9
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guifg=#90909a guibg=NONE

" Notifications (noice/notify)
hi NotifyINFOBody guifg=#e4e1e9 guibg=NONE
hi NotifyINFOBorder guifg=#bcc2ff guibg=NONE
hi NotifyINFOTitle guifg=#bcc2ff
hi NotifyWARNBody guifg=#e4e1e9 guibg=NONE
hi NotifyWARNBorder guifg=#e6bad6 guibg=NONE
hi NotifyWARNTitle guifg=#e6bad6
hi NotifyERRORBody guifg=#e4e1e9 guibg=NONE
hi NotifyERRORBorder guifg=#ffb4ab guibg=NONE
hi NotifyERRORTitle guifg=#ffb4ab

" Indent guides
hi IblIndent guifg=#29292f
hi IblScope guifg=#bcc2ff

" Bufferline (tabs)
hi BufferLineBackground guifg=#90909a guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineBufferSelected guifg=#e4e1e9 guibg=NONE gui=bold
hi BufferLineBufferVisible guifg=#90909a guibg=NONE
hi BufferLineSeparator guifg=#131318 guibg=NONE
hi BufferLineSeparatorSelected guifg=#bcc2ff guibg=NONE
hi BufferLineSeparatorVisible guifg=#131318 guibg=NONE
hi BufferLineIndicatorSelected guifg=#bcc2ff guibg=NONE
hi BufferLineModified guifg=#e6bad6 guibg=NONE
hi BufferLineModifiedSelected guifg=#e6bad6 guibg=NONE
hi BufferLineModifiedVisible guifg=#e6bad6 guibg=NONE
hi BufferLineTab guifg=#90909a guibg=NONE
hi BufferLineTabSelected guifg=#bcc2ff guibg=NONE
hi BufferLineTabClose guifg=#90909a guibg=NONE
hi BufferLineDuplicate guifg=#90909a guibg=NONE
hi BufferLineDuplicateSelected guifg=#e4e1e9 guibg=NONE
hi BufferLineDuplicateVisible guifg=#90909a guibg=NONE
hi BufferLineCloseButton guifg=#90909a guibg=NONE
hi BufferLineCloseButtonSelected guifg=#ffb4ab guibg=NONE
hi BufferLineCloseButtonVisible guifg=#90909a guibg=NONE
hi TabLineFill guibg=NONE

