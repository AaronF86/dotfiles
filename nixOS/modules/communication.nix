{ config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.mattermost pkgs.vesktop ];
}
