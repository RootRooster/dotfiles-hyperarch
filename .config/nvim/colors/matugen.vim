" matugen neovim colorscheme
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='matugen'

hi Normal guifg=#e6e1e9 guibg=NONE
hi Comment guifg=#948f99 gui=italic
hi String guifg=#efb8c8
hi Keyword guifg=#cfbdfe
hi Function guifg=#cbc2dc
hi Type guifg=#efb8c8
hi Constant guifg=#cfbdfe
hi Statement guifg=#cfbdfe
hi Identifier guifg=#cbc2dc
hi PreProc guifg=#efb8c8
hi Special guifg=#ffb4ab
hi LineNr guifg=#948f99 guibg=NONE
hi CursorLineNr guifg=#cfbdfe guibg=NONE
hi CursorLine guibg=#211f24
hi Visual guibg=#4c3e75
hi Pmenu guifg=#e6e1e9 guibg=#211f24
hi PmenuSel guifg=#35275d guibg=#cfbdfe
hi StatusLine guifg=#e6e1e9 guibg=NONE
hi Search guifg=#35275d guibg=#cfbdfe
hi SignColumn guibg=NONE
hi DiagnosticError guifg=#ffb4ab
hi DiagnosticWarn guifg=#efb8c8
hi DiagnosticInfo guifg=#cfbdfe
hi DiagnosticHint guifg=#cbc2dc

" Neo-tree
hi NeoTreeNormal guifg=#e6e1e9 guibg=NONE
hi NeoTreeNormalNC guifg=#e6e1e9 guibg=NONE
hi NeoTreeEndOfBuffer guifg=#141218 guibg=NONE
hi NeoTreeDirectoryName guifg=#cfbdfe
hi NeoTreeDirectoryIcon guifg=#cfbdfe
hi NeoTreeFileName guifg=#e6e1e9
hi NeoTreeFileIcon guifg=#e6e1e9
hi NeoTreeRootName guifg=#cfbdfe gui=bold
hi NeoTreeGitModified guifg=#efb8c8
hi NeoTreeGitAdded guifg=#cbc2dc
hi NeoTreeGitDeleted guifg=#ffb4ab
hi NeoTreeGitUntracked guifg=#948f99
hi NeoTreeIndentMarker guifg=#948f99
hi NeoTreeCursorLine guibg=#211f24
hi NeoTreeTitleBar guifg=#35275d guibg=#cfbdfe
hi NeoTreeFloatBorder guifg=#948f99 guibg=NONE
hi NeoTreeWinSeparator guifg=#948f99 guibg=NONE

" Floating windows & borders
hi NormalFloat guifg=#e6e1e9 guibg=NONE
hi FloatBorder guifg=#948f99 guibg=NONE
hi FloatTitle guifg=#cfbdfe guibg=NONE

" Telescope
hi TelescopeNormal guifg=#e6e1e9 guibg=NONE
hi TelescopeBorder guifg=#948f99 guibg=NONE
hi TelescopeTitle guifg=#cfbdfe
hi TelescopePromptNormal guifg=#e6e1e9 guibg=NONE
hi TelescopePromptBorder guifg=#948f99 guibg=NONE
hi TelescopePromptTitle guifg=#35275d guibg=#cfbdfe
hi TelescopeResultsNormal guifg=#e6e1e9 guibg=NONE
hi TelescopeResultsBorder guifg=#948f99 guibg=NONE
hi TelescopePreviewNormal guifg=#e6e1e9 guibg=NONE
hi TelescopePreviewBorder guifg=#948f99 guibg=NONE
hi TelescopeSelection guibg=#2b292f
hi TelescopeMatching guifg=#cfbdfe gui=bold

" Lazy plugin manager
hi LazyNormal guifg=#e6e1e9 guibg=NONE
hi LazyButton guifg=#e6e1e9 guibg=#2b292f
hi LazyButtonActive guifg=#35275d guibg=#cfbdfe
hi LazyH1 guifg=#35275d guibg=#cfbdfe
hi LazyH2 guifg=#cfbdfe gui=bold
hi LazySpecial guifg=#cbc2dc
hi LazyCommit guifg=#948f99

" WhichKey
hi WhichKey guifg=#cfbdfe
hi WhichKeyGroup guifg=#cbc2dc
hi WhichKeyDesc guifg=#e6e1e9
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guifg=#948f99 guibg=NONE

" Notifications (noice/notify)
hi NotifyINFOBody guifg=#e6e1e9 guibg=NONE
hi NotifyINFOBorder guifg=#cfbdfe guibg=NONE
hi NotifyINFOTitle guifg=#cfbdfe
hi NotifyWARNBody guifg=#e6e1e9 guibg=NONE
hi NotifyWARNBorder guifg=#efb8c8 guibg=NONE
hi NotifyWARNTitle guifg=#efb8c8
hi NotifyERRORBody guifg=#e6e1e9 guibg=NONE
hi NotifyERRORBorder guifg=#ffb4ab guibg=NONE
hi NotifyERRORTitle guifg=#ffb4ab

" Indent guides
hi IblIndent guifg=#2b292f
hi IblScope guifg=#cfbdfe

" Bufferline (tabs)
hi BufferLineBackground guifg=#948f99 guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineBufferSelected guifg=#e6e1e9 guibg=NONE gui=bold
hi BufferLineBufferVisible guifg=#948f99 guibg=NONE
hi BufferLineSeparator guifg=#141218 guibg=NONE
hi BufferLineSeparatorSelected guifg=#cfbdfe guibg=NONE
hi BufferLineSeparatorVisible guifg=#141218 guibg=NONE
hi BufferLineIndicatorSelected guifg=#cfbdfe guibg=NONE
hi BufferLineModified guifg=#efb8c8 guibg=NONE
hi BufferLineModifiedSelected guifg=#efb8c8 guibg=NONE
hi BufferLineModifiedVisible guifg=#efb8c8 guibg=NONE
hi BufferLineTab guifg=#948f99 guibg=NONE
hi BufferLineTabSelected guifg=#cfbdfe guibg=NONE
hi BufferLineTabClose guifg=#948f99 guibg=NONE
hi BufferLineDuplicate guifg=#948f99 guibg=NONE
hi BufferLineDuplicateSelected guifg=#e6e1e9 guibg=NONE
hi BufferLineDuplicateVisible guifg=#948f99 guibg=NONE
hi BufferLineCloseButton guifg=#948f99 guibg=NONE
hi BufferLineCloseButtonSelected guifg=#ffb4ab guibg=NONE
hi BufferLineCloseButtonVisible guifg=#948f99 guibg=NONE
hi TabLineFill guibg=NONE

