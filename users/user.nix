{ pkgs, ... }: {
  users.users.aaron = {
    isNormalUser = true;
    description = "Aaron's User Account";
    home = "/home/aaron";
    group = "users";
    extraGroups = [ "wheel" "docker" "networkmanager" "audio" "video" "input" ];
    shell = pkgs.fish;

    hashedPassword = "$6$iO6NlGQZHc31SFWT$u42yx3TJjnetV56TnS0r2XplamdzqlqQHlcJfn0MFK1UzP8jLXcMgWiTCGNrqabsRAI.b3byCdHA.5lIh67FZ/";
  };
}