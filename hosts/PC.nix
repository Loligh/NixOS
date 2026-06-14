{ ... }:
{
  networking.hostName = "PC";

  imports = [
    ../modules/desktop/general.nix

    ../modules/bootloader/grub.nix
    ../modules/hardware/keyboard-layouts/us.nix
    ../modules/hardware/nvidia.nix
    ../modules/hardware/wooting.nix
    ../modules/hardware/finalmouse.nix
    ../modules/desktop/PC/hardware-configuration.nix
    ../modules/desktop/PC/vpn.nix
  ];
}
