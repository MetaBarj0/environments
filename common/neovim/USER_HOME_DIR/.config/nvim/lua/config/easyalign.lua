-- Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vim.keymap.set("v", "<enter>", "<Plug>(EasyAlign)", { silent = true, desc = "EasyAlign visual" })

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.keymap.set("n", "<leader>ea", "<Plug>(EasyAlign)", { silent = true, desc = "EasyAlign interactive motion" })
