" matugen neovim colorscheme
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='matugen'

hi Normal guifg=#e1e2e9 guibg=NONE
hi Comment guifg=#8e9199 gui=italic
hi String guifg=#dbbce1
hi Keyword guifg=#a8c8ff
hi Function guifg=#bdc7dc
hi Type guifg=#dbbce1
hi Constant guifg=#a8c8ff
hi Statement guifg=#a8c8ff
hi Identifier guifg=#bdc7dc
hi PreProc guifg=#dbbce1
hi Special guifg=#ffb4ab
hi LineNr guifg=#8e9199 guibg=NONE
hi CursorLineNr guifg=#a8c8ff guibg=NONE
hi CursorLine guibg=#1d2024
hi Visual guibg=#254777
hi Pmenu guifg=#e1e2e9 guibg=#1d2024
hi PmenuSel guifg=#05305f guibg=#a8c8ff
hi StatusLine guifg=#e1e2e9 guibg=NONE
hi Search guifg=#05305f guibg=#a8c8ff
hi SignColumn guibg=NONE
hi DiagnosticError guifg=#ffb4ab
hi DiagnosticWarn guifg=#dbbce1
hi DiagnosticInfo guifg=#a8c8ff
hi DiagnosticHint guifg=#bdc7dc

" Neo-tree
hi NeoTreeNormal guifg=#e1e2e9 guibg=NONE
hi NeoTreeNormalNC guifg=#e1e2e9 guibg=NONE
hi NeoTreeEndOfBuffer guifg=#111318 guibg=NONE
hi NeoTreeDirectoryName guifg=#a8c8ff
hi NeoTreeDirectoryIcon guifg=#a8c8ff
hi NeoTreeFileName guifg=#e1e2e9
hi NeoTreeFileIcon guifg=#e1e2e9
hi NeoTreeRootName guifg=#a8c8ff gui=bold
hi NeoTreeGitModified guifg=#dbbce1
hi NeoTreeGitAdded guifg=#bdc7dc
hi NeoTreeGitDeleted guifg=#ffb4ab
hi NeoTreeGitUntracked guifg=#8e9199
hi NeoTreeIndentMarker guifg=#8e9199
hi NeoTreeCursorLine guibg=#1d2024
hi NeoTreeTitleBar guifg=#05305f guibg=#a8c8ff
hi NeoTreeFloatBorder guifg=#8e9199 guibg=NONE
hi NeoTreeWinSeparator guifg=#8e9199 guibg=NONE

" Floating windows & borders
hi NormalFloat guifg=#e1e2e9 guibg=NONE
hi FloatBorder guifg=#8e9199 guibg=NONE
hi FloatTitle guifg=#a8c8ff guibg=NONE

" Telescope
hi TelescopeNormal guifg=#e1e2e9 guibg=NONE
hi TelescopeBorder guifg=#8e9199 guibg=NONE
hi TelescopeTitle guifg=#a8c8ff
hi TelescopePromptNormal guifg=#e1e2e9 guibg=NONE
hi TelescopePromptBorder guifg=#8e9199 guibg=NONE
hi TelescopePromptTitle guifg=#05305f guibg=#a8c8ff
hi TelescopeResultsNormal guifg=#e1e2e9 guibg=NONE
hi TelescopeResultsBorder guifg=#8e9199 guibg=NONE
hi TelescopePreviewNormal guifg=#e1e2e9 guibg=NONE
hi TelescopePreviewBorder guifg=#8e9199 guibg=NONE
hi TelescopeSelection guibg=#282a2f
hi TelescopeMatching guifg=#a8c8ff gui=bold

" Lazy plugin manager
hi LazyNormal guifg=#e1e2e9 guibg=NONE
hi LazyButton guifg=#e1e2e9 guibg=#282a2f
hi LazyButtonActive guifg=#05305f guibg=#a8c8ff
hi LazyH1 guifg=#05305f guibg=#a8c8ff
hi LazyH2 guifg=#a8c8ff gui=bold
hi LazySpecial guifg=#bdc7dc
hi LazyCommit guifg=#8e9199

" WhichKey
hi WhichKey guifg=#a8c8ff
hi WhichKeyGroup guifg=#bdc7dc
hi WhichKeyDesc guifg=#e1e2e9
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guifg=#8e9199 guibg=NONE

" Notifications (noice/notify)
hi NotifyINFOBody guifg=#e1e2e9 guibg=NONE
hi NotifyINFOBorder guifg=#a8c8ff guibg=NONE
hi NotifyINFOTitle guifg=#a8c8ff
hi NotifyWARNBody guifg=#e1e2e9 guibg=NONE
hi NotifyWARNBorder guifg=#dbbce1 guibg=NONE
hi NotifyWARNTitle guifg=#dbbce1
hi NotifyERRORBody guifg=#e1e2e9 guibg=NONE
hi NotifyERRORBorder guifg=#ffb4ab guibg=NONE
hi NotifyERRORTitle guifg=#ffb4ab

" Indent guides
hi IblIndent guifg=#282a2f
hi IblScope guifg=#a8c8ff

" Bufferline (tabs)
hi BufferLineBackground guifg=#8e9199 guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineBufferSelected guifg=#e1e2e9 guibg=NONE gui=bold
hi BufferLineBufferVisible guifg=#8e9199 guibg=NONE
hi BufferLineSeparator guifg=#111318 guibg=NONE
hi BufferLineSeparatorSelected guifg=#a8c8ff guibg=NONE
hi BufferLineSeparatorVisible guifg=#111318 guibg=NONE
hi BufferLineIndicatorSelected guifg=#a8c8ff guibg=NONE
hi BufferLineModified guifg=#dbbce1 guibg=NONE
hi BufferLineModifiedSelected guifg=#dbbce1 guibg=NONE
hi BufferLineModifiedVisible guifg=#dbbce1 guibg=NONE
hi BufferLineTab guifg=#8e9199 guibg=NONE
hi BufferLineTabSelected guifg=#a8c8ff guibg=NONE
hi BufferLineTabClose guifg=#8e9199 guibg=NONE
hi BufferLineDuplicate guifg=#8e9199 guibg=NONE
hi BufferLineDuplicateSelected guifg=#e1e2e9 guibg=NONE
hi BufferLineDuplicateVisible guifg=#8e9199 guibg=NONE
hi BufferLineCloseButton guifg=#8e9199 guibg=NONE
hi BufferLineCloseButtonSelected guifg=#ffb4ab guibg=NONE
hi BufferLineCloseButtonVisible guifg=#8e9199 guibg=NONE
hi TabLineFill guibg=NONE

