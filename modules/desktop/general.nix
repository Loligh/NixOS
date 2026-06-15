{ ... }:
{
  imports = [
    ../essentials.nix
    ../git.nix
    ../neovim.nix
    ../network.nix
    ../shell.nix
    ./general/applications.nix
    ./general/audio.nix
    ./general/defaultApps.nix
    ./general/gaming.nix
    ./general/shell.nix
    ./general/compositor/styling.nix
    ./general/compositor/hyprland.nix
  ];
}
