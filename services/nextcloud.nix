{ config, pkgs, lib, ... }:

with lib;
let
  hostName = "cloud.aaronf86.tech";
in
{
  # REMOVE THIS IF YOU DON’T HAVE IT
  # imports = [ ./nginx-common.nix ];

  config = {
    # Secure password provisioning
    environment.etc."nextcloud-admin-pass".text = "forfucksakejustwork9302";
    environment.etc."nextcloud-db-pass".text = "your-database-password";

    # PostgreSQL setup
    services.postgresql = {
      enable = true;
      ensureDatabases = [ "nextcloud" ];
      ensureUsers = [
        {
          name = "nextcloud";
          ensureDBOwnership = true;
        }
      ];
    };

security.acme = {
  acceptTerms = true;
  defaults.email = "aaronfulton86@gmail.com";
};

    # Nextcloud service
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud31;
      hostName = hostName;
      https = true;

      config = {
        dbtype = "pgsql";
        dbuser = "nextcloud";
        dbhost = "/run/postgresql";
        dbname = "nextcloud";
        dbpassFile = "/etc/nextcloud-db-pass";

        adminuser = "glyph";
        adminpassFile = "/etc/nextcloud-admin-pass";
      };

      autoUpdateApps = {
        enable = true;
        startAt = "05:00:00";
      };

      settings.default_phone_region = "GB";
    };

    # Nginx virtual host
services.nginx = {
  enable = true;
  virtualHosts."${hostName}" = {
    enableACME = true;  # ← handles Let's Encrypt properly
    forceSSL = true;
  };
};

    # Ensure DB is up before nextcloud setup
    systemd.services."nextcloud-setup" = {
      requires = [ "postgresql.service" ];
      after = [ "postgresql.service" ];
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}

