{ config, lib, ... }:
{
  networking.firewall.interfaces."wg-home".allowedTCPPorts = lib.mkAfter [ 8123 ];

  services.home-assistant = {
    enable = true;
    config = null;
    lovelaceConfig = null;
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

      "analytics"
      "google_translate"
      "met"
      "radio_browser"
      "shopping_list"
    ];

  };
}
