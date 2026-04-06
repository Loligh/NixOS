{ inputs, ... }:
{
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--impure"
      #     "--commit-lock-file" # If you want to automatically commit the updated flake.lock
    ];
    dates = "daily";
    operation = "boot";
    system.autoUpgrade.runGarbageCollection = true;
  };
  nix.gc.options = "--delete-older-than 7d";
}
