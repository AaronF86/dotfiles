{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs; [
      vimPlugins.packer-nvim
    ];
  };

  xdg.configFile = {
    "nvim" = {
      source = ../../../nvim;  
      recursive = true;        
    };
  };
}