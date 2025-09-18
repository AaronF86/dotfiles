{ config, pkgs, lib, ... }:

{
    # Display manager
    services.displayManager.ly.enable = true;
    services.displayManager.ly.settings = {
      asterisk = ".";
      clock = "%c";
      bigclock= "en";
      animation= "colormix";
      vi_mode = true;
      clear_password = true;

      bg = "0x00282c34";
      border_fg = "0x00c678dd";
      error_bg = "0x00e06c75";
      error_fg = "0x00dcdfe4";
      fg = "0x00dcdfe4";

      cmatrix_fg = "0x00000000"; 
      colormix_col1 = "0x00c678dd";
      colormix_col2 = "0x00c678dd";
      colormix_col3 = "0x00282c34";
    };

    # Hyprland
    programs.hyprland.enable = true;

    programs.steam.enable = true;
    
    # XDG portal for screen sharing and file dialogs
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
      ];
    };
    
    # Essential packages for Hyprland
    environment.systemPackages = with pkgs; [
      waybar
      wofi
      dunst
      grimblast
      swayidle
      wl-clipboard
      xdg-desktop-portal-hyprland
    ];

}
