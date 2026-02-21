" matugen neovim colorscheme
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='matugen'

hi Normal guifg=#e0e2e8 guibg=NONE
hi Comment guifg=#8c9198 gui=italic
hi String guifg=#d3bfe6
hi Keyword guifg=#9bcbfb
hi Function guifg=#b9c8da
hi Type guifg=#d3bfe6
hi Constant guifg=#9bcbfb
hi Statement guifg=#9bcbfb
hi Identifier guifg=#b9c8da
hi PreProc guifg=#d3bfe6
hi Special guifg=#ffb4ab
hi LineNr guifg=#8c9198 guibg=NONE
hi CursorLineNr guifg=#9bcbfb guibg=NONE
hi CursorLine guibg=#1c2024
hi Visual guibg=#0f4a73
hi Pmenu guifg=#e0e2e8 guibg=#1c2024
hi PmenuSel guifg=#003353 guibg=#9bcbfb
hi StatusLine guifg=#e0e2e8 guibg=NONE
hi Search guifg=#003353 guibg=#9bcbfb
hi SignColumn guibg=NONE
hi DiagnosticError guifg=#ffb4ab
hi DiagnosticWarn guifg=#d3bfe6
hi DiagnosticInfo guifg=#9bcbfb
hi DiagnosticHint guifg=#b9c8da

" Neo-tree
hi NeoTreeNormal guifg=#e0e2e8 guibg=NONE
hi NeoTreeNormalNC guifg=#e0e2e8 guibg=NONE
hi NeoTreeEndOfBuffer guifg=#101418 guibg=NONE
hi NeoTreeDirectoryName guifg=#9bcbfb
hi NeoTreeDirectoryIcon guifg=#9bcbfb
hi NeoTreeFileName guifg=#e0e2e8
hi NeoTreeFileIcon guifg=#e0e2e8
hi NeoTreeRootName guifg=#9bcbfb gui=bold
hi NeoTreeGitModified guifg=#d3bfe6
hi NeoTreeGitAdded guifg=#b9c8da
hi NeoTreeGitDeleted guifg=#ffb4ab
hi NeoTreeGitUntracked guifg=#8c9198
hi NeoTreeIndentMarker guifg=#8c9198
hi NeoTreeCursorLine guibg=#1c2024
hi NeoTreeTitleBar guifg=#003353 guibg=#9bcbfb
hi NeoTreeFloatBorder guifg=#8c9198 guibg=NONE
hi NeoTreeWinSeparator guifg=#8c9198 guibg=NONE

" Floating windows & borders
hi NormalFloat guifg=#e0e2e8 guibg=NONE
hi FloatBorder guifg=#8c9198 guibg=NONE
hi FloatTitle guifg=#9bcbfb guibg=NONE

" Telescope
hi TelescopeNormal guifg=#e0e2e8 guibg=NONE
hi TelescopeBorder guifg=#8c9198 guibg=NONE
hi TelescopeTitle guifg=#9bcbfb
hi TelescopePromptNormal guifg=#e0e2e8 guibg=NONE
hi TelescopePromptBorder guifg=#8c9198 guibg=NONE
hi TelescopePromptTitle guifg=#003353 guibg=#9bcbfb
hi TelescopeResultsNormal guifg=#e0e2e8 guibg=NONE
hi TelescopeResultsBorder guifg=#8c9198 guibg=NONE
hi TelescopePreviewNormal guifg=#e0e2e8 guibg=NONE
hi TelescopePreviewBorder guifg=#8c9198 guibg=NONE
hi TelescopeSelection guibg=#272a2f
hi TelescopeMatching guifg=#9bcbfb gui=bold

" Lazy plugin manager
hi LazyNormal guifg=#e0e2e8 guibg=NONE
hi LazyButton guifg=#e0e2e8 guibg=#272a2f
hi LazyButtonActive guifg=#003353 guibg=#9bcbfb
hi LazyH1 guifg=#003353 guibg=#9bcbfb
hi LazyH2 guifg=#9bcbfb gui=bold
hi LazySpecial guifg=#b9c8da
hi LazyCommit guifg=#8c9198

" WhichKey
hi WhichKey guifg=#9bcbfb
hi WhichKeyGroup guifg=#b9c8da
hi WhichKeyDesc guifg=#e0e2e8
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guifg=#8c9198 guibg=NONE

" Notifications (noice/notify)
hi NotifyINFOBody guifg=#e0e2e8 guibg=NONE
hi NotifyINFOBorder guifg=#9bcbfb guibg=NONE
hi NotifyINFOTitle guifg=#9bcbfb
hi NotifyWARNBody guifg=#e0e2e8 guibg=NONE
hi NotifyWARNBorder guifg=#d3bfe6 guibg=NONE
hi NotifyWARNTitle guifg=#d3bfe6
hi NotifyERRORBody guifg=#e0e2e8 guibg=NONE
hi NotifyERRORBorder guifg=#ffb4ab guibg=NONE
hi NotifyERRORTitle guifg=#ffb4ab

" Indent guides
hi IblIndent guifg=#272a2f
hi IblScope guifg=#9bcbfb

" Bufferline (tabs)
hi BufferLineBackground guifg=#8c9198 guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineBufferSelected guifg=#e0e2e8 guibg=#1c2024 gui=bold
