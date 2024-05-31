local M = {}

-- Insert mode non-recursive key mapping function
M.inoremap = function(lhs, rhs, desc, buffer)
	vim.keymap.set("i", lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
		buffer = buffer,
	})
end

-- Normal mode non-recursive key mapping function
M.nnoremap = function(lhs, rhs, desc, buffer)
	vim.keymap.set("n", lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
		buffer = buffer,
	})
end

-- Terminal mode non-recursive key mapping function
M.tnoremap = function(lhs, rhs, desc, buffer)
	vim.keymap.set("t", lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
		buffer = buffer,
	})
end

-- Visual mode (inclusive) non-recursive key mapping function
M.vnoremap = function(lhs, rhs, desc, buffer)
	vim.keymap.set("v", lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
		buffer = buffer,
	})
end

-- Visual mode (exclusive) non-recursive key mapping function
M.xnoremap = function(lhs, rhs, desc, buffer)
	vim.keymap.set("x", lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
		buffer = buffer,
	})
end

return M
