{ config, pkgs, ... }:

{
  environment.systemPackages = [
     pkgs.steam pkgs.prismlauncher 
     pkgs.linuxKernel.packages.linux_zen.xone #drivers for xbox one controller
     ];
  
}
