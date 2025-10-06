{ config, pkgs, ... }:

{
  networking = {
    hostName = "framework-13";
    networkmanager = {
      enable = true;

      wifi.backend = "iwd";

      settings = {
        "connection" = {
          autoconnect = true;
        };
        "wifi" = {
          powersave = 2;
        };
      };
    };

    useDHCP = false;
  };

  services.iwd.enable = true;
}
