{
  self,
  inputs,
  config,
  lib,
  ...
}:
{
  networking.firewall.interfaces."wg-home".allowedTCPPorts = lib.mkAfter [
    8080
    9696
    7878
    8989
  ];

  services = {
    qbittorrent = {
      enable = true;
      profileDir = "/srv/qbittorrent";
    };
    prowlarr = {
      enable = true;
      dataDir = "/srv/prowlarr";
    };
    radarr = {
      enable = true;
      dataDir = "/srv/radarr";
    };
    sonarr = {
      enable = true;
      dataDir = "/srv/sonarr";
    };
  };

  networking.wg-quick.interfaces = {
    wg-vpn = {
      address = [
        "10.168.170.61/32"
        "fd7d:76ee:e68f:a993:eaca:2b0f:73cc:aff3/128"
      ];
      privateKeyFile = config.age.secrets."wireguard/vpn/privatekey".path;
      dns = [
        "10.128.0.1"
        "fd7d:76ee:e68f:a993::1"
      ];
      peers = [
        {
          publicKey = "PyLCXAQT8KkM4T+dUsOQfn+Ub3pGxfGlxkIApuig+hk=";
          presharedKeyFile = config.age.secrets."wireguard/vpn/presharedkey".path;
          endpoint = "de3.vpn.airdns.org:1637";
          persistentKeepalive = 15;
          allowedIPs = [
            "0.0.0.0/0"
            "::/0"
          ];
        }
      ];
    };
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.identityPaths = [ "/home/benjamin/.ssh/id_ed25519" ];
  age.secrets = {
    "wireguard/vpn/privatekey" = {
      file = self + /secrets/desktop/Laptop/wireguard/vpn/privatekey.age;
    };
    "wireguard/vpn/presharedkey" = {
      file = self + /secrets/desktop/Laptop/wireguard/vpn/presharedkey.age;
    };
  };
}
