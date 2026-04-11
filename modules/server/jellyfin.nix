{ pkgs, ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    dataDir = "/srv/jellyfin";
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
