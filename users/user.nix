{ config, pkgs, lib, ... }:

{
  users.users.aaron = {
    isNormalUser = true;
    description = "Aaron's User Account";
    home = "/home/aaron";
    shell = pkgs.fish;
    group = "users";
    extraGroups = [
      "wheel"
      "docker"
      "video"
      "audio"
    ];

    # openssh.authorizedKeys.keys = [
    # ];

    packages = with pkgs; [
      vlc
      firefox
    ];
  };
}
