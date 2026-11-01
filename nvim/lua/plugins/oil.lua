-- Oil.nvim: Edit your filesystem like a buffer
-- URL: https://github.com/stevearc/oil.nvim

return {
  "stevearc/oil.nvim",

  -- Carga el plugin cuando uses alguno de estos atajos
  keys = {
    { "<leader>-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    { "-", "<CMD>Oil --float<CR>", desc = "Open Oil Float" },
  },

  opts = {
    -- Reemplaza netrw
    default_file_explorer = true,

    -- Restaura las opciones de la ventana al salir
    restore_win_options = true,

    -- Preguntar antes de operaciones importantes
    skip_confirm_for_simple_edits = false,

    -- Preguntar si hay cambios sin guardar
    prompt_save_on_select_new_entry = true,

    -- Desactivar los keymaps por defecto
    use_default_keymaps = false,

    -------------------------------------------------
    -- Keymaps
    -------------------------------------------------

    keymaps = {
      ["g?"] = "actions.show_help",

      ["<CR>"] = "actions.select",

      ["<C-s>"] = {
        "actions.select",
        opts = { vertical = true },
        desc = "Vertical Split",
      },

      ["<C-v>"] = {
        "actions.select",
        opts = { horizontal = true },
        desc = "Horizontal Split",
      },

      ["<C-t>"] = {
        "actions.select",
        opts = { tab = true },
        desc = "New Tab",
      },

      ["<C-p>"] = "actions.preview",

      ["<C-r>"] = "actions.refresh",

      ["-"] = "actions.parent",

      ["_"] = "actions.open_cwd",

      ["`"] = "actions.cd",

      ["~"] = {
        "actions.cd",
        opts = { scope = "tab" },
      },

      ["gs"] = "actions.change_sort",

      ["gx"] = "actions.open_external",

      ["g."] = "actions.toggle_hidden",

      ["q"] = "actions.close",
    },

    -------------------------------------------------
    -- Columnas
    -------------------------------------------------

    columns = {
      "icon",
    },

    -------------------------------------------------
    -- Vista
    -------------------------------------------------

    view_options = {
      show_hidden = true,

      natural_order = true,

      case_insensitive = false,

      is_hidden_file = function(name)
        return vim.startswith(name, ".")
      end,

      is_always_hidden = function(name)
        return name == ".."
      end,

      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
    },

    -------------------------------------------------
    -- Floating Window
    -------------------------------------------------

    float = {
      padding = 2,

      max_width = 100,
      max_height = 30,

      border = "rounded",

      preview_split = "right",

      win_options = {
        winblend = 0,
      },
    },

    -------------------------------------------------
    -- Preview
    -------------------------------------------------

    preview = {
      border = "rounded",

      update_on_cursor_moved = true,

      max_width = 0.9,
      min_width = { 40, 0.4 },

      max_height = 0.9,
      min_height = { 5, 0.1 },

      win_options = {
        winblend = 0,
      },
    },

    -------------------------------------------------
    -- Confirmation
    -------------------------------------------------

    confirmation = {
      border = "rounded",

      max_width = 0.9,
      min_width = { 40, 0.4 },

      max_height = 0.9,
      min_height = { 5, 0.1 },

      win_options = {
        winblend = 0,
      },
    },

    -------------------------------------------------
    -- Progress
    -------------------------------------------------

    progress = {
      border = "rounded",

      max_width = 0.9,
      min_width = { 40, 0.4 },

      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },

      win_options = {
        winblend = 0,
      },
    },

    -------------------------------------------------
    -- SSH
    -------------------------------------------------

    ssh = {
      border = "rounded",
    },
  },

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function(_, opts)
    local oil = require("oil")

    oil.setup(opts)

    -- Opciones visuales para Oil
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.opt_local.colorcolumn = ""
        vim.opt_local.signcolumn = "no"
      end,
    })

    -- Abrir Oil en el directorio del archivo actual
    vim.keymap.set("n", "<leader>O", function()
      local current = vim.api.nvim_buf_get_name(0)

      if current ~= "" then
        oil.open(vim.fn.fnamemodify(current, ":h"))
      else
        oil.open()
      end
    end, {
      desc = "Oil current file directory",
    })
  end,
}
