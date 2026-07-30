{ ... }:
{
  services.caddy.virtualHosts = {
    "home.becae.org".extraConfig = ''
      reverse_proxy localhost:8123
    '';
  };

  services.home-assistant = {
    enable = true;
    config = {
      default_config = { };
      frontend = {
        themes = "!include_dir_merge_named themes";
      };
      automation = "!include automations.yaml";
      script = "!include scripts.yaml";
      scene = "!include scenes.yaml";
      http = {
        use_x_forwarded_for = true;
        trusted_proxies = [
          "::1"
          "127.0.0.1"
        ];
      };
    };
    configDir = "/srv/home-assistant";
    extraComponents = [
      "ssdp"
      "usb"
      "bluetooth"
      "dhcp"
      "stream"
      "go2rtc"
      "default_config"
      "isal"
      "mobile_app"
      "music_assistant"
      "esphome"

      "analytics"
      "google_translate"
      "met"
      "radio_browser"
      "shopping_list"
    ];

  };
}
