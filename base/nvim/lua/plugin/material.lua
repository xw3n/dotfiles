local M = {
  "marko-cerovac/material.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  -- vim.g.material_style = "deep ocean"
  vim.g.material_style = "darker"
  require("material").setup {
    plugins = { -- Uncomment the plugins that you use to highlight them
      -- Available plugins:
      "dap",
      -- "dashboard",
      -- "eyeliner",
      -- "fidget"
      -- "flash"
      "gitsigns",
      -- "harpoon",
      -- "hop",
      "illuminate",
      "indent-blankline",
      "lspsaga",
      -- "mini",
      -- "neogit",
      -- "neotest",
      -- "neorg",
      "noice",
      "nvim-cmp",
      -- "nvim-navic",
      -- "nvim-tree",
      "nvim-web-devicons",
      -- "rainbow-delimiters",
      -- "sneak",
      "telescope",
      -- "trouble",
      "which-key",
    },
  }
end

return M