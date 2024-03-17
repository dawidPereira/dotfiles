-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, desc, opts)
  local outer_opts = vim.tbl_extend("force", { noremap = true, silent = true, desc = desc or "" }, opts or {})
  vim.keymap.set(mode, lhs, rhs, outer_opts)
end

-- Center buffer while navigating
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "N", "nzz")
map("n", "n", "nzz")
map("n", "G", "Gzz")
map("n", "gg", "ggzz")
map("n", "<C-i>", "<C-i>zz")
map("n", "<C-o>", "<C-o>zz")
map("n", "%", "%zz")
map("n", "*", "*zz")
map("n", "#", "#zz")

-- Press 'S' for quick find/replace for the word under the cursor
map("n", "<leader>wr", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end, "[W]ord [R]eplace")

-- Press 'U' for redo
map("n", "U", "<C-r>", "Press [U] for redo")

-- Turn off highlighted results
map("n", "<leader>no", "<cmd>noh<cr>", "[N]o [H]ighlith")

-- Diagnostics

-- Goto next diagnostic of any severity
map("n", "]d", function()
  vim.diagnostic.goto_next({})
  vim.api.nvim_feedkeys("zz", "n", false)
end, "Go to next[]] [D]iagnostic")

-- Goto previous diagnostic of any severity
map("n", "[d", function()
  vim.diagnostic.goto_prev({})
  vim.api.nvim_feedkeys("zz", "n", false)
end, "Go to previous[[] [D]iagnostic")

-- Goto next error diagnostic
map("n", "]e", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end, "Go to next[]] diagnostic [E]rror")

-- Goto previous error diagnostic
map("n", "[e", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  vim.api.nvim_feedkeys("zz", "n", false)
end, "Go to previous[[] diagnostic [E]rror")

-- Goto next warning diagnostic
map("n", "]w", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end, "Go to next[]] diagnostic [W]arning")

-- Goto previous warning diagnostic
map("n", "[w", function()
  vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
  vim.api.nvim_feedkeys("zz", "n", false)
end, "Go to previous[[] diagnostic [W]arning")

-- Open the diagnostic under the cursor in a float window
map("n", "<leader>d", function()
  vim.diagnostic.open_float({
    border = "rounded",
  })
end, "Open [D]iagnostics under cursor")

-- Place all dignostics into a qflist
map("n", "<leader>xd", vim.diagnostic.setqflist, "Quickfi[X] list [D]iagnostics")

-- Navigate to next qflist item
map("n", "<leader>cn", ":cnext<cr>zz")

-- Navigate to previos qflist item
map("n", "<leader>cp", ":cprevious<cr>zz")

-- Open the qflist
map("n", "<leader>co", ":copen<cr>zz")

-- Close the qflist
map("n", "<leader>cc", ":cclose<cr>zz")

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
map("n", "<leader>M", ":MaximizerToggle<cr>", "[M]aximize window")
map("n", "<leader>vs", ":vsplit<cr>", "[V]ertical [S]plit")
map("n", "<leader>hs", ":split<cr>", "[H]orizonta [S]plit")

-- Resize split windows to be equal size
map("n", "<leader>=", "<C-w>=")

-- Press leader rw to rotate open windows
map("n", "<leader>rw", ":RotateWindows<cr>", { desc = "[R]otate [W]indows" })

-- Press gx to open the link under the cursor
map("n", "gx", ":sil !open <cWORD><cr>", { silent = true })

-- GIT
map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", "[G]it [B]lame")

-- Telescope keybinds --

map("n", "<leader>?", function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "[?] Fuzzily search in current buffer]" })

map("n", "<leader>cs", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
    previewer = false,
  }))
end, { desc = "[C]heck, [S]pelling suggestions" })

-- Symbol Outline keybind
map("n", "<leader>so", ":SymbolsOutline<cr>")

-- Insert --
-- Map double base movement to <esc>
map("i", "jj", "<esc>")
map("i", "kk", "<esc>")
map("i", "hh", "<esc>")
map("i", "ll", "<esc>")

-- Visual --
-- Disable Space bar since it'll be used as the leader key
map("v", "<space>", "<nop>")

-- Paste without losing the contents of the register
map("n", "<A-j>", ":m '>+1<CR>gv=gv")
map("n", "<A-k>", ":m '<-2<CR>gv=gv")

-- Reselect the last visual selection
map("x", "<<", function()
  map("x", "<leader>p", '"_dP')
  -- Move selected text up/down in visual mode
  vim.cmd("normal! <<")
  vim.cmd("normal! gv")
end)

map("x", ">>", function()
  vim.cmd("normal! >>")
  vim.cmd("normal! gv")
end)

-- Terminal --
-- Enter normal mode while in a terminal
map("t", "<esc>", [[<C-\><C-n>]])
map("t", "jj", [[<C-\><C-n>]])

-- Window navigation from terminal
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]])

-- Reenable default <space> functionality to prevent input delay
map("t", "<space>", "<space>")

-- Markdown preview toggle
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", "[M]arkdown [P]review")
