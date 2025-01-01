#modules/dev/ghostty/default.nix

{ lib, config, pkgs, ... }:

let
  devModules = import ./dev/default.nix;
in
{
  options = {
    modules.dev.enable = lib.mkEnableOption "Enable the dev module.";
  };

  config = lib.mkIf config.modules.dev.enable {
    imports = [
      devModules
    ];

  };
}
