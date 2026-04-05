{ pkgs, lib, ... }:
{
  networking.hostName = "server";
  
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
    ../modules/bootloader/systemd-boot.nix
    ../modules/aliases.nix
    ../modules/essentials.nix
    ../modules/git.nix
    ../modules/neovim.nix
    ../modules/server/game-server/minecraft-server.nix
    ../modules/server/jellyfin.nix
  ];
}
