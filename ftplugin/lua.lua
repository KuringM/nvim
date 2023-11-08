-- -- Fix `gf` command on lua files.
vim.opt_local.suffixesadd:prepend(".lua")
vim.opt_local.suffixesadd:prepend("init.lua")
vim.opt_local.path:prepend(vim.fn.stdpath("config") .. "/lua")
vim.opt_local.path:prepend(vim.fn.stdpath("config") .. "/lua/conf/plugins")
vim.opt_local.path:prepend(vim.fn.stdpath("config") .. "/lua/conf/plugins/plugins_appearance")
vim.opt_local.path:prepend(vim.fn.stdpath("config") .. "/lua/conf/plugins/plugins_editor")
vim.opt_local.path:prepend(vim.fn.stdpath("config") .. "/lua/conf/plugins/plugins_lsp")
