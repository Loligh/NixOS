{ pkgs, lib, ... }: {
  networking.hostName = "PC";

  users.users.benjamin = {
    isNormalUser = true;
    description = "benjamin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  home-manager.users.benjamin = { home.stateVersion = "25.05"; };

  imports = [
    ../modules/desktop/defaultApps.nix
    ../modules/git.nix
    ../modules/neovim.nix
    ../modules/aliases.nix
    ../modules/bootloader/grub.nix
    ../modules/desktop/hyprland.nix
    ../modules/desktop/shell.nix
    ../modules/desktop/gaming.nix
    ../modules/desktop/styling.nix
    ../modules/desktop/applications/minecraft.nix
    ../modules/desktop/applications/obs.nix
    ../modules/desktop/applications/zen.nix
  ];
}
