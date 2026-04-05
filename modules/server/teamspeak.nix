{ config, pkgs, lib, ... }:
{
  services.teamspeak3 = {
    enable = true;
    openFirewall = true;
    dataDir = "/srv/teamspeak";
  };
}
