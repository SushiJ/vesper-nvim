local p = require('vesper.palette')
local utils = require('vesper.util')
local config = require('vesper.config')
local terminal = require('vesper.terminal')

local M = {}

local function load_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group_name, group_settings)
  end
end

local styles = vim.tbl_map(function(value)
  return setmetatable(value, {
    __add = function(a, b)
      return vim.tbl_extend('force', a, b)
    end,
  })
end, config.styles)

local transparent_bg = setmetatable({}, {
  __add = function(a)
    a.bg = config.transparent_background and p.none or a.bg
    return a
  end,
})

local function gamma(value)
  return setmetatable({}, {
    __add = function(a)
      return utils.color_gamma(a, value)
    end,
  })
end

M.highlights = {
  Fg = { fg = p.fg0 },
  Grey = { fg = p.fg1 },
  Red = { fg = p.error },
  Orange = { fg = p.debug },
  Yellow = { fg = p.warn },
  Green = { fg = p.green },
  Blue = { fg = p.hint },
  Purple = { fg = p.purple },
  Normal = { fg = p.fg0, bg = p.vesper0 } + transparent_bg,
  NormalNC = { fg = p.fg0, bg = p.vesper0 } + transparent_bg,
  NormalSB = { fg = p.fg0, bg = p.vesper0 } + transparent_bg,
  NormalFloat = { fg = p.fg0, bg = p.vesper0 } + transparent_bg,
  Terminal = { fg = p.fg0, bg = p.vesper0 } + transparent_bg,
  EndOfBuffer = { fg = p.fg0, bg = p.vesper0 } + transparent_bg,
  FoldColumn = { fg = p.fg0, bg = p.vesper2 } + transparent_bg,
  Folded = { fg = p.fg0, bg = p.vesper2 } + transparent_bg,
  SignColumn = { fg = p.fg0, bg = p.vesper0 } + transparent_bg,
  ToolbarLine = { fg = p.fg0 },
  Cursor = { reverse = true },
  vCursor = { reverse = true },
  iCursor = { reverse = true },
  lCursor = { reverse = true },
  CursorIM = { reverse = true },
  CursorColumn = { bg = p.vesper1 },
  CursorLine = { bg = p.vesper1 },
  ColorColumn = { bg = p.vesper1 },
  CursorLineNr = { fg = p.fg0 },
  LineNr = { fg = p.vesper3 },
  Conceal = { fg = p.fg2, bg = p.vesper1 } + transparent_bg,
  -- DiffAdd = { fg = p.none, bg = p.diff_add },
  -- DiffChange = { fg = p.none, bg = p.diff_change },
  -- DiffDelete = { fg = p.none, bg = p.diff_delete },
  -- DiffText = { fg = p.none, bg = p.diff_text },
  Directory = { fg = p.hover },
  ErrorMsg = { fg = p.error, bold = true, underline = true },
  WarningMsg = { fg = p.warn, bold = true },
  MoreMsg = { fg = p.hint, bold = true },
  IncSearch = { fg = p.vesper0, bg = p.error },
  Search = { fg = p.vesper0, bg = p.green },
  CurSearch = { fg = p.vesper0, bg = p.error },
  MatchParen = { fg = p.none, bg = p.vesper2 },
  NonText = { fg = p.vesper2 },
  Whitespace = { fg = p.vesper2 },
  SpecialKey = { fg = p.vesper2 },
  Pmenu = { fg = p.fg0, bg = p.vesper0 },
  PmenuSbar = { fg = p.none, bg = p.vesper0 },
  PmenuSel = { fg = p.fg0, bg = p.green },
  PmenuThumb = { fg = p.none, bg = p.vesper1 },
  WildMenu = { fg = p.vesper0, bg = p.hint },
  Question = { fg = p.warn },
  SpellBad = { fg = p.error, underline = true, sp = p.error },
  SpellCap = { fg = p.warn, underline = true, sp = p.warn },
  SpellLocal = { fg = p.hint, underline = true, sp = p.hint },
  -- SpellRare = { fg = p.purple, underline = true, sp = p.purple },
  StatusLine = { fg = p.fg0, bg = p.vesper1 },
  StatusLineTerm = { fg = p.fg0, bg = p.vesper1 },
  StatusLineNC = { fg = p.fg2, bg = p.vesper1 },
  StatusLineTermNC = { fg = p.fg2, bg = p.vesper0 },
  TabLine = { fg = p.fg0, bg = p.vesper2 },
  TabLineFill = { fg = p.fg0, bg = p.vesper0 },
  TabLineSel = { fg = p.vesper0, bg = p.warn },
  WinSeparator = { fg = p.vesper3 },
  VertSplit = { fg = p.vesper3 },
  Visual = { bg = p.vesper1 },
  VisualNOS = { fg = p.none, bg = p.vesper1, underline = true },
  QuickFixLine = { fg = p.hint, underline = true },
  Debug = { fg = p.warn },
  debugPC = { fg = p.vesper0, bg = p.green },
  debugBreakpoint = { fg = p.vesper0, bg = p.warn },
  ToolbarButton = { fg = p.vesper0, bg = p.hint },
  FocusedSymbol = { bg = p.vesper2 },
  FloatBorder = { fg = p.border0 },
  FloatTitle = { fg = p.hint },

  Type = { fg = p.fg0 } + styles.keywords,
  Structure = { fg = p.hint } + styles.keywords,
  StorageClass = { fg = p.hint } + styles.keywords,
  Identifier = { fg = p.fg2 } + styles.identifiers,
  Constant = { fg = p.fg0 } + styles.variables,
  PreProc = { fg = p.error },
  PreCondit = { fg = p.error },
  Include = { fg = p.warn },
  Keyword = { fg = p.fg2 } + styles.keywords,
  Define = { fg = p.error },
  Typedef = { fg = p.error },
  Exception = { fg = p.error },
  Conditional = { fg = p.error },
  Repeat = { fg = p.error },
  Statement = { fg = p.error },
  Macro = { fg = p.warn },
  Error = { fg = p.error },
  Label = { fg = p.warn },
  Special = { fg = p.warn },
  SpecialChar = { fg = p.warn },
  Boolean = { fg = p.warn },
  String = { fg = p.hint },
  Character = { fg = p.warn },
  Number = { fg = p.warn },
  Float = { fg = p.warn },
  Function = { fg = p.warn } + styles.functions,
  Operator = { fg = p.fg2 },
  Title = { fg = p.vesper2 },
  Tag = { fg = p.debug },
  Delimiter = { fg = p.fg2 },
  Comment = { fg = p.vesper3 } + styles.comments,
  SpecialComment = { fg = p.vesper3 } + styles.comments,
  Todo = { fg = p.hint } + styles.comments,

  -- whichkey
  WhichKey = { fg = p.warn },
  WhichKeyDesc = { fg = p.hint },
  WhichKeyGroup = { fg = p.debug },
  WhichKeySeperator = { fg = p.green },

  -- flash
  FlashBackdrop = { fg = p.vesper3 },
  FlashLabel = { fg = p.vesper0, bg = p.hint, bold = true },

  -- -- gitgutter
  -- GitGutterAdd = { fg = p.diff_green },
  -- GitGutterChange = { fg = p.diff_blue },
  -- GitGutterDelete = { fg = p.diff_red },

  -- diffview
  DiffviewFilePanelTitle = { fg = p.hint, bold = true },
  DiffviewFilePanelCounter = { fg = p.warn, bold = true },
  DiffviewFilePanelFileName = { fg = p.fg0 },
  DiffviewNormal = { link = 'Normal' },
  DiffviewCursorLine = { link = 'CursorLine' },
  DiffviewVertSplit = { link = 'VertSplit' },
  DiffviewSignColumn = { link = 'SignColumn' },
  DiffviewStatusLine = { link = 'StatusLine' },
  DiffviewStatusLineNC = { link = 'StatusLineNC' },
  DiffviewEndOfBuffer = { link = 'EndOfBuffer' },
  DiffviewFilePanelRootPath = { fg = p.fg2 },
  DiffviewFilePanelPath = { fg = p.fg2 },
  DiffviewFilePanelInsertions = { fg = p.green },
  DiffviewFilePanelDeletions = { fg = p.warn },
  DiffviewStatusAdded = { fg = p.green },
  DiffviewStatusUntracked = { fg = p.hint },
  DiffviewStatusModified = { fg = p.hint },
  DiffviewStatusRenamed = { fg = p.hint },
  DiffviewStatusCopied = { fg = p.hint },
  DiffviewStatusTypeChange = { fg = p.hint },
  DiffviewStatusUnmerged = { fg = p.hint },
  DiffviewStatusUnknown = { fg = p.error },
  DiffviewStatusDeleted = { fg = p.error },
  DiffviewStatusBroken = { fg = p.error },

  -- comments
  commentTSDanger = { fg = p.error } + styles.comments,
  commentTSNote = { fg = p.hint } + styles.comments,
  commentTSWarning = { fg = p.warn } + styles.comments,

  -- treesitter
  ['@annotation'] = { link = 'PreProc', default = true },
  ['@attribute'] = { link = 'PreProc', default = true },
  ['@boolean'] = { link = 'Boolean', default = true },
  ['@character'] = { link = 'Character', default = true },
  ['@character.special'] = { link = 'SpecialChar', default = true },
  ['@comment'] = { link = 'Comment', default = true },
  ['@conditional'] = { link = 'Conditional', default = true },
  ['@constant'] = { link = 'Constant', default = true },
  ['@constant.builtin'] = { link = 'Special', default = true },
  ['@constant.macro'] = { link = 'Define', default = true },
  ['@constructor'] = { link = 'Special', default = true },
  ['@debug'] = { link = 'Debug', default = true },
  ['@define'] = { link = 'Define', default = true },
  ['@defaultLibrary'] = { link = 'Special', default = true },
  ['@error'] = { link = 'Error', default = true },
  ['@exception'] = { link = 'Exception', default = true },
  ['@field'] = { link = 'Identifier', default = true },
  ['@float'] = { link = 'Float', default = true },
  ['@function'] = { link = 'Function', default = true },
  ['@function.builtin'] = { link = 'Special', default = true },
  ['@function.call'] = { link = '@function', default = true },
  ['@function.macro'] = { link = 'Macro', default = true },
  ['@include'] = { link = 'Include', default = true },
  ['@keyword'] = { link = 'Keyword', default = true },
  ['@keyword.function'] = { link = 'Keyword', default = true },
  ['@keyword.operator'] = { link = '@operator', default = true },
  ['@keyword.return'] = { link = '@keyword', default = true },
  ['@label'] = { link = 'Label', default = true },
  ['@method'] = { link = 'Function', default = true },
  ['@method.call'] = { link = '@method', default = true },
  ['@namespace'] = { link = 'Include', default = true },
  ['@none'] = { bg = 'NONE', fg = 'NONE', default = true },
  ['@number'] = { link = 'Number', default = true },
  ['@operator'] = { link = 'Operator', default = true },
  ['@parameter'] = { link = 'Identifier', default = true },
  ['@parameter.reference'] = { link = '@parameter', default = true },
  ['@preproc'] = { link = 'PreProc', default = true },
  ['@property'] = { link = 'Identifier', default = true },
  ['@punctuation.bracket'] = { link = 'Delimiter', default = true },
  ['@punctuation.delimiter'] = { link = 'Delimiter', default = true },
  ['@punctuation.special'] = { link = 'Delimiter', default = true },
  ['@repeat'] = { link = 'Repeat', default = true },
  ['@storageclass'] = { link = 'StorageClass', default = true },
  ['@string'] = { link = 'String', default = true },
  ['@string.escape'] = { link = 'SpecialChar', default = true },
  ['@string.regex'] = { link = 'String', default = true },
  ['@string.special'] = { link = 'SpecialChar', default = true },
  ['@symbol'] = { link = 'Identifier', default = true },
  ['@tag'] = { link = 'Label', default = true },
  ['@tag.attribute'] = { link = '@property', default = true },
  ['@tag.delimiter'] = { link = 'Delimiter', default = true },
  ['@text'] = { link = '@none', default = true },
  ['@text.danger'] = { link = 'WarningMsg', default = true },
  ['@text.emphasis'] = { italic = true, default = true },
  ['@text.environment'] = { link = 'Macro', default = true },
  ['@text.environment.name'] = { link = 'Type', default = true },
  ['@text.literal'] = { link = 'String', default = true },
  ['@text.math'] = { link = 'Special', default = true },
  ['@text.note'] = { link = 'SpecialComment', default = true },
  ['@text.reference'] = { link = 'Constant', default = true },
  ['@text.strike'] = { strikethrough = true, default = true },
  ['@text.strong'] = { bold = true, default = true },
  ['@text.title'] = { link = 'Title', default = true },
  ['@text.todo'] = { link = 'Todo', default = true },
  ['@text.underline'] = { underline = true, default = true },
  ['@text.uri'] = { link = 'Underlined', default = true },
  ['@text.warning'] = { link = 'Todo', default = true },
  ['@todo'] = { link = 'Todo', default = true },
  ['@type'] = { link = 'Type', default = true },
  ['@type.builtin'] = { link = 'Type', default = true },
  ['@type.definition'] = { link = 'Typedef', default = true },
  ['@type.qualifier'] = { link = 'Type', default = true },
  ['@variable'] = { fg = p.fg0, default = true } + styles.variables,
  ['@variable.builtin'] = { fg = p.purple, default = true },

  -- lsp
  LspCxxHlGroupEnumConstant = { fg = p.debug },
  LspCxxHlGroupMemberVariable = { fg = p.debug },
  LspCxxHlGroupNamespace = { fg = p.hint },
  LspCxxHlSkippedRegion = { fg = p.fg0 },
  LspCxxHlSkippedRegionBeginEnd = { fg = p.error },
  LspDiagnosticsDefaultError = { fg = p.error + gamma(0.5) },
  LspDiagnosticsDefaultHint = { fg = p.purple + gamma(0.5) },
  LspDiagnosticsDefaultInformation = { fg = p.hint + gamma(0.5) },
  LspDiagnosticsDefaultWarning = { fg = p.warn + gamma(0.5) },
  LspDiagnosticsUnderlineError = {
    underline = true,
    sp = p.error + gamma(0.5),
  },
  LspDiagnosticsUnderlineHint = {
    underline = true,
    sp = p.purple + gamma(0.5),
  },
  LspDiagnosticsUnderlineInformation = {
    underline = true,
    sp = p.hint + gamma(0.5),
  },
  LspDiagnosticsUnderlineWarning = {
    underline = true,
    sp = p.warn + gamma(0.5),
  },
  DiagnosticSignError = { fg = p.error + gamma(0.5) },
  DiagnosticSignHint = { fg = p.purple + gamma(0.5) },
  DiagnosticSignInfo = { fg = p.hint + gamma(0.5) },
  DiagnosticSignWarn = { fg = p.warn + gamma(0.5) },
  LspReferenceRead = { bg = p.vesper2 },
  LspReferenceWrite = { bg = p.vesper2 },
  LspReferenceText = { bg = p.vesper2 },
  LspInfoBorder = { fg = p.vesper3 },

  -- lsp semantic tokens
  LspNamespace = { link = '@namespace' },
  LspType = { link = '@type' },
  LspClass = { link = '@type' },
  LspEnum = { link = '@constant' },
  LspInterface = { link = '@constant' },
  LspStruct = { link = '@constant' },
  LspTypeParameter = { link = '@type' },
  LspParameter = { link = '@parameter' },
  LspVariable = { link = '@variable' },
  LspProperty = { link = '@property' },
  LspEnumMember = { link = '@constant' },
  LspEvent = { link = '@constant' },
  LspFunction = { link = '@function' },
  LspMethod = { link = '@method' },
  LspMacro = { link = '@constant.macro' },
  LspKeyword = { link = '@keyword' },
  LspModifier = { link = 'TSModifier' },
  LspComment = { link = '@comment' },
  LspString = { link = '@string' },
  LspNumber = { link = '@number' },
  LspRegexp = { link = '@string.regex' },
  LspOperator = { link = '@operator' },
  LspDecorator = { link = '@symbol' },
  LspDeprecated = { link = '@text.strike' },
  ['@lsp.type.namespace'] = { link = '@namespace', default = true },
  ['@lsp.type.type'] = { link = '@type', default = true },
  ['@lsp.type.class'] = { link = '@type', default = true },
  ['@lsp.type.enum'] = { link = '@type', default = true },
  ['@lsp.type.interface'] = { link = '@type', default = true },
  ['@lsp.type.struct'] = { link = '@structure', default = true },
  ['@lsp.type.parameter'] = { link = '@parameter', default = true },
  ['@lsp.type.variable'] = { link = '@variable', default = true },
  ['@lsp.type.property'] = { link = '@property', default = true },
  ['@lsp.type.enumMember'] = { link = '@constant', default = true },
  ['@lsp.type.function'] = { link = '@function', default = true },
  ['@lsp.type.method'] = { link = '@method', default = true },
  ['@lsp.type.macro'] = { link = '@macro', default = true },
  ['@lsp.type.decorator'] = { link = '@function', default = true },

  -- cmp
  CmpItemKindDefault = { fg = p.hint },
  CmpItemAbbrMatch = { fg = p.hint },
  CmpItemAbbrMatchFuzzy = { fg = p.hint },
  CmpItemKindKeyword = { fg = p.fg0 },
  CmpItemKindVariable = { fg = p.cyan },
  CmpItemKindConstant = { fg = p.cyan },
  CmpItemKindReference = { fg = p.cyan },
  CmpItemKindValue = { fg = p.cyan },
  CmpItemKindFunction = { fg = p.purple },
  CmpItemKindMethod = { fg = p.purple },
  CmpItemKindConstructor = { fg = p.purple },
  CmpItemKindClass = { fg = p.warn },
  CmpItemKindInterface = { fg = p.warn },
  CmpItemKindStruct = { fg = p.warn },
  CmpItemKindEvent = { fg = p.warn },
  CmpItemKindEnum = { fg = p.warn },
  CmpItemKindUnit = { fg = p.warn },
  CmpItemKindModule = { fg = p.warn },
  CmpItemKindProperty = { fg = p.green },
  CmpItemKindField = { fg = p.green },
  CmpItemKindTypeParameter = { fg = p.green },
  CmpItemKindEnumMember = { fg = p.green },
  CmpItemKindOperator = { fg = p.green },
  CmpItemKindSnippet = { fg = p.error },

  -- coc
  CocErrorSign = { fg = p.error + gamma(0.5) },
  CocHintSign = { fg = p.error + gamma(0.5) },
  CocInfoSign = { fg = p.error + gamma(0.5) },
  CocWarningSign = { fg = p.error + gamma(0.5) },
  FgCocErrorFloatBgCocFloating = { fg = p.error + gamma(0.5), bg = p.vesper1 },
  FgCocHintFloatBgCocFloating = { fg = p.purple + gamma(0.5), bg = p.vesper1 },
  FgCocInfoFloatBgCocFloating = { fg = p.hint + gamma(0.5), bg = p.vesper1 },
  FgCocWarningFloatBgCocFloating = {
    fg = p.warn + gamma(0.5),
    bg = p.vesper1,
  },

  -- gitsigns
  GitSignsAdd = { fg = p.green },
  GitSignsAddLn = { fg = p.green },
  GitSignsAddNr = { fg = p.green },
  GitSignsChange = { fg = p.hint },
  GitSignsChangeLn = { fg = p.hint },
  GitSignsChangeNr = { fg = p.hint },
  GitSignsDelete = { fg = p.error },
  GitSignsDeleteLn = { fg = p.error },
  GitSignsDeleteNr = { fg = p.error },

  -- telescope
  TelescopeBorder = { link = 'FloatBorder' },
  TelescopePreviewBorder = { fg = p.vesper3 },
  TelescopePreviewTitle = { fg = p.hint },
  TelescopePromptBorder = { fg = p.vesper3 },
  TelescopePromptTitle = { fg = p.hint },
  TelescopeResultsBorder = { fg = p.vesper3 },
  TelescopeResultsTitle = { fg = p.hint },

  -- markdown
  markdownBlockquote = { fg = p.fg2 },
  markdownBold = { fg = p.none, bold = true },
  markdownBoldDelimiter = { fg = p.fg2 },
  markdownCode = { fg = p.warn },
  markdownCodeBlock = { fg = p.warn },
  markdownCodeDelimiter = { fg = p.fg2 },
  markdownH1 = { fg = p.warn, bold = true },
  markdownH2 = { fg = p.warn, bold = true },
  markdownH3 = { fg = p.warn, bold = true },
  markdownH4 = { fg = p.warn, bold = true },
  markdownH5 = { fg = p.warn, bold = true },
  markdownH6 = { fg = p.warn, bold = true },
  markdownHeadingDelimiter = { fg = p.fg2 },
  markdownHeadingRule = { fg = p.fg2 },
  markdownId = { fg = p.warn },
  markdownIdDeclaration = { fg = p.warn },
  markdownItalic = { fg = p.none, italic = true },
  markdownItalicDelimiter = { fg = p.fg2, italic = true },
  markdownLinkDelimiter = { fg = p.fg2 },
  markdownLinkText = { fg = p.purple, underline = true },
  markdownLinkTextDelimiter = { fg = p.fg2 },
  markdownListMarker = { fg = p.purple },
  markdownOrderedListMarker = { fg = p.purple },
  markdownRule = { fg = p.purple },
  markdownUrl = { fg = p.hint, underline = true },
  markdownUrlDelimiter = { fg = p.fg2 },
  markdownUrlTitleDelimiter = { fg = p.purple },
  ['@markup'] = { link = '@none' },
  ['@markup.heading'] = { fg = p.warn, bold = true },
  ['@markup.link.label'] = { fg = p.purple, underline = true },
  ['@markup.link.url'] = { fg = p.hint, underline = true },
  ['@markup.list'] = { fg = p.purple },
  ['@markup.list.checked'] = { fg = p.hint },
  ['@markup.list.unchecked'] = { fg = p.hint },
  ['@markup.strikethrough'] = { strikethrough = true },
  ['@markup.strong'] = { bold = true },
  ['@markup.italic'] = { italic = true },
  ['@markup.underline'] = { underline = true },

  -- scala
  scalaNameDefinition = { fg = p.fg0 },
  scalaInterpolationBoundary = { fg = p.purple },
  scalaInterpolation = { fg = p.purple },
  scalaTypeOperator = { fg = p.error },
  scalaOperator = { fg = p.error },
  scalaKeywordModifier = { fg = p.error },
}

function M.setup()
  local highlights = type(config.custom_highlights) == 'function'
      and config.custom_highlights(M.highlights, p)
    or config.custom_highlights
  load_highlights(vim.tbl_extend('force', M.highlights, highlights))
  if config.terminal_colors then
    terminal.setup()
  end
end

return M
