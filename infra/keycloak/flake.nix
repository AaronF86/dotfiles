{
  description = "Keycloak module";
  outputs = { self, nixpkgs }: {
    nixosModules.keycloak = { config, pkgs, ... }: {
      services.keycloak = {
        enable = true;
        database = {
          type = "postgresql";
          username = "keycloak";
          passwordFile = "/etc/keycloak-pass";
        };
      };
    };
  };
}
