{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    yazi
    fastfetch
    lazygit
  ];
}
