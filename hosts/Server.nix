{ pkgs, lib, ... }:
{
  networking.hostName = "Server";

  imports = [
    ../modules/bootloader/systemd-boot.nix
    ../modules/server/game-server/minecraft-server.nix
  ];
}
