{ config, pkgs, lib, ... }:
{
  networking.firewall.allowedTCPPorts = lib.mkAfter [ 8096 ];

  services.jellyfin = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
