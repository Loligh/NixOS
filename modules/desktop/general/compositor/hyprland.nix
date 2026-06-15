{ self, ... }:
{
  programs.hyprland.enable = true;

  home-manager.users.benjamin = {
    home.file."hyprland" = {
      enable = true;
      source = self + /config/hypr;
      target = ".config/hypr";
    };
  };
}
