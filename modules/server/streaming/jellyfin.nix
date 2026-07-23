{ pkgs, lib, ... }:
{
  networking.firewall.interfaces."wg-home".allowedTCPPorts = lib.mkAfter [ 8096 ];

  services.caddy.virtualHosts = {
    "stream.vpn.becae.org".extraConfig = ''
      tls internal
      reverse_proxy localhost:8096
    '';
  };

  services.jellyfin = {
    enable = true;
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
