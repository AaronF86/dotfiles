{ config, pkgs, inputs, ... }: 

{
  imports = [
      inputs.zen-browser.homeModules.beta
];

  home.username = "aaron";
  home.homeDirectory = "/home/aaron";
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Aaron Dev";
    userEmail = "aaron@potassium.sh";
  };

      gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };

    qt = {
      enable = true;
      platformTheme = "gtk";
      style = {
        name = "adwaita-dark";
      };
    };


 home.packages = with pkgs; [
    wofi
    waybar
    dunst
    swayidle
    wl-clipboard
    xfce.thunar

    ghostty
    mattermost-desktop
    obs-studio
    discord
    vscode
    jetbrains.idea-ultimate
    gradle
  ]
}