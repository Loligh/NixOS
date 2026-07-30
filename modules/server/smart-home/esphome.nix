{ ... }:
{
  services.caddy.virtualHosts = {
    "esp.becae.org".extraConfig = ''
      reverse_proxy localhost:6052
    '';
  };

  services.esphome = {
    enable = true;
  };
}
