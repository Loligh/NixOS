{ pkgs, inputs, ... }:
let
  finalmousePkgs = inputs.finalmouse.packages.x86_64-linux;
in
{
  #imports = [ inputs.finalmouse.nixosModules.hardware.finalmouse ];
  #hardware.finalmouse.enable = true;

  environment.systemPackages = [ finalmousePkgs.xpanel ];
  services.udev.packages = [ pkgs.finalmouse-udev-rules ];
}
