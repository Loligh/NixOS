{ lib, ... }:
{
  networking.firewall.interfaces."wg-home".allowedTCPPorts = lib.mkAfter [
    80
    443
  ];

  services.caddy = {
    enable = true;
    openFirewall = false;
  };
}
