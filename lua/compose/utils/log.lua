local M = {}

local levels = vim.log.levels

local function notify(msg, level)
	vim.notify(msg, level, { title = "compose.nvim" })
end

M.inspect = function(msg)
	--    vim.notify(vin.inspect(msg), levels.INFO, {title = "compose.nvim"})
	-- vim.inspect(vim.notify(msg, levels.INFO, { title = "compose.nvim" }))
end
M.info = function(msg)
	notify(msg, levels.INFO)
end
M.warn = function(msg)
	notify(msg, levels.WARN)
end
M.error = function(msg)
	notify(msg, levels.ERROR)
end

return M
