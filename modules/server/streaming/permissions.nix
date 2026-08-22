{ ... }:
{
  users.groups = {
    "media" = {
      members = [
        "jellyfin"
        "radarr"
        "sonarr"
      ];
    };
    "torrenting" = {
      members = [
        "qbittorrent"
        "radarr"
        "sonarr"
      ];
    };
  };
}
