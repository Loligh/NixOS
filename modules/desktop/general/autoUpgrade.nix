{ inputs, ... }:
{
  system.autoUpgrade = {
    enable = false; # !!!
    flake = inputs.self.outPath;
    flags = [
      "--impure"
      #     "--commit-lock-file" # If you want to automatically commit the updated flake.lock
    ];
    dates = "daily";
    operation = "boot";
    runGarbageCollection = true;
  };
  # nix.gc.options = "--delete-older-than 7d";

  services.fwupd.enable = true;
}
