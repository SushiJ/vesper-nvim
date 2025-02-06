local p = require('vesper.palette')

return {
  normal = {
    a = { bg = p.hint, fg = p.vesper0, gui = 'bold' },
    b = { bg = p.vesper0, fg = p.fg0 },
    c = { bg = p.vesper0, fg = p.fg0 },
  },
  insert = {
    a = { bg = p.warn, fg = p.vesper0, gui = 'bold' },
    b = { bg = p.vesper0, fg = p.fg0 },
    c = { bg = p.vesper0, fg = p.fg0 },
  },
  visual = {
    a = { bg = p.debug, fg = p.vesper0, gui = 'bold' },
    b = { bg = p.vesper0, fg = p.fg0 },
    c = { bg = p.vesper0, fg = p.fg0 },
  },
  replace = {
    a = { bg = p.cyan, fg = p.vesper0, gui = 'bold' },
    b = { bg = p.vesper0, fg = p.fg0 },
    c = { bg = p.vesper0, fg = p.fg0 },
  },
  command = {
    a = { bg = p.cyan, fg = p.vesper0, gui = 'bold' },
    b = { bg = p.vesper0, fg = p.fg0 },
    c = { bg = p.vesper0, fg = p.fg0 },
  },
  inactive = {
    a = { bg = p.vesper2, fg = p.fg1, gui = 'bold' },
    b = { bg = p.vesper2, fg = p.fg1 },
    c = { bg = p.vesper2, fg = p.fg1 },
  },
}
