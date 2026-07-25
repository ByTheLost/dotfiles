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

    vim.cmd("write " .. vim.fn.fnameescape(name))

    vim.notify("**" .. vim.fn.fnamemodify(name, ":t") .. "** Saved!", vim.log.levels.INFO, {
      title = "Save",
      timeout = 2000,
      position = "top_right",
      markdown = true,
    })
  else
    vim.cmd("write")

    local filename = vim.fn.expand("%:t")

    vim.notify("**" .. filename .. "** Saved!", vim.log.levels.INFO, {
      title = "Save",
      timeout = 1500,
      position = "top_right",
      markdown = true,
    })
  end
end)

-- Navigation 10 lines
map("n", "<C-j>", "10j", { desc = "Move down 10 lines" })
map("n", "<C-k>", "10k", { desc = "Move up 10 lines" })

map("n", "<leader>qq", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>ya", "ggVG\"+y", { desc = "Yank all to clipboard" })

-------------------------------------------------
-- Snacks Picker
-------------------------------------------------

-- Files
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find Files" })

map("n", "<leader>fo", function()
  Snacks.picker.recent()
end, { desc = "Recent Files" })

-- Grep
map("n", "<leader>fg", function()
  Snacks.picker.grep()
end, { desc = "Live Grep" })

map({ "n", "x" }, "<leader>fw", function()
  Snacks.picker.grep_word()
end, { desc = "Grep Word Under Cursor" })

-- Buffers
map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

-- Help
map("n", "<leader>fh", function()
  Snacks.picker.help()
end, { desc = "Help Tags" })

-- Git
map("n", "<leader>gf", function()
  Snacks.picker.git_files()
end, { desc = "Git Files" })

map("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Git Status" })

map("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Git Branches" })

map("n", "<leader>gc", function()
  Snacks.picker.git_log()
end, { desc = "Git Commits" })

-- LSP
map("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "Definitions" })

map("n", "gr", function()
  Snacks.picker.lsp_references()
end, { desc = "References" })

map("n", "gi", function()
  Snacks.picker.lsp_implementations()
end, { desc = "Implementations" })

map("n", "<leader>fs", function()
  Snacks.picker.lsp_symbols()
end, { desc = "Document Symbols" })

-- Diagnostics
map("n", "<leader>fd", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Document Diagnostics" })

map("n", "<leader>fD", function()
  Snacks.picker.diagnostics()
end, { desc = "Workspace Diagnostics" })

-- Resume
map("n", "<leader>fl", function()
  Snacks.picker.resume()
end, { desc = "Resume Last Search" })

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
  local ok, harpoon = pcall(require, "harpoon")
  if not ok then
    vim.notify("Harpoon no está cargado", vim.log.levels.ERROR)
    return
  end

  harpoon:list():add()

  vim.notify("󰛢 File added to Harpoon", vim.log.levels.INFO, {
    title = "Harpoon",
    timeout = 2000,
    position = "top_right",
  })
end)

-- Abrir menú
map("n", "<leader>h", function()
  local ok, harpoon = pcall(require, "harpoon")
  if not ok then
    vim.notify("Harpoon no está cargado", vim.log.levels.ERROR)
    return
  end

  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Navegación rápida
for i = 1, 9 do
  map("n", "<leader>" .. i, function()
    local ok, harpoon = pcall(require, "harpoon")
    if not ok then
      vim.notify("Harpoon no está cargado", vim.log.levels.ERROR)
      return
    end

    harpoon:list():select(i)
  end, { desc = "Harpoon " .. i })
end

-------------------------------------------------
-- Snacks Explorer Keymaps
-------------------------------------------------

map("n", "<leader>t", function()
  Snacks.picker.explorer()
end, { desc = "Snacks Explorer" })

-------------------------------------------------
-- Rename Keymaps
-------------------------------------------------

local function replace_word()
  local word = vim.fn.expand('<cword>')
  local escaped = vim.fn.escape(word, '/\\')

  local replacement = vim.fn.escape(vim.fn.input("Replace '" .. word .. "' with: "), '/\\~')

  if replacement ~= "" then
    vim.cmd('%s/' .. escaped .. '/' .. replacement .. '/g')
    print("'" .. word .. "' replaced with '" .. replacement .. "' globally.")
  else
    print("Replacement canceled")
  end
end

map('n', '<leader>rw', replace_word, { desc = 'Global replace word under cursor' })

-------------------------------------------------
-- Gitsigns Keymaps
-------------------------------------------------

map("n", "<leader>gp", function()
  require("gitsigns").preview_hunk()
end, { desc = "Git preview hunk" })

map("n", "<leader>ghs", function()
  require("gitsigns").stage_hunk()
end, { desc = "Git stage hunk" })

map("n", "<leader>ghr", function()
  require("gitsigns").reset_hunk()
end, { desc = "Git reset hunk" })

map("n", "<leader>ghb", function()
  require("gitsigns").blame_line()
end, { desc = "Git blame line" })

map("n", "<leader>gd", function()
  require("gitsigns").diffthis()
end, { desc = "Git diff this" })

-------------------------------------------------
-- New Buffer Empty
-------------------------------------------------

map("n", "<leader><tab><tab>", function()
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_set_current_buf(buf)
end, { desc = "New scratch buffer" })

-------------------------------------------------
-- Lazy
-------------------------------------------------

map("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Open Lazy UI" })

-------------------------------------------------
-- Grug-far
-------------------------------------------------

map("n", "<leader>fr", function()
  require("grug-far").open()
end, { desc = "Search & Replace (GrugFar)" })

-------------------------------------------------
-- Markdown-Preview
-------------------------------------------------

map("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop Markdown Preview" })
map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })

-------------------------------------------------
-- Atone
-------------------------------------------------

map("n", "<leader>u", "<cmd>Atone<CR>", {
  desc = "Undo Tree",
})
