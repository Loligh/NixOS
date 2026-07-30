{ ... }:
{
  services.caddy.virtualHosts = {
    "music.becae.org".extraConfig = ''
      reverse_proxy localhost:8095
    '';
  };

  services.music-assistant = {
    enable = true;
    providers = [
      "airplay"
      "airplay_receiver"
      "apple_music"
      "builtin"
      "chromecast"
      "dlna"
      "filesystem_local"
      "filesystem_nfs"
      "filesystem_smb"
      "genius_lyrics"
      "hass"
      "hass_players"
      "jellyfin"
      "party"
      "sendspin"
      "snapcast"
      "tidal"
    ];
  };
}
