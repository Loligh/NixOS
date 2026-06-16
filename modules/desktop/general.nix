{ ... }:
{
  imports = [
    ../essentials.nix
    ../git.nix
    ../neovim.nix
    ../network.nix
    ../shell.nix
    ../vpn.nix
    ./general/applications.nix
    ./general/audio.nix
    ./general/autoUpgrade.nix
    ./general/bluetooth.nix
    ./general/defaultApps.nix
    ./general/gaming.nix
    ./general/shell.nix
    ./general/compositor/styling.nix
    ./general/compositor/hyprland.nix
  ];
}
