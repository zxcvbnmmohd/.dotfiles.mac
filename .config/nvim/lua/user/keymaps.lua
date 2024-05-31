local keymap_util = require("utils.keymap-util")

local i = keymap_util.inoremap
local n = keymap_util.nnoremap
local t = keymap_util.tnoremap
local v = keymap_util.vnoremap
local x = keymap_util.xnoremap

-- Movement
for _, arrow in ipairs({
	{
		key = "<left>",
		cmd = "<cmd>echo 'Use H to move!'<CR>",
		desc = "Use H to move!",
	},
	{
		key = "<down>",
		cmd = "<cmd>echo 'Use J to move!'<CR>",
		desc = "Use J to move!",
	},
	{
		key = "<up>",
		cmd = "<cmd>echo 'Use K to move!'<CR>",
		desc = "Use K to move!",
	},
	{
		key = "<right>",
		cmd = "<cmd>echo 'Use L to move!'<CR>",
		desc = "Use L to move!",
	},
}) do
	-- i(arrow.key, arrow.cmd, arrow.desc)
	n(arrow.key, arrow.cmd, arrow.desc)
  t(arrow.key, arrow.cmd, arrow.desc)
	v(arrow.key, "<esc>" .. arrow.cmd, arrow.desc)
	x(arrow.key, "<esc>" .. arrow.cmd, arrow.desc)
end

-- AutoSession
-- n("<leader>sr", "<cmd>SessionRestore<CR>", "Restore session")
-- n("<leader>ss", "<cmd>SessionSave<CR>", "Save session")

-- Bufferline
-- n("<leader>to", "<Cmd>BufferLinePick<CR>", "Pick buffer")
-- n("<leader>tp", "<Cmd>BufferLineTogglePin<CR>", "Toggle pin")
-- n("<leader>tcp", "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete non-pinned buffers")
-- n("<leader>tco", "<Cmd>BufferLineCloseOthers<CR>", "Delete other buffers")
-- n("<leader>tcr", "<Cmd>BufferLineCloseRight<CR>", "Delete buffers to the right")
-- n("<leader>tcl", "<Cmd>BufferLineCloseLeft<CR>", "Delete buffers to the left")
-- n("<leader>}", "<cmd>BufferLineCyclePrev<cr>", "Prev buffer")
-- n("<leader>{", "<cmd>BufferLineCycleNext<cr>", "Next buffer")

-- Conform
n("<leader>F", "<cmd>lua require('conform').format {async = true, lsp_fallback = true}<CR>", "Format buffer")

-- Diagnostics
n("<leader>dn", vim.diagnostic.goto_next, "Next diagnostic")
n("<leader>dp", vim.diagnostic.goto_prev, "Previous diagnostic")
n("<leader>de", vim.diagnostic.open_float, "Open diagnostic error messages")
n("<leader>df", vim.diagnostic.setloclist, "Open diagnostic quickfix list")

-- Neotree
n("<leader>[[", ":Neotree filesystem reveal left<CR>", "Open Neotree File Explorer on the left")
n("<leader>[b", ":Neotree buffers reveal float<CR>", "Open Neotree Buffers Explorer flaoting")
n("<leader>[c", ":Neotree filesystem reveal float<CR>", "Reveal Neotree File Explorer floating")
n("<leader>[g", ":Neotree git_status reveal float<CR>", "Open Neotree Git Explorer floating")
n("<leader>]]", ":Neotree filesystem reveal right<CR>", "Open Neotree File Explorer on the right")

-- Noice
n("<leader>dm", "<cmd>NoiceDismiss<CR>", "Dismiss Message")

-- Nvim Spectre
n("<leader>sr", "<cmd>lua require('spectre').toggle()<CR>", "Toggle Find & Replace")
n("<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word")
n("<leader>sp", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", "Search on current file")
v("<leader>sw", "<esc><cmd>lua require('spectre').open_visual()<CR>", "Search current word")

-- Harpoon
-- n("<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>", "Mark file with harpoon")
-- n("<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Go to next harpoon mark")
-- n("<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Go to previous harpoon mark")
-- n("<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Go to harpoon marked 1")
-- n("<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Go to harpoon marked 2")
-- n("<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Go to harpoon marked 3")
-- n("<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Go to harpoon marked 4")
-- n("<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", "Go to harpoon marked 5")

-- LSP
n("<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition")
n("<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration")
n("<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", "Find references")
n("<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation")
n("<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition")
n("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
n("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action")
n("<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover documentation")
n("<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostics")
n("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous diagnostic")
n("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic")

-- Telescope
n("<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", "Find All Files")
n("<leader>ff", "<cmd>Telescope find_files<CR>", "Find Files")
n("<leader>fo", "<cmd>Telescope oldfiles<CR>", "Find Old Files")
n("<leader>fw", "<cmd>Telescope live_grep<CR>", "Find Words")
n("<leader>fb", "<cmd>Telescope buffers<CR>", "Find Buffers")
n("<leader>ft", "<cmd>Telescope help_tags<CR>", "Find Help Tags")
n("<leader>fk", "<cmd>Telescope keymaps<CR>", "Find Key Maps")
n("<leader>fc", "<cmd>Telescope git_commits<CR>", "Find Commits")
n("<leader>fs", "<cmd>Telescope git_status<CR>", "Find Status")
n("<leader>fd", "<cmd>Telescope diagnostics<CR>", "Find Diagnostics")
n("<leader>fr", "<cmd>Telescope resume<CR>", "Find Resume")
n("<leader>fl", "<cmd>Telescope lsp_references<CR>", "Find LSP References")
n("<leader>fi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
n("<leader>fD", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
n("<leader>ft", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")

-- Todo Comments
n("<leader>ft", "<cmd>TodoTelescope<CR>", "Find TODOs")
n("[t", "<cmd>require('todo-comments').jump_prev()<CR>", "Prev todo comment")
n("]t", "<cmd>require('todo-comments').jump_next()<CR>", "Next todo comment")

-- VimBeGood
-- n("<leader>l", "<cmd>VimBeGood<CR>", false, "Learn Vim")

-- VimMaximizer
-- n("<leader>mw", "<cmd>MaximizerToggle<CR>", "Maximize window")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
