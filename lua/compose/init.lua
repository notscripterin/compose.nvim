local M = {}

local log = require("compose.utils.log")

local function trim(s)
	return s:gsub("^%s*(.-)%s*$", "%1")
end

function M.init()
	log.info("compose init")
end

function M.sync() end

function M.run() end

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_user_command("Compose", function(_opts)
		local subcmd = _opts.args

		if subcmd == "init" then
			M.init()
		elseif subcmd == "sync" then
			M.sync()
		elseif subcmd == "run" then
			M.run()
		else
			log.error("Unknown argument '" .. subcmd .. "'")
		end
	end, {
		nargs = 1,
		complete = function()
			return { "init", "sync", "run" }
		end,
	})
end

return M
