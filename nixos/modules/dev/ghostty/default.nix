{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.ghostty;

in {
    options.modules.ghostty = { enable = mkEnableOption "ghostty"; };
    config = mkIf cfg.enable {
            environment.systemPackages = [ ghostty.packages.x86_64-linux.default ];
    }
}
