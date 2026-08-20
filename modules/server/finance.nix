{
  self,
  inputs,
  lib,
  config,
  ...
}:
{
  services = {
    caddy.virtualHosts = {
      "finance.becae.org".extraConfig = ''
        root * ${config.services.firefly-iii.package}/public
        php_fastcgi unix/${config.services.phpfpm.pools.firefly-iii.socket}
        encode gzip
        file_server
      '';
      "importer.becae.org".extraConfig = ''
        root * ${config.services.firefly-iii-data-importer.package}/public
        php_fastcgi unix/${config.services.phpfpm.pools.firefly-iii-data-importer.socket}
        encode gzip
        file_server
      '';
    };

    phpfpm.pools = {
      firefly-iii.settings = {
        "listen.owner" = "firefly-iii";
        "listen.group" = "caddy";
        "listen.mode" = "0660";
      };
      firefly-iii-data-importer.settings = {
        "listen.owner" = lib.mkForce "firefly-iii-data-importer";
        "listen.group" = lib.mkForce "caddy";
        "listen.mode" = lib.mkForce "0660";
      };
    };

    firefly-iii = {
      enable = true;
      dataDir = "/srv/firefly";
      settings = {
        APP_ENV = "production";
        APP_URL = "finance.becae.org";
        APP_KEY_FILE = config.age.secrets."firefly/appkey".path;
      };
    };
    firefly-iii-data-importer = {
      enable = true;
      dataDir = "/srv/firefly-data-importer";
      settings = {
        TRUSTED_PROXIES = "**";
        EXPECT_SECURE_URL = true;
      };
    };
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = {
    "firefly/appkey" = {
      file = self + /secrets/server/firefly/appkey.age;
      owner = "firefly-iii";
      group = "firefly-iii";
      mode = "400";
    };
  };

}
