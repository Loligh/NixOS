{ config, pkgs, ... }:
{
  programs.hyprland.enable = true;

  home-manager.users.benjamin = {
    wayland.windowManager.hyprland = {
      #      enable = true;
    };
  };
}
