{
  inputs,
  config,
  lib,
  ...
}:
{
  networking.firewall.allowedUDPPorts = lib.mkAfter [ 51820 ];

  networking.wg-quick.interfaces = {
    wg0 = {
      listenPort = 51820;
      address = [
        "10.10.10.1/32"
      ];
      privateKeyFile = config.age.secrets."wireguard/privatekey".path;
      peers = [
        {
          # Benjamin phone
          publicKey = "0WSxOMrb/0INi8TTn5IH65FXtMCUjojs1MkYy1TNsl4=";
          allowedIPs = [ "10.10.10.10/32" ];
        }
        {
          # Benjamin pc (palceholder)
          publicKey = "+ltPiOVJNTXDuRFg46XUf0ylRfmwVmPcAdQUuGU6RXg=";
          allowedIPs = [ "10.10.10.11/32" ];
        }
        {
          # Benjamin laptop (palceholder)
          publicKey = "+ltPiOVJNTXDuRFg46XUf0ylRfmwVmPcAdQUuGU6RXg=";
          allowedIPs = [ "10.10.10.12/32" ];
        }

      ];
    };
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = {
    "wireguard/privatekey" = {
      file = ./secrets/wireguard/privatekey.age;
    };
  };
}
