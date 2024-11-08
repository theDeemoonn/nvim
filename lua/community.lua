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
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        enabled = true, -- Автосохранение включено
        execution_message = {
          message = function() return "" end, -- Сообщения можно отключить
        },
        events = { "InsertLeave", "TextChanged" }, -- События для срабатывания автосохранения
        debounce_delay = 135, -- Задержка перед сохранением (в миллисекундах)
        conditions = {
          exists = true, -- Проверяет, существует ли файл
          filename_is_not = {}, -- Исключить файлы с определёнными именами
          filetype_is_not = {}, -- Исключить файлы с определёнными типами
          modifiable = true, -- Только для редактируемых буферов
        },
        write_all_buffers = false, -- Сохранять только текущий буфер
        on_off_commands = true, -- Команды включения/выключения автосохранения
        clean_command_line_interval = 0, -- Интервал очистки командной строки
      }
    end,
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
