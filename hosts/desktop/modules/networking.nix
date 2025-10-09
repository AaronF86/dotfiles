{ config, pkgs, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
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
