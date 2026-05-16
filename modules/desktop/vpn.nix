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
        "10.10.10.11/32"
      ];
      privateKeyFile = config.age.secrets."wireguard/privatekey".path;
      dns = [ "10.10.10.1" ];
      peers = [
        {
          # Benjamin phone
          publicKey = "/cAMp62EM3keUWaGAHbgdnBFgZ9dMPDDL9x5U9Qufyc=";
          allowedIPs = [ "10.10.10.1/32" ];
          endpoint = "31.19.182.11:51820";
        }
      ];
    };
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = {
    "wireguard/privatekey" = {
      file = self + /secrets/PC/wireguard/privatekey.age;
    };
  };
}
