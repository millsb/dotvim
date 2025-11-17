vim.keymap.set('n', '<leader>mr', ':lua require("neotest").run.run({ strategy="integrated" })<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ms', ':lua require("neotest").run.stop()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mo', ':lua require("neotest").output.open()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>m0', ':lua require("neotest").output.open({ enter = true})<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mi', ':lua require("neotest").summary.toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>mf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>]n', ':lua require("neotest").jump.prev({ status = failed })<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>[n', ':lua require("neotest").jump.next({ status = failed })<CR>', { noremap = true, silent = true })

vim.diagnostic.config({
	virtual_text = true,
	float = nil
}, vim.api.nvim_create_namespace('neotest'))

require("neotest").setup({
  adapters = {
    require("neotest-python")({ dap = { justMyCode = true }, pytest_discover_instances = true  }),
		require("neotest-vitest")({
			vitestCommand = "npx vitest --coverage run",
			vitestConfigFile = "vitest.config.ts",
			-- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
			filter_dir = function(name, rel_path, root)
				return name ~= "node_modules" and name ~= "dist"
			end,
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
		require('neotest-jest')({
			jestCommand = "npm test --coverage --",
			jestConfigFile = "custom.jest.config.ts",
			env = { CI = true },
			-- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
			filter_dir = function(name, rel_path, root)
				return name ~= "node_modules" and name ~= "dist"
			end,
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),
  },
	diagnostic = {
		enabled = true,
		severity = 1,
	}
})

