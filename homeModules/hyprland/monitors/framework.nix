{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,preferred,0x0,1"
      ",preferred,auto,1"
    ];

    workspace = [
      "1,monitor:eDP-1,default:true,persistent:true"
      "2,monitor:eDP-1,persistent:true"
      "3,monitor:eDP-1,persistent:true"
      "4,monitor:eDP-1,persistent:true"
    ];
  };
}
