{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    brightnessctl
    yazi
    fastfetch
    lazygit
  ];
}
