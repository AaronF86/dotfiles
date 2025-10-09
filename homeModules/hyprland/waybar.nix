{ config, pkgs, ... }:
{
  programs.waybar.enable = true;

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 40;
      output = [ "*" ];

      modules-left = [ "custom/logo" "hyprland/workspaces" ];
      modules-right = [ "custom/language" "clock" "battery" ];

      "custom/logo" = {
        format = "";
        tooltip = false;
        on-click = ''bemenu-run --accept-single -n -p "Launch" --hp 4 --hf "#ffffff" --sf "#ffffff" --tf "#ffffff"'';
      };

      "hyprland/workspaces" = {
        on-click = "activate"; # optional
        format = "{icon}";
        all-outputs = false;
      };

      "custom/language" = {
        format = "{}";
        tooltip = false;
        exec = "setxkbmap -query | grep layout | awk '{print $2}'";
        interval = 5;
        on-click = "hyprctl switchxkblayout at-translated-set-2-keyboard next"; # Adjust device name as needed
      };

      "clock" = {
        interval = 60;
        format = "{:%a %d/%m %I:%M}";
      };

      "battery" = {
        tooltip = false;
      };
    };
  };

  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0;
      padding: 0;
      margin: 0;
      font-size: 11px;
    }

    window#waybar {
      background: #292828;
      color: #ffffff;
    }

    #custom-logo {
      font-size: 18px;
      margin: 0;
      margin-left: 7px;
      margin-right: 12px;
      padding: 0;
      font-family: NotoSans Nerd Font Mono;
    }

    #workspaces button {
      margin-right: 10px;
      color: #ffffff;
    }
    #workspaces button:hover, #workspaces button:active {
      background-color: #292828;
      color: #ffffff;
    }
    #workspaces button.focused {
      background-color: #941919;
      color: #ffffff;
    }

    #custom-language {
      margin-right: 7px;
    }

    #battery {
      margin-left: 7px;
      margin-right: 3px;
    }
  '';
}