-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable lsp semantic tokens for highlighting
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local blacklist = { "rust-analyzer", "marksman" }
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      for _, name in ipairs(blacklist) do
        if client.name == name then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end
    end
  end,
})

-- disable colorcolumn for all filetypes
vim.cmd([[autocmd FileType * set colorcolumn=0]])

-- change textwidth and activate colorcolumn for markdown files only
vim.cmd([[autocmd FileType markdown set tw=99 colorcolumn=100]])

-- change textwidth and activate colorcolumn for neorg files only
vim.cmd([[autocmd FileType norg set tw=99 colorcolumn=100]])

-- stop auto commenting on new line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
