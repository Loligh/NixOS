{ config, ... }:
{
  environment.shellAliases =
  {
    ff = "fastfetch";
    rs = "cd /home/benjamin/NixOS && sudo nixos-rebuild switch --flake . --impure && cd -";
    rsu = "cd /home/benjamin/NixOS && nix flake update && sudo nixos-rebuild switch --flake . --impure && cd -";
    gc = "nix-collect-garbage -d";
    try = "nix-shell -p";
  };
}
