{ config, pkgs, ... }:

{
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    hostName = "cloud.aaronf86.tech";
    https = true;

    configureRedis = true;
    autoUpdateApps.enable = true;
    maxUploadSize = "2G";

    config = {
      adminuser = "admin";
      adminpassFile = "/etc/nixos/secrets/nextcloud-admin-pass";
      dbtype = "mysql";
      dbuser = "nextcloud";
      dbhost = "localhost";
      dbname = "nextcloud";
      dbpassFile = "/etc/nixos/secrets/nextcloud-db-pass";
    };
  };

  services.nginx.enable = true;
  services.nginx.virtualHosts."cloud.aaronf86.tech" = {
    forceSSL = true;
    enableACME = true;
    root = "/var/lib/nextcloud";
  };

  security.acme = {
    acceptTerms = true;
    email = "aaronfulton86@gmail.com";
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
