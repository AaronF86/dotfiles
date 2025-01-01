{ lib, config, pkgs, ... }:

let
  ghostty = import inputs.ghostty;
in
{
  options = {
    modules.ghostty.enable = lib.mkEnableOption "Enable ghostty";
  };

  config = lib.mkIf config.modules.ghostty.enable {
    environment.systemPackages = [ ghostty.packages.x86_64-linux.default ];
  };
}
