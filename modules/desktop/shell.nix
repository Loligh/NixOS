{ config, pkgs, ... }:
{
  services.displayManager.ly.enable = true;

  environment.systemPackages = with pkgs; [
    quickshell
  ];
}
