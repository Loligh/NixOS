{
  self,
  inputs,
  config,
  lib,
  ...
}:
{
  networking.firewall.allowedUDPPorts = lib.mkAfter [ 51820 ];

  networking.wg-quick.interfaces = {
    wg-home = {
      listenPort = 51820;
      address = [
        "10.0.0.1/32"
      ];
      privateKeyFile = config.age.secrets."wireguard/privatekey".path;
      peers = [
        {
          # Benjamin phone
          publicKey = "It6KoBA1vILN5trVVQtioeJL6tclIsUGG3JqeLUCN1w=";
          allowedIPs = [ "10.0.0.11/32" ];
        }
        {
          # Benjamin pc
          publicKey = "qVZaFOxaXypYLNiiWNwi1U8WZ/8AofVVsgBWK/EiG04=";
          allowedIPs = [ "10.0.0.12/32" ];
        }
        {
          # Benjamin laptop
          publicKey = "r0PHSD8jFt1EcSSPFb3bnA/nFbrqdsXhtz15Gzv/iRQ=";
          allowedIPs = [ "10.0.0.13/32" ];
        }

      ];
    };
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = {
    "wireguard/privatekey" = {
      file = self + /secrets/server/wireguard/privatekey.age;
    };
  };
}
