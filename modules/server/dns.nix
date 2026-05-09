{ lib, ... }:
{
  networking.firewall.interfaces."wg-home".allowedUDPPorts = lib.mkAfter [ 53 ];

  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53;

      upstreams.groups.default = [ "https://1.1.1.1/dns-query" ];

      customDNS.mapping = {
        "server.home" = "10.10.10.1";
        "fritz.box" = "192.168.178.1";
        "router" = "192.168.178.1";
      };
    };
  };
}
