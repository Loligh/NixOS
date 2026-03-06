{ pkgs, ... }:
{
  home-manager.users.benjamin = {
    home.packages = [
      pkgs.hyprcursor
    ];
    home.pointerCursor = {
      enable = true;
      hyprcursor.enable = true;
      x11.enable = true;
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 32;
    };
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
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
