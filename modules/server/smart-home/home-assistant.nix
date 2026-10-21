{ pkgs, lib, ... }:
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
      homeassistant.time_zone = null;
      automation = "!include automations.yaml";
      scene = "!include scenes.yaml";
      #script = "!include scripts.yaml";
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
      "govee_light_local"

      "analytics"
      "google_translate"
      "met"
      "radio_browser"
      "shopping_list"
    ];
    customComponents = with pkgs.home-assistant-custom-components; [
      tuya_local
    ];
    #openFirewallForComponents = true;
  };

  networking.firewall.allowedUDPPorts = lib.mkAfter [ 4002 ]; # for govee_light_local
}
