{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.eddie
  ];
}
