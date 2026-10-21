{
  self,
  inputs,
  config,
  ...
}:
let
  hostStateVersion = config.system.stateVersion;
in
{
  services.caddy.virtualHosts = {
    "torrent.becae.org".extraConfig = ''
      reverse_proxy 10.0.1.2:8080
    '';
    "indexers.becae.org".extraConfig = ''
      reverse_proxy localhost:9696
    '';
    "movies.becae.org".extraConfig = ''
      reverse_proxy localhost:7878
    '';
    "shows.becae.org".extraConfig = ''
      reverse_proxy localhost:8989
    '';
  };

  networking.nat = {
    enable = true;
    enableIPv6 = true;
    externalInterface = "enp6s0";
    internalInterfaces = [ "ve-+" ];
  };

  containers.torrent = {
    autoStart = true;
    privateNetwork = true;
    # enableTun = true;
    hostAddress = "10.0.1.1";
    localAddress = "10.0.1.2";
    bindMounts = {
      "downloads" = {
        hostPath = "/downloads";
        mountPoint = "/downloads";
        isReadOnly = false;
      };
      "dataDir" = {
        hostPath = "/srv/qbittorrent";
        mountPoint = "/srv/qbittorrent";
        isReadOnly = false;
      };
      "wg-privatekey" = {
        hostPath = config.age.secrets."wireguard/vpn/privatekey".path;
        mountPoint = config.age.secrets."wireguard/vpn/privatekey".path;
        isReadOnly = true;
      };
      "wg-presharedkey" = {
        hostPath = config.age.secrets."wireguard/vpn/presharedkey".path;
        mountPoint = config.age.secrets."wireguard/vpn/presharedkey".path;
        isReadOnly = true;
      };
    };
    config = {
      system.stateVersion = hostStateVersion;
      networking.firewall.allowedTCPPorts = [ 8080 ];
      services.qbittorrent = {
        enable = true;
        profileDir = "/srv/qbittorrent/";
      };
      users.groups."torrenting" = {
        gid = 974;
        members = [ "qbittorrent" ];
      };
      networking.wg-quick.interfaces = {
        airvpn = {
          address = [
            "10.139.129.245/32"
            "fd7d:76ee:e68f:a993:fe7d:96c6:93:e065/128"
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
              endpoint = "213.152.161.236:1637";
              persistentKeepalive = 15;
              allowedIPs = [
                "0.0.0.0/0"
                "::/0"
              ];
            }
          ];
        };
      };
    };
  };

  services = {
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
    flaresolverr = {
      enable = true;
    };
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.identityPaths = [ "/home/benjamin/.ssh/id_ed25519" ];
  age.secrets = {
    "wireguard/vpn/privatekey" = {
      file = self + /secrets/server/wireguard/vpn/privatekey.age;
    };
    "wireguard/vpn/presharedkey" = {
      file = self + /secrets/server/wireguard/vpn/presharedkey.age;
    };
  };
}
