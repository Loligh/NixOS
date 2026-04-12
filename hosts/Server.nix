{ pkgs, lib, ... }:
{
  services.logind.settings.Login.HandleLidSwitch = "ignore";

  networking.hostName = "server";

  imports = [
    ../modules/bootloader/systemd-boot.nix
    ../modules/aliases.nix
    ../modules/essentials.nix
    ../modules/git.nix
    ../modules/neovim.nix
    ../modules/network.nix
    ../modules/server/autoUpgrade.nix
    ../modules/server/backup.nix
    ../modules/server/ssh.nix
    ../modules/server/vpn.nix
    ../modules/server/gitRemote.nix
    ../modules/server/streaming/jellyfin.nix
    ../modules/server/streaming/mediaPermissions.nix
  ];
}
