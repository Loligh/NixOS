{ pkgs, ... }:
{
  home-manager.users.benjamin = {
    home.packages = with pkgs; [
      nautilus
      loupe
      clapper
    ];

    xdg.mimeApps.defaultApplications = {
      "image/*" = [ "org.gnome.Loupe.desktop" ];
      "video/*" = [ "com.github.rafostar.Clapper" ];
    };
  };
}
