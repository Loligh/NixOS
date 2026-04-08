{ lib, ... }:
{
  networking.firewall.allowedUDPPorts = lib.mkAfter [ 51820 ];

  networking.wg-quick.interfaces = {
    wg0 = {
      listenPort = 51820;
      address = [
        "10.10.10.1/32"
      ];
      privateKeyFile = "/srv/wireguard/privatekey";
      peers = [
        {
          publicKey = "0WSxOMrb/0INi8TTn5IH65FXtMCUjojs1MkYy1TNsl4=";
          allowedIPs = [
            "10.10.10.2/32"
          ];
        }
      ];
    };
  };
}
