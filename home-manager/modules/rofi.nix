{ config, pkgs, ... }:
{
home.packages = with pkgs; [
  rofi
  rofi-calc
];

programs.rofi = {
  enable = true;
  theme = "gruvbox-dark"; # You can change this to any available theme
  extraConfig = {
    modi = "drun,run";
    show-icons = true;
    terminal = "ghossty";
    display-drun = "Applications";
    display-run = "Run";
    display-calc = "Calculator";
    sidebar-mode = true;
  };
};

}