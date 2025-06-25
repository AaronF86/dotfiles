{ config, pkgs, ... }:

{
  time.timeZone = "UTC";
  networking.firewall.enable = true;

  environment.systemPackages = with pkgs; [
    curl git unzip tree
  ];
}
