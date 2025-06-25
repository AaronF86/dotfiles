{ config, pkgs, ... }:

{
  imports = [
    ../hardware/vps-hardware-configuration.nix
  ];

  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.hostName = "vps-1";

  services.nginx.enable = true;
  services.docker.enable = true;
  services.postfix.enable = true;

  users.users.aaron = {
    isNormalUser = true;
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
  };


}
