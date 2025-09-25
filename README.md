# Aaron's Dotfiles V4 

This is my 4th attempt at creating some dotfiles in nix. let hope I can keep this one for more then a few months.

## Goals

- Create a nix config that can be used across multiple devices
- Have the ability to add new users easily (despite not needing it really)
- Be able to swap out config easily
- just be kinda cool (in other words not simple)

## Usage

```bash
git clone https://github.com/aaron/dotfiles.git
cd dotfiles
sudo nixos-rebuild switch --flake .#systemName
```

### New System Setup

add new .nix file to machines directory copy from another machine and edit as needed

### New User Setup

add new .nix file to users directory copy from another user and edit as needed then add user to machine config in machines directory

## Packages
<Standard packages used across the aaron user config on most machines>

- Browser: [Zen Browser](https://github.com/ZenBrowser)
- Terminal: [Ghostty](https://github.com/ghostty/ghostty)
- Shell: [fish](https://fishshell.com/)
- Editor: [neovim](https://neovim.io/)

- Status Bar: [waybar](https://github.com/swaywm/waybar)
- Notification Daemon: [dunst](https://dunst-project.org/)
- File Manager: [thunar](https://docs.xfce.org/xfce/thunar/start)
- Launcher: [rofi](https://github.com/adi1090x/rofi)
- Desktop: [hyprland](https://hyprland.org/)
- Login Manager: [ly](https://github.com/fairyglade/ly)


## Notes 

- openJDK 8, 21, 26 are installed as gradle within jetbrains IDEs seems to have issues otherwise
