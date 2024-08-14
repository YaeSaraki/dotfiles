
vim.cmd('source ~/.vimrc')


--- ------------------------
---  Plug
--- ------------------------

-- Set the install path
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- Theme
require('monokai').setup { palette = require('monokai').ristretto }
--require('monokai').setup { palette = require('monokai').soda }
--require('monokai').setup { palette = require('monokai').pro }
-- require('monokai').setup { palette = require('monokai') }

-- Plugins configuration
require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  -- lsp cmp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Auto pairs plugin
  use 'jiangmiao/auto-pairs'

  -- Theme
  use 'tanvirtin/monokai.nvim'

end,
config = {
    -- Configure packer to use Chinese mirrors
    git = {
	default_url_format = 'https://github.com/%s'
    },
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end
    }
  }
})

--- ------------------------
---  Load LSP settings
--- ------------------------

require('config/lsp_config')
