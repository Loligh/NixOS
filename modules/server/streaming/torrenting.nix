{ lib, ... }:
{
  networking.firewall.interfaces."wg-home".allowedTCPPorts = lib.mkAfter [
    8080
    9696
    7878
    8989
  ];

  services = {
    qbittorrent = {
      enable = true;
      profileDir = "/srv/qbittorrent";
    };
    prowlarr = {
      enable = true;
      dataDir = "/srv/prowlarr";
    };
    radarr = {
      enable = true;
      dataDir = "/srv/radarr";
    };
    sonarr = {
      enable = true;
      dataDir = "/srv/sonarr";
    };
  };
}
