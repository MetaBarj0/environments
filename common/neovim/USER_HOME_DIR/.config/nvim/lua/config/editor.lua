require("utils.reloadConfig")

vim.cmd("colorscheme catppuccin")

vim.opt.background = "dark"
vim.opt.hidden = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.wrap = false
vim.opt.number = true
vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.wildignore = { "*.swp", "*.bak", "*.pyc", "*.class" }
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.history = 1000

-- normal mode mappings
vim.keymap.set("n", "<leader>lcd", ":lcd %:p:h<CR>", { silent = true, desc = "Change window current directory" })
vim.keymap.set(
	"n",
	"<leader>ev",
	":tabe " .. vim.env.MYVIMRC .. "<CR>" .. ":tcd %:p:h<CR>" .. ":split .<CR>",
	{ silent = false, desc = "Edit config file and display config directory" }
)
vim.keymap.set("n", "<leader>sv", ":lua reloadConfig()<CR>", { silent = true, desc = "Reload config" })
vim.keymap.set("n", "<Leader>bn", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<Leader>bp", ":bp<CR>", { silent = true })
vim.keymap.set("n", "<Leader>xbn", ":bn<CR>:bd #<CR>", { silent = true })
vim.keymap.set("n", "<Leader>xbp", ":bp<CR>:bd #<CR>", { silent = true })
vim.keymap.set("n", "<Leader>xbd", ":bd #<CR>", { silent = true })
vim.keymap.set("n", "<Leader>btt", ":tabnew %<CR>", { silent = true })
vim.keymap.set("n", "<Leader>btp", ":tabnew %<CR>:tabp<CR>:bp<CR>:tabn<CR>", { silent = true })
vim.keymap.set("n", "<Leader>btn", ":tabnew %<CR>:tabp<CR>:bn<CR>:tabn<CR>", { silent = true })

-- visual mode mappings
vim.keymap.set("v", "<", "<gv", { silent = true, remap = false })
vim.keymap.set("v", ">", ">gv", { silent = true, remap = false })

-- terminal mappings
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
