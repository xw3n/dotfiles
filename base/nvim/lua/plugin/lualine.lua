return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "AndreM222/copilot-lualine",
  },
  config = function()
    local colors = {
      white = "#ffffff",
      mantle = "#181825",
      text = "#cdd6f4",
      innerbg = nil,
      outerbg = nil,
      pink = "#f5c2e7",
      green = "#a6e3a1",
      peach = "#fab387",
      red = "#f38ba8",
      yellow = "#f9e2af",
      lavender = "#b4befe",
      blue = "#00BFFF",
    }
    local theme = function()
      return {
        inactive = {
          a = { fg = colors.text, bg = colors.outerbg, gui = "bold" },
          b = { fg = colors.text, bg = colors.outerbg },
          c = { fg = colors.text, bg = colors.innerbg },
        },
        visual = {
          a = { fg = colors.mantle, bg = colors.peach, gui = "bold" },
          b = { fg = colors.peach, bg = colors.outerbg },
          c = { fg = colors.text, bg = colors.innerbg },
        },
        replace = {
          a = { fg = colors.mantle, bg = colors.red, gui = "bold" },
          b = { fg = colors.red, bg = colors.outerbg },
          c = { fg = colors.text, bg = colors.innerbg },
        },
        normal = {
          a = { fg = colors.mantle, bg = colors.pink, gui = "bold" },
          b = { fg = colors.pink, bg = colors.outerbg },
          c = { fg = colors.text, bg = colors.innerbg },
        },
        insert = {
          a = { fg = colors.mantle, bg = colors.green, gui = "bold" },
          b = { fg = colors.green, bg = colors.outerbg },
          c = { fg = colors.text, bg = colors.innerbg },
        },
        command = {
          a = { fg = colors.mantle, bg = colors.yellow, gui = "bold" },
          b = { fg = colors.yellow, bg = colors.outerbg },
          c = { fg = colors.text, bg = colors.innerbg },
        },
      }
    end

    local icons = require "core.icons"

    -- set an empty statusline till lualine loads
    -- hide the statusline on the starter page
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end

    -- lsp client
    local lsp = function()
      local clients = vim.lsp.get_clients()
      local msg = "No Active Lsp"
      if next(clients) == nil then
        return msg
      else
        local c = {}
        for _, client in ipairs(clients) do
          if client.name ~= "null-ls" and client.name ~= "copilot" then table.insert(c, client.name) end
        end
        if next(c) == nil then
          return msg
        else
          return table.concat(c, "|")
        end
      end
    end

    -- lazy status
    local lazy_status = require "lazy.status"
    local lazy = function() return lazy_status.updates() end

    -- vim
    local vim_icon = function() return "" end

    -- conditions for components to show
    local conditions = {
      buffer_not_empty = function() return vim.fn.empty(vim.fn.expand "%:t") ~= 1 end,
      hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
      lazy_status = lazy_status.has_updates,
    }

    require("lualine").setup {
      -- extensions = { "quickfix", "lazy", "mason", "nvim-dap-ui", "toggleterm", "quickfix" },
      disabled_filetypes = {
        statusline = { "alpha" },
        winbar = { "alpha", "edgy", "toggleterm", "Trouble", "spectre_panel", "qf", "noice", "dbui" },
      },
      options = {
        theme = theme,
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            vim_icon,
            color = { gui = "bold" },
          },
        },
        lualine_b = {
          {
            "branch",
            color = { gui = "bold" },
          },
        },
        lualine_c = {
          {
            "diff",
            cond = conditions.hide_in_width,
            symbols = {
              added = icons.GitAdd .. " ",
              modified = icons.GitModified .. " ",
              removed = icons.GitRemoved .. " ",
            },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.peach },
              removed = { fg = colors.red },
            },
          },
          { function() return "%=" end },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = icons.DiagnosticError .. " ",
              warn = icons.DiagnosticWarn .. " ",
              info = icons.DiagnosticInfo .. " ",
              hint = icons.DiagnosticHint .. " ",
            },
            diagnostics_color = {
              color_error = { fg = colors.red },
              color_warn = { fg = colors.yellow },
              color_info = { fg = colors.green },
              color_hint = { fg = colors.blue },
            },
          },
        },
        lualine_x = {
          {
            lazy,
            cond = conditions.lazy_status,
            color = { fg = colors.peach },
          },
          {
            "copilot",
            symbols = {
              status = {
                icons = {
                  enabled = icons.CopilotEnabled,
                  sleep = icons.CopilotEnabled,
                  disabled = icons.CopilotDisabled,
                  warning = icons.CopilotWarning,
                  unknown = icons.CopilotUnknown,
                },
                hl = {
                  enabled = colors.green,
                  sleep = colors.white,
                  disabled = colors.yellow,
                  warning = colors.peach,
                  unknown = colors.red,
                },
              },
              spinners = require("copilot-lualine.spinners").dots,
              spinner_color = colors.yellow,
            },
            show_colors = true,
            show_loading = true,
          },
          {
            "encoding",
            fmt = string.upper,
            cond = conditions.hide_in_width,
            color = { gui = "bold" },
          },
        },
        lualine_y = {
          {
            lsp,
            icon = icons.Lsp .. " ",
            color = { gui = "bold" },
          },
        },
        lualine_z = {
          {
            "progress",
            color = { gui = "bold" },
          },
        },
      },
    }
  end,
}
