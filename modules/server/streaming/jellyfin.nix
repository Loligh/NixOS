{ pkgs, lib, ... }:
{
  networking.firewall.interfaces."wg-home".allowedTCPPorts = lib.mkAfter [ 8096 ];

  services.jellyfin = {
    enable = true;
    openFirewall = false;
    dataDir = "/srv/jellyfin";
    hardwareAcceleration = {
      enable = true;
      type = "vaapi";
      device = "/dev/dri/renderD128";
    };
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
