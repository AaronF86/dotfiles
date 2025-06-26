{ config, pkgs, ... }:

{
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [{
      name = "nextcloud";
      passwordFile = "/etc/nixos/secrets/nextcloud-db-pass";
    }];
  };
}
