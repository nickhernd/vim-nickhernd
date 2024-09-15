-- Cargar archivo de plugins
require('plugins')

-- Configuración básica
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.completeopt = {'menuone', 'noselect'}
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Cambiar la fuente (esto funciona en algunos terminales/GUIs de Neovim)
vim.opt.guifont = "FiraCode Nerd Font:h12"

-- Configurar tema
vim.cmd[[colorscheme tokyonight-storm]]

-- Configurar Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "vim", "python", "javascript", "typescript", "css", "html"},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

-- Configurar Telescope
local status_ok, telescope = pcall(require, 'telescope')
if status_ok then
  telescope.setup {
    defaults = {
      -- Tus configuraciones por defecto aquí
    },
    pickers = {
      -- Configuraciones de pickers aquí
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  }
  
  -- Intentar cargar la extensión fzf
  pcall(function()
    telescope.load_extension('fzf')
  end)
end

-- Configurar LSP
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {'pyright', 'tsserver', 'html', 'cssls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- Configurar autocompletado
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Configurar autopairs
require('nvim-autopairs').setup{}

-- Configurar nvim-tree
require('nvim-tree').setup{
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

-- Configurar Lspsaga
require('lspsaga').setup{}

-- Configurar Lualine
require('lualine').setup{
  options = {
    theme = 'tokyonight'
  }
}

-- Configurar nvim-comment
require('nvim_comment').setup()

-- Configurar Gitsigns
require('gitsigns').setup()

-- Configurar Which-key
require('which-key').setup{}

-- Mapeos de teclas personalizados
vim.g.mapleader = " "  -- Espacio como tecla líder

-- Funciones auxiliares para mapeos
local map = function(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Mapeos generales
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>e', ':NvimTreeToggle<CR>')
map('n', '<leader>r', ':source $MYVIMRC<CR>')
map('n', '<leader>h', ':nohl<CR>')
map('n', '<leader>n', ':bnext<CR>')
map('n', '<leader>p', ':bprevious<CR>')

-- Nuevo mapeo para abrir el modo de comando
map('n', '<leader>;', ':')

-- Mapeos para ventanas (usando Alt en lugar de Ctrl)
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')
map('n', '<A-l>', '<C-w>l')

-- Nuevos mapeos para manejar ventanas
map('n', '<leader>sv', ':vsplit<CR>')  -- Abrir una nueva ventana vertical
map('n', '<leader>sh', ':split<CR>')   -- Abrir una nueva ventana horizontal
map('n', '<leader>sc', ':close<CR>')   -- Cerrar la ventana actual

-- Mapeos para redimensionar ventanas (usando Alt en lugar de Ctrl)
map('n', '<A-Up>', ':resize +2<CR>')
map('n', '<A-Down>', ':resize -2<CR>')
map('n', '<A-Left>', ':vertical resize -2<CR>')
map('n', '<A-Right>', ':vertical resize +2<CR>')

-- Mapeos en modo inserción
map('i', 'jk', '<Esc>')

-- Mapeos para LSP
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

-- Mapeos para Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')

-- Mapeos para Lspsaga
map('n', 'gh', ':Lspsaga lsp_finder<CR>')
map('n', '<leader>ca', ':Lspsaga code_action<CR>')
map('n', '<leader>hd', ':Lspsaga hover_doc<CR>')

-- Mapeos para nvim-comment
map('n', '<leader>/', ':CommentToggle<CR>')
map('v', '<leader>/', ':CommentToggle<CR>')

-- Mapeos para selección múltiple
map('n', '<leader>v', 'V')  -- Inicia selección de línea
map('v', 'J', ":m '>+1<CR>gv=gv")  -- Mueve bloque seleccionado hacia abajo
map('v', 'K', ":m '<-2<CR>gv=gv")  -- Mueve bloque seleccionado hacia arriba
map('v', '<', '<gv')  -- Mantiene la selección visual al indentar hacia la izquierda
map('v', '>', '>gv')  -- Mantiene la selección visual al indentar hacia la derecha

-- Configuración de EasyMotion
vim.g.EasyMotion_do_mapping = 0 -- Deshabilita los mapeos por defecto
vim.g.EasyMotion_smartcase = 1 -- Habilita smartcase

-- Mapeos personalizados para EasyMotion
map('n', '<Leader>s', '<Plug>(easymotion-overwin-f2)')
map('n', '<Leader>j', '<Plug>(easymotion-j)')
map('n', '<Leader>k', '<Plug>(easymotion-k)')

-- Configuración de Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Configuración adicional de Coc
vim.g.coc_global_extensions = {'coc-json', 'coc-tsserver', 'coc-eslint', 'coc-prettier'}

-- Mapeos para Coc
map('n', '<leader>cd', ':CocDiagnostics<CR>')
map('n', '<leader>cf', ':CocFix<CR>')

-- Configuración adicional
vim.cmd([[
  " Habilitar resaltado de sintaxis
  syntax enable
  
  " Configurar Copilot para que no se active automáticamente
  let g:copilot_filetypes = {
      \ '*': v:false,
      \ 'python': v:true,
      \ 'lua': v:true,
      \ 'javascript': v:true,
      \ 'typescript': v:true,
      \ }
]])
