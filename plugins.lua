local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/root/.config/nvim/lua/packer'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

return require('packer').startup(function(use)
	use "wbthomason/packer.nvim"
	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  	use 'L3MON4D3/LuaSnip' -- Snippets plugin	
	use 'williamboman/nvim-lsp-installer'
	use {'nvim-telescope/telescope.nvim', tag = '0.1.1',
 		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-tree/nvim-tree.lua',
  		requires = {'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
  		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use 'Sainnhe/everforest'
	use {
  		'nvim-lualine/lualine.nvim',
  		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- using packer.nvim
	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	use {'goolord/alpha-nvim',
    	requires = { 'nvim-tree/nvim-web-devicons' },
    	config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
	}
	-- Lua
	use {
	  "folke/which-key.nvim",
	  config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	  end
	}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})

	use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }
end)

