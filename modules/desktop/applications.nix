{ pkgs, ... }:

let
  moduleDir = ./applications;

  modules = builtins.attrValues (
    builtins.mapAttrs (name: type: moduleDir + "/${name}") (builtins.readDir moduleDir)
  );
in
{
  imports = modules;

  environment.systemPackages = with pkgs; [
    hyprshot
    neovim
    ghostty
    firefox
    chromium
    rofi
    cider-2
    wootility
    mangohud
    obsidian
    signal-desktop
    jetbrains.idea
    vscodium
    python314
    feh
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
