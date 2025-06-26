{ config, pkgs, ... }:

{
  imports = [
    ../hardware/vps-hardware-configuration.nix
    ../services/database.nix
    ../services/nextcloud.nix
  ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.hostName = "vps-1";

  services.nginx.enable = true;
  services.postfix.enable = true;

services.openssh = {
  enable = true;
  ports = [ 22 ];
  settings = {
    PasswordAuthentication = false;
    AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
    UseDns = true;
    X11Forwarding = false;
    PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
  };
};

  users.users.root.openssh.authorizedKeys.keys =
  [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILskqXdENIae/AIwZnDwEUm11j+xOc8HY45Mdf2zqSU2 aaronfulton86@gmail.com"
  ]

  services.fail2ban = {
    enable = true;
    maxretry = 5;
  }


}
