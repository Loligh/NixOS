{ config, ... }:
{
  environment.shellAliases =
  {
    ff = "fastfetch";
    rs = "sudo nixos-rebuild switch --flake $HOME/NixOS --impure";
    rsu = "nix flake update $HOME/NixOS && sudo nixos-rebuild switch --flake $HOME/NixOS --impure";
    gc = "nix-collect-garbage -d";
    try = "nix-shell -p";
  };
}
