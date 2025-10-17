{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod, RETURN, exec, ghostty"
      "$mod, D, exec, wofi -f --show=drun --lines=5 --prompt=\"\""
      "$mod SHIFT, D, exec, grimblast copy area"
      "$mod SHIFT, F, exec, grimblast copysave output ~/.screenshots/$(date +'%s_hypr.png')"
      "$mod SHIFT, G, exec, grimblast copy active"

      "$mod SHIFT, Q, killactive,"
      "$mod CTRL, E, exit,"
      "$mod, SPACE, togglesplit,"
      "$mod, F, fullscreen"
      "$mod, V, togglefloating,"
      "$mod, P, pseudo,"

      "$mod, H, movefocus, l"
      "$mod, L, movefocus, r"
      "$mod, K, movefocus, u"
      "$mod, J, movefocus, d"

      "$mod SHIFT, H, movewindow, l"
      "$mod SHIFT, L, movewindow, r"
      "$mod SHIFT, K, movewindow, u"
      "$mod SHIFT, J, movewindow, d"

      "$mod ALT, H, resizeactive, -10 0"
      "$mod ALT, L, resizeactive, 10 0"
      "$mod ALT, K, resizeactive, 0 -10"
      "$mod ALT, J, resizeactive, 0 10"

      "$mod, E, togglegroup"
      "$mod SHIFT, E, lockactivegroup, toggle"
      "$mod, TAB, changegroupactive, f"
      "$mod SHIFT, TAB, changegroupactive, b"
      "$mod CTRL, L, moveoutofgroup, r"
      "$mod CTRL, H, moveoutofgroup, l"

      # Workspace binds
      "$mod, 1, workspace,  1"
      "$mod, 2, workspace,  2"
      "$mod, 3, workspace,  3"
      "$mod, 4, workspace,  4"

      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"

      # Wallpaper controls
      "$mod, W, exec, hyprctl hyprpaper wallpaper \"DP-2,$(find ~/Pictures/wallpapers -type f | shuf -n 1)\""
      "$mod SHIFT, W, exec, hyprctl hyprpaper wallpaper \"HDMI-A-2,$(find ~/Pictures/wallpapers -type f | shuf -n 1)\""
      "$mod CTRL, W, exec, hyprctl hyprpaper wallpaper \"HDMI-A-1,$(find ~/Pictures/wallpapers -type f | shuf -n 1)\""
    ];
  };
}
