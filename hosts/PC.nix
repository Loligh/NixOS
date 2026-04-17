{ ... }:
{
  networking.hostName = "PC";

  imports = [
    ../modules/aliases.nix
    ../modules/essentials.nix
    ../modules/git.nix
    ../modules/neovim.nix
    ../modules/network.nix
    ../modules/bootloader/grub.nix
    ../modules/desktop/applications.nix
    ../modules/desktop/audio.nix
    ../modules/desktop/defaultApps.nix
    ../modules/desktop/gaming.nix
    ../modules/desktop/hardware-configuration.nix
    ../modules/desktop/hyprland.nix
    ../modules/desktop/shell.nix
    ../modules/desktop/styling.nix
    ../modules/hardware/nvidia.nix
    ../modules/hardware/wooting.nix
    ../modules/hardware/finalmouse.nix
  ];
}
