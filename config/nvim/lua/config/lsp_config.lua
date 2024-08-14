-- lsp_config.lua - LSP Configuration for Neovim

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "tsserver", "clangd" }, -- Add LSP servers you need here
})

-- LSP settings
local nvim_lsp = require('lspconfig')

-- Enable LSP servers
nvim_lsp.pyright.setup{}
nvim_lsp.tsserver.setup{}
nvim_lsp.clangd.setup{
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    cmd = { 'clangd', '--background-index' },  -- Clangd 的执行命令和选项
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },  -- 支持的文件类型
    root_dir = nvim_lsp.util.root_pattern('.git', 'compile_commands.json'),  -- 项目根目录查找模式
    settings = {
        clangd = {
            -- 设置头文件搜索路径
            -- 在这里添加你的头文件路径设置
            searchPaths = {
              "/home/saraki/document/xv6-labs-2022"
            }
        }
    }
}

-- Add more LSP servers here
-- nvim_lsp.<server>.setup{}

-- nvim-cmp setup
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline('?', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
