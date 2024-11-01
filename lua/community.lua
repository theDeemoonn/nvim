-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  {
    "Exafunction/codeium.vim",
    lazy = false,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
          border = "rounded",
          highlighter = wilder.basic_highlighter(),
          highlights = {
            border = "Normal",
          },
        })
      )
    end,
    requires = {
      { "romgrk/fzy-lua-native", run = "make" },
    },
  },
}
