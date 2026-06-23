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
        "10.0.0.13/32"
      ];
      privateKeyFile = config.age.secrets."wireguard/home/privatekey".path;
      dns = [ "10.0.0.1" ];
      peers = [
        {
          # homeserver
          publicKey = "/cAMp62EM3keUWaGAHbgdnBFgZ9dMPDDL9x5U9Qufyc=";
          endpoint = "becae.org:51820";
          allowedIPs = [ "10.0.0.1/32" ];
        }
      ];
    };
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.identityPaths = [ "/home/benjamin/.ssh/id_ed25519" ];
  age.secrets = {
    "wireguard/home/privatekey" = {
      file = self + /secrets/desktop/Laptop/wireguard/home/privatekey.age;
    };
  };
}
