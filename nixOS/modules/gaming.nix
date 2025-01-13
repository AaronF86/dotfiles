{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.steam pkgs.prismlauncher ];
  
}
