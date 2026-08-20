{ pkgs, ... }:
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
      "webostv"
      "esphome"
      "tuya"

      "analytics"
      "google_translate"
      "met"
      "radio_browser"
      "shopping_list"
    ];
    customComponents = with pkgs.home-assistant-custom-components; [
      tuya_local
    ];

  };
}
