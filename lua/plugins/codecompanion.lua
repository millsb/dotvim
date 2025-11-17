require("codecompanion").setup({
	opts = {
		log_level = "DEBUG",
	},
	adapters = {
		qwen = function()
			return require("codecompanion.adapters").extend("ollama", {
				schema = {
					model = {
						default = "qwen2.5-coder:14b"
					}
				}
			})
		end
	},
	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter= "copilot"
		},
	}
})
