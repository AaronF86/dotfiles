{ lib, ... }:

{ basics, diskoConfig }:
{ config, pkgs, ... }: {
  imports = [
    diskoConfig
  ];

  networking.hostName = basics.hostname;
  time.timeZone = basics.timezone or "UTC";

  users.users = lib.mkMerge [
    {
      root = {
        password = basics.rootPassword or "root";
      };
    }
    (lib.listToAttrs (map (u: {
      name = u;
      value = { isNormalUser = true; extraGroups = [ "wheel" ]; };
    }) (basics.users or [ ])))
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.openssh.enable = basics.enableSSH or true;
}
