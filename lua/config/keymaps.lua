local map = vim.keymap.set

-------------------------------------------------
-- Nvim Keymaps
-------------------------------------------------

map("n", "<leader>w", function()
  local file = vim.fn.expand("%")

  if file == "" then
    local name = vim.fn.input("Save as: ")

    if name == "" then
      vim.notify("Cancelled", vim.log.levels.WARN)
      return
    end

    vim.cmd("write " .. name)
    vim.notify("Saved as " .. name, vim.log.levels.INFO, {
      title = "Save",
      timeout = 2000,
      position = "top_right",
    })
  else
    vim.cmd("write")
    vim.notify("File saved!", vim.log.levels.INFO, {
      title = "Save",
      timeout = 1500,
      position = "top_right",
    })
  end
end, { desc = "Smart save (prompt only for new files)" })
map("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<C-a>", "ggVG\"+y")

-------------------------------------------------
-- Telescope Keymaps
-------------------------------------------------

-- map("n", "<leader>ff", function()
--   require("telescope.builtin").find_files()
-- end)
--
-- map("n", "<leader>fg", function()
--   require("telescope.builtin").live_grep()
-- end)
--
-- map("n", "<leader>fb", function()
--   require("telescope.builtin").buffers()
-- end)
--
-- map("n", "<leader>fh", function()
--   require("telescope.builtin").help_tags()
-- end)

-------------------------------------------------
-- Fzf-lua
-------------------------------------------------

-- Files
map("n", "<leader>ff", function()
  require("fzf-lua").files()
end, { desc = "Find Files" })

map("n", "<leader>fo", function()
  require("fzf-lua").oldfiles()
end, { desc = "Recent Files" })

-- Grep
map("n", "<leader>fg", function()
  require("fzf-lua").live_grep()
end, { desc = "Live Grep" })

map("n", "<leader>fw", function()
  require("fzf-lua").grep_cword()
end, { desc = "Grep Word Under Cursor" })

-- Buffers
map("n", "<leader>fb", function()
  require("fzf-lua").buffers()
end, { desc = "Buffers" })

-- Help
map("n", "<leader>fh", function()
  require("fzf-lua").help_tags()
end, { desc = "Help Tags" })

-- Git
map("n", "<leader>gf", function()
  require("fzf-lua").git_files()
end, { desc = "Git Files" })

map("n", "<leader>gs", function()
  require("fzf-lua").git_status()
end, { desc = "Git Status" })

map("n", "<leader>gb", function()
  require("fzf-lua").git_branches()
end, { desc = "Git Branches" })

map("n", "<leader>gc", function()
  require("fzf-lua").git_commits()
end, { desc = "Git Commits" })

-- LSP
map("n", "gd", function()
  require("fzf-lua").lsp_definitions()
end, { desc = "Definitions" })

map("n", "gr", function()
  require("fzf-lua").lsp_references()
end, { desc = "References" })

map("n", "gi", function()
  require("fzf-lua").lsp_implementations()
end, { desc = "Implementations" })

map("n", "<leader>fs", function()
  require("fzf-lua").lsp_document_symbols()
end, { desc = "Document Symbols" })

-- Diagnostics
map("n", "<leader>fd", function()
  require("fzf-lua").diagnostics_document()
end, { desc = "Document Diagnostics" })

map("n", "<leader>fD", function()
  require("fzf-lua").diagnostics_workspace()
end, { desc = "Workspace Diagnostics" })

-- Resume
map("n", "<leader>fl", function()
  require("fzf-lua").resume()
end, { desc = "Resume Last Search" })

-- Visual Mode Grep
map("x", "<leader>sg", function()
  require("fzf-lua").grep_visual()
end, { desc = "Grep Selection" })

-------------------------------------------------
-- Flash Keymaps
-------------------------------------------------

map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

map({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

-------------------------------------------------
-- Harpoon Keymaps
-------------------------------------------------

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

-- Abrir menú 
map("n", "<leader>h", function()
  local harpoon = require("harpoon")
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Navegación rápida
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    local ok, harpoon = pcall(require, "harpoon")
    if not ok then
      vim.notify("Harpoon no está cargado", vim.log.levels.ERROR)
      return
    end

    harpoon:list():select(i)
  end, { desc = "Harpoon " .. i })
end

-------------------------------------------------
-- NeoTree Keymaps
-------------------------------------------------

vim.keymap.set("n", "<leader>t", function()
  require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle Neo-tree" })

-------------------------------------------------
-- Rename Keymaps
-------------------------------------------------

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

-------------------------------------------------
-- Gitsigns Keymaps
-------------------------------------------------

vim.keymap.set("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Git preview hunk" })

vim.keymap.set("n", "<leader>gs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Git stage hunk" })

vim.keymap.set("n", "<leader>gr", function()
  require("gitsigns").reset_hunk()
end, { desc = "Git reset hunk" })

vim.keymap.set("n", "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "Git blame line" })

vim.keymap.set("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, { desc = "Git diff this" })

-------------------------------------------------
-- New Buffer Empty
-------------------------------------------------

vim.keymap.set("n", "<leader><tab><tab>", function()
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_set_current_buf(buf)
end, { desc = "New scratch buffer" })

-------------------------------------------------
-- Lazy
-------------------------------------------------

map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy UI" })

-------------------------------------------------
-- Grug-far
-------------------------------------------------

vim.keymap.set("n", "<leader>fr", function()
  require("grug-far").open()
end, { desc = "Search & Replace (GrugFar)" })

-------------------------------------------------
-- Markdown-Preview
-------------------------------------------------

vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop Markdown Preview" })
vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })

-------------------------------------------------
-- Atone
-------------------------------------------------

vim.keymap.set("n", "<leader>u", "<cmd>Atone<CR>", {
  desc = "Undo Tree",
})
