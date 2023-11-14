local keymap = vim.keymap
-- keymap.set({"n","v"},"gc",  desc = "Comment toggle linewise" )
-- keymap.set({"n","v"},"gb",  desc = "Comment toggle blockwise" )
keymap.set(
    "n",
    "<leader>/",
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    { desc = "toggle comment" }
)

keymap.set(
    "v",
    "<leader>/",
    "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
    { desc = "toggle comment" }
)

local ts_context_commentstring = require "ts_context_commentstring.integrations.comment_nvim"
require("Comment").setup {
    pre_hook = ts_context_commentstring.create_pre_hook(),
}