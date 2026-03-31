local map = vim.keymap.set

-- Nvim Keymaps
-- map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>w", function()
  vim.cmd("write")

  vim.notify("File saved successfully!", "info", {
    title = "Save",
    timeout = 2000,
    render = "default",
    stages = "fade_in_slide_out",
    position = "top_right",
  })
end, { desc = "Save file with notification" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Telescope Keymaps
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end)

map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end)

map("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end)

map("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end)

-- Flash Keymaps
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

-- Oil Keymaps
vim.keymap.set("n", "-", function()
  require("oil").open_float()
end, { desc = "Oil float" })


-- Harpoon Keymaps
-- Añadir archivo actual a Harpoon
map("n", "<leader>a", function()
  local harpoon = require("harpoon")
  harpoon:list():add()

  vim.notify("󰛢 File added to Harpoon", "info", {
    title = "Harpoon",
    timeout = 2000,
    position = "top_right",
  })
end)

-- Abrir menú de Harpoon
map("n", "<leader>h", function()
  local harpoon = require("harpoon")
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Navegación rápida
map("n", "<leader>1", function()
  require("harpoon"):list():select(1)
end)

map("n", "<leader>2", function()
  require("harpoon"):list():select(2)
end)

map("n", "<leader>3", function()
  require("harpoon"):list():select(3)
end)

map("n", "<leader>4", function()
  require("harpoon"):list():select(4)
end)

-- NeoTree Keymaps
vim.keymap.set("n", "<leader>t", function()
  require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle Neo-tree" })

-- Rename Keymaps
local function replace_word()
  local word = vim.fn.expand('<cword>')
  local escaped = vim.fn.escape(word, '/\\')

  local replacement = vim.fn.input("Replace '" .. word .. "' with: ")

  if replacement ~= "" then
    vim.cmd('%s/' .. escaped .. '/' .. replacement .. '/g')
    print("'" .. word .. "' replaced with '" .. replacement .. "' globally.")
  else
    print("Replacement canceled")
  end
end

vim.keymap.set('n', '<leader>rw', replace_word, { desc = 'Global replace word under cursor' })
