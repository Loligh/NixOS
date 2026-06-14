{ ... }:
{
  networking.hostName = "Laptop";

  imports = [
    ../modules/desktop/general.nix

    ../modules/bootloader/systemd-boot.nix
    ../modules/hardware/keyboard-layouts/de.nix
    ../modules/hardware/gpu.nix
    ../modules/desktop/Laptop/hardware-configuration.nix
    ../modules/desktop/Laptop/vpn.nix
  ];
}
