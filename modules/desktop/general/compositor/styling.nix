{ pkgs, ... }:
{
  home-manager.users.benjamin = {
    home.pointerCursor = {
      enable = true;
      hyprcursor.enable = false;
      x11.enable = true;
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 32;
    };
    home.sessionVariables = {
      XCURSOR_SIZE = "32";
      HYPRCURSOR_SIZE = "32";
      XCURSOR_THEME = "Bibata-Modern-Classic";
    };
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.theme = null;
    };

    qt = {
      enable = true;
      style = {
        name = "adwaita-dark";
      };
    };
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
    };
  };
}
