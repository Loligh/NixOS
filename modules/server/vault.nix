{ ... }:
{
  services = {
    caddy.virtualHosts = {
      "vault.becae.org".extraConfig = ''
        reverse_proxy [::1]:8222
      '';
    };
    vaultwarden = {
      enable = true;
      backupDir = "/srv/vaultwarden";
      domain = "vault.becae.org";
      config = {
        ROCKET_ADDRESS = "::1";
        ROCKET_PORT = 8222;
        SIGNUPS_ALLOWED = false;
      };
    };
  };
}
