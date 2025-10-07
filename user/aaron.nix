{ pkgs, ... }:
{
  isNormalUser = true;
  description = "Aaron's system account";
  extraGroups = [ "wheel" "network" "docker" ];
  hashedPassword = "";
}
