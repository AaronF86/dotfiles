{ config, pkgs, lib, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; #I need to move this to s system dir at one point :3
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

    packages = with pkgs; [
      vlc
      firefox
      home-manager
      obsidian
      fishPlugins.tide
    ];
  };
}
