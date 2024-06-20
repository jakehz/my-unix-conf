local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = false
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 0
opt.shiftwidth = 2
opt.expandtab = false
opt.autoindent = true

-- line wrapping
opt.wrap = true

-- search settings
-- when searching a file with `/`, lower case will match
-- with upper case values, while uppercase will match only with upper case

opt.ignorecase = true
opt.smartcase = true

-- cursor line
-- highlights the line the cursor is on.
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- Ensures that the in-editor clipboard is synced with the system clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Consider "-" as part of a vim word
-- e.g. "my-var-name" is skipped past when pressing "w".
opt.iskeyword:append("-")

opt.colorcolumn = "79"
-- Show spaces as dots
opt.list = true
opt.listchars:append({ tab = "→\\ ", space = "·" })
opt.conceallevel = 2
opt.concealcursor = "nvic"
