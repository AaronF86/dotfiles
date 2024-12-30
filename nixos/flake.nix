{
  description = "being a nix config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
    #may remove home manager at a later date
    home-manager = {
      url= "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ghostty, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system}; 
    in 
    {
      nixosConfigurations.framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux"; 
       extraSpecialArgs = {inherit inputs;};
        modules = [
          ./configuration.nix
          inputs.home-manager.nixosModules.default
          {
            environment.systemPackages = [ ghostty.packages.x86_64-linux.default ];
          }
          
        ];
      };
      nixosConfigurations.desktop =  nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [

        ];
      };
    };
}
