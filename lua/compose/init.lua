local M = {}

local log = require("compose.utils.log")
local async = require("plenary.async")
local input = async.wrap(vim.ui.input, 2)
local select = async.wrap(vim.ui.select, 3)

local function trim(s)
	return s:gsub("^%s*(.-)%s*$", "%1")
end

local function get_compose_templates()
	local obj = vim.system({ "compose", "list-templates" }):wait()
	log.inspect(obj)
end

function M.init()
	local templates = get_compose_templates()
	async.void(function()
		local project_name = trim(input({ prompt = "App name: " }))
		local project_id = trim(input({ prompt = "Package (e.g., org.example.myapp): " }))

		log.info(project_name .. project_id)
	end)()
end

function M.sync() end

function M.run() end

function M.laucher() end

function M.release() end

function M.setup(opts)
	opts = opts or {}

	if vim.fn.executable("compose") == 1 then
		log.error("Please install compose-cli")
	else
		vim.api.nvim_create_user_command("Compose", function(_opts)
			local subcmd = _opts.args

			if subcmd == "init" then
				M.init()
			elseif subcmd == "sync" then
				M.sync()
			elseif subcmd == "run" then
				M.run()
			elseif subcmd == "launcher" then
				M.launcher()
			elseif subcmd == "release" then
				M.release()
			else
				log.error("Unknown argument '" .. subcmd .. "'")
			end
		end, {
			nargs = 1,
			complete = function()
				return { "init", "sync", "run", "launcher", "release" }
			end,
		})
	end
end

return M
