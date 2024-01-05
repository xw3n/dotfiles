local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  require("which-key").setup {
    icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
    disable = { filetypes = { "TelescopePrompt" } },
  }
  require("which-key").register {
    ["<leader>b"] = { name = " 󰓩.Buffer" },
    ["<leader>s"] = { name = " 󰤼 Split" },
    ["<leader>g"] = { name = "  Git" },
    ["<leader>f"] = { name = "  Find" },
    ["<leader>l"] = { name = "  Lsp" },
    ["<leader>m"] = { name = " 󰏓 Manage" },
    ["<leader>t"] = { name = "  Terminal" },
    ["<leader>j"] = { name = " 󰬷 Java" },
    ["<leader>d"] = { name = "  Debug" },
  }
end

return M