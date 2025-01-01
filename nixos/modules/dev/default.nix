{ lib, config, pkgs, ... }:

let
  # If you need any specific development tools, you can define them here
  ghostty = import ../ghostty/default.nix { inherit lib pkgs; };
in
{
  options = {
    # Enable option for development features
    modules.dev.enable = lib.mkEnableOption "Enable the dev module.";
    
    # Add more dev-related options as needed
    # For example, enable other packages or tools that developers may need
  };

  config = lib.mkIf config.modules.dev.enable {
    # Enable development-specific tools here
    environment.systemPackages = [
      pkgs.git
      pkgs.vim
      pkgs.zsh
      pkgs.nodejs
      pkgs.yarn
      pkgs.docker
      # Include ghostty if enabled in dev configuration
      ghostty.packages.x86_64-linux.default
    ];

    # Additional configuration for dev tools can go here
    # For instance, setting up docker group, or environment variables
    
    # Example: Add user to the docker group
    users.users.aaron.extraGroups = [ "docker" ];
  };
}
