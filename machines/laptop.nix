{
  arch = "x86_64-linux";
  hostname = "framework";
  desktopManager = "hyprland";
  users = [ { name = "aaron"; isNormalUser = true; } ];
  nvidia = false;
  flags = {
    wifi = true;
    bluetooth = true;
    touchpad = true;
    battery = true;
    webcam = true;
    microphone = true;
    servers = false;
  };
}
