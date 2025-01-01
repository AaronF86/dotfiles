{ lib, config, pkgs, ... }:

# Import the module specific to ghostty
let
  devModules = import ./dev/default.nix;
  ghosttyModule = import ./dev/ghostty/default.nix;
in
{
  options = {
    # Define a global option to enable or disable ghostty
    # This option can be used in your NixOS configuration to enable ghostty globally
    modules.ghostty.enable = lib.mkEnableOption "Enable the ghostty module.";
  };

  # Configurations to apply when the module is enabled
  config = lib.mkIf config.modules.ghostty.enable {
    # Include the configuration from the ghostty module
    imports = [
      ghosttyModule
    ];

    # Additional configuration for ghostty (if necessary)
    # For example, setting up specific settings within ghostty
    # Example:
    # services.ghostty.someOption = true;
  };
}
