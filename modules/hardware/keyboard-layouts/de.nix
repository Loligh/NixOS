{ ... }:
{
  console.keyMap = "de";

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  home-manager.users.benjamin = {
    wayland.windowManager.hyprland.settings.config.input = {
      kb_layout = "de";
    };
  };
}
