{ lib, ... }:
{
  #services.caddy.virtualHosts = {
  #"esp.becae.org".extraConfig = ''
  #reverse_proxy localhost:6052
  #  '';
  #};

  networking.firewall.allowedTCPPorts = lib.mkAfter [ 6052 ];

  services.esphome = {
    enable = true;
    address = "0.0.0.0";
  };
}
