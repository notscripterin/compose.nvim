local M = {}

local log = require("compose.utils.log")

local function trim(s)
	return s:gsub("^%s*(.-)%s*$", "%1")
end

function M.init() end

function M.sync() end

function M.run() end

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_user_command("Compose init", M.init, {})
	vim.api.nvim_create_user_command("Compose sync", M.sync, {})
	vim.api.nvim_create_user_command("Compose run", M.run, {})
end

return M
