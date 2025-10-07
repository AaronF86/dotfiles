{ config, pkgs, ... }:

{
  sops.defaultSopsFile = ../../../secrets/networks.yaml;
  sops.secrets."home/id" = {};
  sops.secrets."home/password" = {};

  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  networking.firewall.allowedTCPPorts = [ 22 ];
}
