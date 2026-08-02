{ ... }:
{
  services.pocket-id = {
    enable = true;
    dataDir = "/srv/pocket-id";
    settings = {
      ANALYTICS_DISABLED = true;
      TRUST_PROXY = true;
    };
  };
}
