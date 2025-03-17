#
#
#   User account creation   #
#
#


{ config, pkgs, ... }: 

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
  };
}
