{ config, pkgs, inputs, ... }: 

let
  hostname = builtins.getEnv "HOSTNAME";
  isVPS = hostname == "vps-1"; # Replace with actual VPS hostname
in {

  imports = [
      inputs.zen-browser.homeModules.beta
      ../home/waybar.nix
      ../home/wofi.nix
      ../home/dunst.nix
      ../home/nvim.nix
      ../home/hyprpaper.nix
      ../home/hyprland/default.nix
      ../home/hyprland/binds.nix
];

  home.username = "aaron";
  home.homeDirectory = "/home/aaron";
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "Aaron Dev";
    userEmail = "aaron";
  };

  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [ lua-language-server ];
  };
    programs.zen-browser.enable = true;

  programs.zen-browser.policies = {
    AutofillAddressEnabled = true;
    AutofillCreditCardEnabled = false;
    DisableAppUpdate = true;
    DisableFeedbackCommands = true;
    DisableFirefoxStudies = true;
    DisablePocket = true;
    DisableTelemetry = true;
    DontCheckDefaultBrowser = true;
    NoDefaultBookmarks = true;
    OfferToSaveLogins = false;
    EnableTrackingProtection = {
      Value = true;
      Locked = true;
      Cryptomining = true;
      Fingerprinting = true;
    };
  };
  programs.zen-browser.policies = {
      ExtensionSettings = {
        "wappalyzer@crunchlabz.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4482384/wappalyzer-6.10.82.xpi";
          installation_mode = "force_installed";
        };
        "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/file/4156831/github_file_icons-1.5.1.xpi";
          installation_mode = "force_installed";
        };
                  "uBlock0@raymondhill.net" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          };
      };
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
    # Hyprland utilities
    wofi
    waybar
    dunst
    grimblast
    swayidle
    wl-clipboard
    xfce.thunar

    # Eko client and server from the flake input
  ] ++ [ inputs.eko.packages.${pkgs.system}.eko inputs.eko.packages.${pkgs.system}.eko-server ] ++ (if !isVPS then [
    firefox
    ghostty
    mattermost-desktop
    obs-studio
    discord
    vscode
    jetbrains.idea-ultimate
    gradle
  ] else []);
}
