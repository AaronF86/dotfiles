{
  meta = {
    hostname = "framework";
    system = "x86_64-linux";
    description = "Laptop for Aaron";
    users = {
      # UserName    |     UseHomeManager
      aaron         =              true;   
    };
  };

  modules = [
    ./disko.nix       
    ./modules/boot.nix   
  ];
}
