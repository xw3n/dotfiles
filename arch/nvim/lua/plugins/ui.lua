local path = "plugins.config"

return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = require(path .. ".bufferline"),
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = require(path .. ".lualine"),
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = require(path .. ".alpha-nvim"),
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
}