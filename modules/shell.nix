{ pkgs, ... }:
{
  users.defaultUserShell = pkgs.fish;
  programs = {
    fish.enable = true;
    starship = {
      enable = true;
    };
  };

  environment.shellAliases = {
    ff = "fastfetch";
    lg = "lazygit";
    yz = "yazi";
    rs = "sudo nixos-rebuild switch --flake $HOME/NixOS";
    rt = "sudo nixos-rebuild test --flake $HOME/NixOS";
    rsu = "nix flake update --flake $HOME/NixOS && sudo nixos-rebuild switch --flake $HOME/NixOS";
    gc = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
    try = "nix-shell -p";
    #ssh = "ghostty +ssh --"; apparently doesnt exist anymore
  };
}
