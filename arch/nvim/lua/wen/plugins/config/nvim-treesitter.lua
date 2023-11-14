return function()
local init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treeitter** module to be loaded in time.
    -- Luckily, the only thins that those plugins need are the custom queries, which we make available
    -- during startup.
    require("lazy.core.loader").add_to_rtp(plugin)
    require "nvim-treesitter.query_predicates"
end

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
        "bash",
        "c",
        "html",
        "css",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "java",
        "latex",
        "dockerfile",
        "gitignore",
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },

    -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
    context_commentstring = { enable = true, enable_autocmd = false },
}
end
