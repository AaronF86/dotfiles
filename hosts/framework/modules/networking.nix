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

  # Create NetworkManager connection file using SOPS template
  sops.templates."home-wifi" = {
    content = ''
      [connection]
      id=Home
      type=wifi
      autoconnect=true

      [wifi]
      mode=infrastructure
      ssid=${config.sops.placeholder."home/id"}

      [wifi-security]
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder."home/password"}

      [ipv4]
      method=auto

      [ipv6]
      addr-gen-mode=stable-privacy
      method=auto
    '';
    path = "/etc/NetworkManager/system-connections/Home.nmconnection";
    mode = "0600";
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
