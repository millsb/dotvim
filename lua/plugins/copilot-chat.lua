local chat = require("CopilotChat")
local select = require("CopilotChat.select")

chat.setup(opts)
-- Setup the CMP integration
require("CopilotChat.integrations.cmp").setup()

vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
	chat.ask(args.args, { selection = select.visual })
end, { nargs = "*", range = true })

-- Inline chat with Copilot
vim.api.nvim_create_user_command("CopilotChatInline", function(args)
	chat.ask(args.args, {
		selection = select.visual,
		window = {
			layout = "float",
			relative = "cursor",
			width = 1,
			height = 0.4,
			row = 1,
		},
	})
end, { nargs = "*", range = true })

-- Restore CopilotChatBuffer
vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
	chat.ask(args.args, { selection = select.buffer })
end, { nargs = "*", range = true })

-- Custom buffer for CopilotChat
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "copilot-*",
	callback = function()
		vim.opt_local.relativenumber = true
		vim.opt_local.number = true

		-- Get current filetype and set it to markdown if the current filetype is copilot-chat
		local ft = vim.bo.filetype
		if ft == "copilot-chat" then
			vim.bo.filetype = "markdown"
		end
	end,
})
