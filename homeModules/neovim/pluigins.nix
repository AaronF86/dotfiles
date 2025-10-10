{pkgs, config, ...}: {
    programs.neovim.plugins = with pkgs.vimPlugins; [
        telescope-nvim
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        orgmode
        markdown-preview-nvim
        doom-one-nvim
        lualine-nvim
        nvim-web-devicons
    ];
}