{ inputs, ... }:
{
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--impure"
      #     "--commit-lock-file" # If you want to automatically commit the updated flake.lock
    ];
    dates = "04:00";
    operation = "switch";
    allowReboot = true;
    rebootWindow = {
      lower = "04:00";
      upper = "05:00";
    };
    runGarbageCollection = true;
  };
  nix.gc.options = "--delete-older-than 7d";
}
