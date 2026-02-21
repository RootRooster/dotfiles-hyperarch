" matugen neovim colorscheme
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='matugen'

hi Normal guifg={{colors.on_surface.default.hex}} guibg=NONE
hi Comment guifg={{colors.outline.default.hex}} gui=italic
hi String guifg={{colors.tertiary.default.hex}}
hi Keyword guifg={{colors.primary.default.hex}}
hi Function guifg={{colors.secondary.default.hex}}
hi Type guifg={{colors.tertiary.default.hex}}
hi Constant guifg={{colors.primary.default.hex}}
hi Statement guifg={{colors.primary.default.hex}}
hi Identifier guifg={{colors.secondary.default.hex}}
hi PreProc guifg={{colors.tertiary.default.hex}}
hi Special guifg={{colors.error.default.hex}}
hi LineNr guifg={{colors.outline.default.hex}} guibg=NONE
hi CursorLineNr guifg={{colors.primary.default.hex}} guibg=NONE
hi CursorLine guibg={{colors.surface_container.default.hex}}
hi Visual guibg={{colors.primary_container.default.hex}}
hi Pmenu guifg={{colors.on_surface.default.hex}} guibg={{colors.surface_container.default.hex}}
hi PmenuSel guifg={{colors.on_primary.default.hex}} guibg={{colors.primary.default.hex}}
hi StatusLine guifg={{colors.on_surface.default.hex}} guibg=NONE
hi Search guifg={{colors.on_primary.default.hex}} guibg={{colors.primary.default.hex}}
hi SignColumn guibg=NONE
hi DiagnosticError guifg={{colors.error.default.hex}}
hi DiagnosticWarn guifg={{colors.tertiary.default.hex}}
hi DiagnosticInfo guifg={{colors.primary.default.hex}}
hi DiagnosticHint guifg={{colors.secondary.default.hex}}

" Neo-tree
hi NeoTreeNormal guifg={{colors.on_surface.default.hex}} guibg=NONE
hi NeoTreeNormalNC guifg={{colors.on_surface.default.hex}} guibg=NONE
hi NeoTreeEndOfBuffer guifg={{colors.surface.default.hex}} guibg=NONE
hi NeoTreeDirectoryName guifg={{colors.primary.default.hex}}
hi NeoTreeDirectoryIcon guifg={{colors.primary.default.hex}}
hi NeoTreeFileName guifg={{colors.on_surface.default.hex}}
hi NeoTreeFileIcon guifg={{colors.on_surface.default.hex}}
hi NeoTreeRootName guifg={{colors.primary.default.hex}} gui=bold
hi NeoTreeGitModified guifg={{colors.tertiary.default.hex}}
hi NeoTreeGitAdded guifg={{colors.secondary.default.hex}}
hi NeoTreeGitDeleted guifg={{colors.error.default.hex}}
hi NeoTreeGitUntracked guifg={{colors.outline.default.hex}}
hi NeoTreeIndentMarker guifg={{colors.outline.default.hex}}
hi NeoTreeCursorLine guibg={{colors.surface_container.default.hex}}
hi NeoTreeTitleBar guifg={{colors.on_primary.default.hex}} guibg={{colors.primary.default.hex}}
hi NeoTreeFloatBorder guifg={{colors.outline.default.hex}} guibg=NONE
hi NeoTreeWinSeparator guifg={{colors.outline.default.hex}} guibg=NONE

" Floating windows & borders
hi NormalFloat guifg={{colors.on_surface.default.hex}} guibg=NONE
hi FloatBorder guifg={{colors.outline.default.hex}} guibg=NONE
hi FloatTitle guifg={{colors.primary.default.hex}} guibg=NONE

" Telescope
hi TelescopeNormal guifg={{colors.on_surface.default.hex}} guibg=NONE
hi TelescopeBorder guifg={{colors.outline.default.hex}} guibg=NONE
hi TelescopeTitle guifg={{colors.primary.default.hex}}
hi TelescopePromptNormal guifg={{colors.on_surface.default.hex}} guibg=NONE
hi TelescopePromptBorder guifg={{colors.outline.default.hex}} guibg=NONE
hi TelescopePromptTitle guifg={{colors.on_primary.default.hex}} guibg={{colors.primary.default.hex}}
hi TelescopeResultsNormal guifg={{colors.on_surface.default.hex}} guibg=NONE
hi TelescopeResultsBorder guifg={{colors.outline.default.hex}} guibg=NONE
hi TelescopePreviewNormal guifg={{colors.on_surface.default.hex}} guibg=NONE
hi TelescopePreviewBorder guifg={{colors.outline.default.hex}} guibg=NONE
hi TelescopeSelection guibg={{colors.surface_container_high.default.hex}}
hi TelescopeMatching guifg={{colors.primary.default.hex}} gui=bold

" Lazy plugin manager
hi LazyNormal guifg={{colors.on_surface.default.hex}} guibg=NONE
hi LazyButton guifg={{colors.on_surface.default.hex}} guibg={{colors.surface_container_high.default.hex}}
hi LazyButtonActive guifg={{colors.on_primary.default.hex}} guibg={{colors.primary.default.hex}}
hi LazyH1 guifg={{colors.on_primary.default.hex}} guibg={{colors.primary.default.hex}}
hi LazyH2 guifg={{colors.primary.default.hex}} gui=bold
hi LazySpecial guifg={{colors.secondary.default.hex}}
hi LazyCommit guifg={{colors.outline.default.hex}}

" WhichKey
hi WhichKey guifg={{colors.primary.default.hex}}
hi WhichKeyGroup guifg={{colors.secondary.default.hex}}
hi WhichKeyDesc guifg={{colors.on_surface.default.hex}}
hi WhichKeyFloat guibg=NONE
hi WhichKeyBorder guifg={{colors.outline.default.hex}} guibg=NONE

" Notifications (noice/notify)
hi NotifyINFOBody guifg={{colors.on_surface.default.hex}} guibg=NONE
hi NotifyINFOBorder guifg={{colors.primary.default.hex}} guibg=NONE
hi NotifyINFOTitle guifg={{colors.primary.default.hex}}
hi NotifyWARNBody guifg={{colors.on_surface.default.hex}} guibg=NONE
hi NotifyWARNBorder guifg={{colors.tertiary.default.hex}} guibg=NONE
hi NotifyWARNTitle guifg={{colors.tertiary.default.hex}}
hi NotifyERRORBody guifg={{colors.on_surface.default.hex}} guibg=NONE
hi NotifyERRORBorder guifg={{colors.error.default.hex}} guibg=NONE
hi NotifyERRORTitle guifg={{colors.error.default.hex}}

" Indent guides
hi IblIndent guifg={{colors.surface_container_high.default.hex}}
hi IblScope guifg={{colors.primary.default.hex}}

" Bufferline (tabs)
hi BufferLineBackground guifg={{colors.outline.default.hex}} guibg=NONE
hi BufferLineFill guibg=NONE
hi BufferLineBufferSelected guifg={{colors.on_surface.default.hex}} guibg={{colors.surface_container.default.hex}} gui=bold
