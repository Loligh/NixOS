{ ... }:
{
  networking.hostName = "PC";

  imports = [
    ../modules/essentials.nix
    ../modules/git.nix
    ../modules/neovim.nix
    ../modules/network.nix
    ../modules/shell.nix
    ../modules/bootloader/grub.nix
    ../modules/desktop/applications.nix
    ../modules/desktop/audio.nix
    ../modules/desktop/defaultApps.nix
    ../modules/desktop/gaming.nix
    ../modules/desktop/hardware-configuration.nix
    ../modules/desktop/shell.nix
    ../modules/desktop/vpn.nix
    ../modules/desktop/compositor/styling.nix
    ../modules/desktop/compositor/hyprland/hyprland.nix
    ../modules/hardware/nvidia.nix
    ../modules/hardware/wooting.nix
    ../modules/hardware/finalmouse.nix
  ];
}
