{ config, ... }:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-2,preferred,0x0,1"        # left  (Dell)
      "HDMI-A-1,preferred,1920x0,1" # center (AOC 2481)
      "HDMI-A-2,preferred,3840x0,1" # right  (AOC 2381)
    ];

    workspace = [
      "1,monitor:DP-1,default:true,persistent:true"
      "2,monitor:DP-1,persistent:true"
      "3,monitor:DP-1,persistent:true"
      "4,monitor:HDMI-A-1,default:true,persistent:true"
      "5,monitor:HDMI-A-1,persistent:true"
      "6,monitor:HDMI-A-1,persistent:true"
      "7,monitor:HDMI-A-2,default:true,persistent:true"
      "8,monitor:HDMI-A-2,persistent:true"
      "9,monitor:HDMI-A-2,persistent:true"
      "10,monitor:auto"
    ];
  };
}
