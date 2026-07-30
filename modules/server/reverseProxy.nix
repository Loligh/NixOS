{ ... }:
{
  services.caddy = {
    enable = true;
    openFirewall = true;

    virtualHosts = {
      "becae.org".extraConfig = ''
        respond "connected"
      '';
    };
  };
}
