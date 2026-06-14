{
  self,
  inputs,
  config,
  ...
}:
{
  networking.wg-quick.interfaces = {
    wg-home = {
      address = [
        "10.0.0.12/32"
      ];
      privateKeyFile = config.age.secrets."wireguard/privatekey".path;
      dns = [ "10.0.0.1" ];
      peers = [
        {
          # homeserver
          publicKey = "/cAMp62EM3keUWaGAHbgdnBFgZ9dMPDDL9x5U9Qufyc=";
          allowedIPs = [ "10.0.0.1/32" ];
          endpoint = "31.19.182.11:51820";
        }
      ];
    };
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.identityPaths = [ "/home/benjamin/.ssh/id_ed25519" ];
  age.secrets = {
    "wireguard/privatekey" = {
      file = self + /secrets/PC/wireguard/privatekey.age;
    };
  };
}
