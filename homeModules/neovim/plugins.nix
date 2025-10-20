{ pkgs, config, ... }: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    telescope-nvim
    telescope-fzf-native-nvim
    nvim-lspconfig
    nvim-treesitter.withAllGrammars
    orgmode
    markdown-preview-nvim
    doom-one-nvim
    lualine-nvim
    nvim-web-devicons
    nvim-autopairs
    copilot-vim
    neo-tree-nvim
    plenary-nvim
    nui-nvim
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    luasnip
    cmp_luasnip
    friendly-snippets
    
    lspsaga-nvim
  ];
}
