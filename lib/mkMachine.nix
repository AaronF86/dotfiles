{ lib, nixpkgs, home-manager, mkUsers, disko, zen-browser, agenix, ... }:

{ meta, modules ? [], extraModules ? [] }:

let
  users = mkUsers {
    userMap = meta.users;
  };
in

nixpkgs.lib.nixosSystem {
  system = meta.system or "x86_64-linux";
  specialArgs = { inherit meta; };

  modules = [
    disko.nixosModules.disko
    agenix.nixosModules.default
    {
      system.stateVersion = "25.11"; # move this at some point to attribute of host meta
    }
    {
      networking.hostName = meta.hostname;
    }
    {
      users.users = users.systemUsers;
    }
  ]
  ++ modules
  ++ extraModules
  ++ lib.optionals (builtins.length (lib.attrNames users.homeManagerUsers) > 0) [
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.users = users.homeManagerUsers;
      home-manager.extraSpecialArgs = { inherit zen-browser; };
    }
  ];
}
