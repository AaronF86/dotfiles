local lspconfig = require('lspconfig')

-- Function to simplify LSP setup
local function setup_lsp(server_name, opts)
    lspconfig[server_name].setup(opts)
end

-- Common on_attach function for key mappings
local function on_attach(client, bufnr)
    local opts = { noremap = true, silent = true }
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)
end

-- Rust setup
setup_lsp("rust_analyzer", {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 }
})

-- TOML setup
setup_lsp("taplo", {
    on_attach = on_attach,
})

-- Lua setup
setup_lsp("lua_ls", {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
        }
    }
})

-- Nix setup
setup_lsp("nil_ls", {
    on_attach = on_attach,
})

-- Auto-start specific LSPs only for corresponding file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rust", "toml", "lua", "nix" },
    callback = function(args)
        if args.match == "nix" then
            require("lspconfig").nil_ls.setup({})
        elseif args.match == "lua" then
            require("lspconfig").lua_ls.setup({})
        end
    end,
})
