{ config, pkgs, ... }:

{
  environment.systemPackages = [ 
    pkgs.mattermost-desktop 
    pkgs.vesktop 
    ];
}
