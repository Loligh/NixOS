{ pkgs, lib, ... }:
{
  networking.firewall.interfaces."wg-home".allowedTCPPorts = lib.mkAfter [ 8096 ];

  services.jellyfin = {
    enable = true;
    openFirewall = false;
    dataDir = "/srv/jellyfin";
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
