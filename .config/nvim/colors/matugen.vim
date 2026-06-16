" matugen neovim colorscheme
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='matugen'

hi Normal guifg=#e4e1e9 guibg=NONE
hi Comment guifg=#918f9a gui=italic
hi String guifg=#e9b9d3
hi Keyword guifg=#c1c1ff
hi Function guifg=#c6c4dd
hi Type guifg=#e9b9d3
hi Constant guifg=#c1c1ff
hi Statement guifg=#c1c1ff
hi Identifier guifg=#c6c4dd
hi PreProc guifg=#e9b9d3
hi Special guifg=#ffb4ab
hi LineNr guifg=#918f9a guibg=NONE
hi CursorLineNr guifg=#c1c1ff guibg=NONE
hi CursorLine guibg=#1f1f25
hi Visual guibg=#404178
hi Pmenu guifg=#e4e1e9 guibg=#1f1f25
hi PmenuSel guifg=#292a60 guibg=#c1c1ff
hi StatusLine guifg=#e4e1e9 guibg=NONE
hi Search guifg=#292a60 guibg=#c1c1ff
hi SignColumn guibg=NONE
hi DiagnosticError guifg=#ffb4ab
hi DiagnosticWarn guifg=#e9b9d3
hi DiagnosticInfo guifg=#c1c1ff
hi DiagnosticHint guifg=#c6c4dd

" Neo-tree
hi NeoTreeNormal guifg=#e4e1e9 guibg=NONE
hi NeoTreeNormalNC guifg=#e4e1e9 guibg=NONE
hi NeoTreeEndOfBuffer guifg=#131318 guibg=NONE
hi NeoTreeDirectoryName guifg=#c1c1ff
hi NeoTreeDirectoryIcon guifg=#c1c1ff
hi NeoTreeFileName guifg=#e4e1e9
hi NeoTreeFileIcon guifg=#e4e1e9
hi NeoTreeRootName guifg=#c1c1ff gui=bold
hi NeoTreeGitModified guifg=#e9b9d3
hi NeoTreeGitAdded guifg=#c6c4dd
hi NeoTreeGitDeleted guifg=#ffb4ab
hi NeoTreeGitUntracked guifg=#918f9a
hi NeoTreeIndentMarker guifg=#918f9a
hi NeoTreeCursorLine guibg=#1f1f25
hi NeoTreeTitleBar guifg=#292a60 guibg=#c1c1ff
hi NeoTreeFloatBorder guifg=#918f9a guibg=NONE
hi NeoTreeWinSeparator guifg=#918f9a guibg=NONE

" Floating windows & borders
hi NormalFloat guifg=#e4e1e9 guibg=NONE
hi FloatBorder guifg=#918f9a guibg=NONE
hi FloatTitle guifg=#c1c1ff guibg=NONE

" Telescope
hi TelescopeNormal guifg=#e4e1e9 guibg=NONE
hi TelescopeBorder guifg=#918f9a guibg=NONE
hi TelescopeTitle guifg=#c1c1ff
hi TelescopePromptNormal guifg=#e4e1e9 guibg=NONE
hi TelescopePromptBorder guifg=#918f9a guibg=NONE
hi TelescopePromptTitle guifg=#292a60 guibg=#c1c1ff
hi TelescopeResultsNormal guifg=#e4e1e9 guibg=NONE
hi TelescopeResultsBorder guifg=#918f9a guibg=NONE
hi TelescopePreviewNormal guifg=#e4e1e9 guibg=NONE
hi TelescopePreviewBorder guifg=#918f9a guibg=NONE
hi TelescopeSelection guibg=#2a292f
hi TelescopeMatching guifg=#c1c1ff gui=bold

" Lazy plugin manager
hi LazyNormal guifg=#e4e1e9 guibg=NONE
hi LazyButton guifg=#e4e1e9 guibg=#2a292f
hi LazyButtonActive guifg=#292a60 guibg=#c1c1ff
hi LazyH1 guifg=#292a60 guibg=#c1c1ff
hi LazyH2 guifg=#c1c1ff gui=bold
hi LazySpecial guifg=#c6c4dd
hi LazyCommit guifg=#918f9a

" WhichKey
hi WhichKey guifg=#c1c1ff
hi WhichKeyGroup guifg=#c6c4dd
hi WhichKeyDesc guifg=#e4e1e9
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guifg=#918f9a guibg=NONE

" Notifications (noice/notify)
hi NotifyINFOBody guifg=#e4e1e9 guibg=NONE
hi NotifyINFOBorder guifg=#c1c1ff guibg=NONE
hi NotifyINFOTitle guifg=#c1c1ff
hi NotifyWARNBody guifg=#e4e1e9 guibg=NONE
hi NotifyWARNBorder guifg=#e9b9d3 guibg=NONE
hi NotifyWARNTitle guifg=#e9b9d3
hi NotifyERRORBody guifg=#e4e1e9 guibg=NONE
hi NotifyERRORBorder guifg=#ffb4ab guibg=NONE
hi NotifyERRORTitle guifg=#ffb4ab

" Indent guides
hi IblIndent guifg=#2a292f
hi IblScope guifg=#c1c1ff

" Bufferline (tabs)
hi BufferLineBackground guifg=#918f9a guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineBufferSelected guifg=#e4e1e9 guibg=NONE gui=bold
hi BufferLineBufferVisible guifg=#918f9a guibg=NONE
hi BufferLineSeparator guifg=#131318 guibg=NONE
hi BufferLineSeparatorSelected guifg=#c1c1ff guibg=NONE
hi BufferLineSeparatorVisible guifg=#131318 guibg=NONE
hi BufferLineIndicatorSelected guifg=#c1c1ff guibg=NONE
hi BufferLineModified guifg=#e9b9d3 guibg=NONE
hi BufferLineModifiedSelected guifg=#e9b9d3 guibg=NONE
hi BufferLineModifiedVisible guifg=#e9b9d3 guibg=NONE
hi BufferLineTab guifg=#918f9a guibg=NONE
hi BufferLineTabSelected guifg=#c1c1ff guibg=NONE
hi BufferLineTabClose guifg=#918f9a guibg=NONE
hi BufferLineDuplicate guifg=#918f9a guibg=NONE
hi BufferLineDuplicateSelected guifg=#e4e1e9 guibg=NONE
hi BufferLineDuplicateVisible guifg=#918f9a guibg=NONE
hi BufferLineCloseButton guifg=#918f9a guibg=NONE
hi BufferLineCloseButtonSelected guifg=#ffb4ab guibg=NONE
hi BufferLineCloseButtonVisible guifg=#918f9a guibg=NONE
hi TabLineFill guibg=NONE

