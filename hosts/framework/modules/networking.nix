{ config, pkgs, ... }:

{
  networking = {
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
}
