{ config, pkgs, lib, ... }:
{
  networking.firewall.allowedTCPPorts = lib.mkAfter [ 51820 ];
  
  networking.useNetworkd = true;

  systemd.network = {
    enable = true;

    networks."50-wg0" = {
      matchConfig.Name = "wg0";

      address = [ "10.0.0.1/24" ];
      
      networkConfig = {
        # do not use IPMasquerade,
        # unnecessary, causes problems with host ipv6
        IPv4Forwarding = true;
        IPv6Forwarding = true;
      };
    };

    netdevs."50-wg0" = {
      netdevConfig = {
        Kind = "wireguard";
        Name = "wg0";
      };

      wireguardConfig = {
        ListenPort = 51820;

        # ensure file is readable by `systemd-network` user
        PrivateKeyFile = "/etc/wireguard/privatekey";

        # To automatically create routes for everything in AllowedIPs,
        # add RouteTable=main
        RouteTable = "main";
      };
      
      wireguardPeers = [
        {
          PublicKey = "0WSxOMrb/0INi8TTn5IH65FXtMCUjojs1MkYy1TNsl4=";
          AllowedIPs = [ "10.0.0.2/32" ];
        }
      ];
    };
  };
  
  networking.nat = {
    enable = true;
    enableIPv6 = true;
    externalInterface = "ens6";
    internalInterfaces = [ "wg0" ];
  };
}
