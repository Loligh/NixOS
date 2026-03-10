{ pkgs, ... }:

{
  imports = [
    ./applications/obs.nix
    ./applications/vesktop.nix
    ./applications/zen.nix
  ];

  home-manager.users.benjamin = with pkgs; {
    home.packages = [
      hyprshot
      ghostty
      chromium
      rofi
      cider-2
      mangohud
      obsidian
      signal-desktop
      jetbrains.idea
      vscodium
      python314
      feh
      prismlauncher
      croc
    ];
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # makes graphical apps use wayland instead of xwayland
}
