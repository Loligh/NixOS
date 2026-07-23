{ lib, ... }:
{
  networking.firewall.interfaces."wg-home".allowedTCPPorts = lib.mkAfter [ 8123 ];

  services.home-assistant = {
    enable = true;
    config = {
      http.server = {
        server_host = "10.0.0.1";
      };
    };
    configDir = "/srv/home-assistant";
  };
}
