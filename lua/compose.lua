local M = {}

local log = require("compose.log")

function M.sync()
	log.info("Namaste from compose-nvim")
	log.warn("Namaste from compose-nvim")
	log.error("Namaste from compose-nvim")
end

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_user_command("ComposeSync", M.sync, {})
end

return M
