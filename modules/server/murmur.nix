{ config, pkgs, lib, ... }:
{
  services.murmur = {
    enable = true;
    openFirewall = true;
    stateDir = "/srv/murmur";
    password = "161";
  };
}
