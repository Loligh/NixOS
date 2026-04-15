{ ... }:
{
  environment.shellAliases = {
    ff = "fastfetch";
    lg = "lazygit";
    yz = "yazi";
    rs = "sudo nixos-rebuild switch --flake $HOME/NixOS --impure";
    rsu = "nix flake update --flake $HOME/NixOS && sudo nixos-rebuild switch --flake $HOME/NixOS --impure";
    gc = "nix-collect-garbage -d";
    try = "nix-shell -p";
  };
}
