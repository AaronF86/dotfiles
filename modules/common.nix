# Common System Level options
{
    # Nix Settings

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        trusted-users = [ "root" "aaron" ]; # Move to be a option of user module?
    };
    
    # Nixpkgs Settings

    nixpkgs = {
        config.allowUnfree = true;
        nixpkgs.packages = with pkgs; [
            curl
            tree
            fastfetch
            git
            wget
            neovim
        ];
    };

    # System Settings

    time.timeZone = "Europe/London";
    i18n.defaultLocale = "en_UK.UTF-8";

    networking.firewall.enable = true;

    # NixOS Version
    system.stateVersion = "25.05"; 
}