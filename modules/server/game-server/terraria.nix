{ ... }:
{
  services.terraria = {
    enable = true;
    dataDir = "/srv/terraria";
    noUPnP = true;
    openFirewall = true;
    password = "leckmeineeier";
  };
}
