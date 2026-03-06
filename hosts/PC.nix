{ pkgs, lib, ... }:
{
  networking.hostName = "PC";

  users.users.benjamin = {
    isNormalUser = true;
    description = "benjamin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager.users.benjamin = {
    home.stateVersion = "25.05";
  };

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
    ../modules/desktop/hyprland.nix
    ../modules/desktop/shell.nix
    ../modules/desktop/styling.nix
    ../modules/hardware/nvidia.nix
    ../modules/hardware/wooting.nix
  ];
}
