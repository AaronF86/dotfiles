{ config, pkgs, ... }:

{
  age.secrets.wifi.file = ../../../secrets/wifi.age;

  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";

      ensureProfiles.profiles = {
        home = {
          connection.id = "home";
          connection.type = "wifi";
          wifi.ssid = "@${config.age.secrets.wifi.path}.HOME_SSID@";
          wifi.mode = "infrastructure";
          wifi-security.key-mgmt = "wpa-psk";
          wifi-security.psk = "@${config.age.secrets.wifi.path}.HOME_PASSWORD@";
        };
      };

      settings = {
        connection.autoconnect = true;
      };
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
