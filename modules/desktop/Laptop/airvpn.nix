{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.eddie
  ];

  nixpkgs.overlays = [
    (final: prev: {
      eddie = prev.eddie.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          rm -f $out/lib/eddie/eddie-cli-elevated \
                $out/lib/eddie/Lib.Platform.Linux.Native.so
          cp $out/lib/eddie-ui/eddie-cli-elevated \
             $out/lib/eddie/eddie-cli-elevated
          cp $out/lib/eddie-ui/libLib.Platform.Linux.Native.so \
             $out/lib/eddie/Lib.Platform.Linux.Native.so
          chmod +x $out/lib/eddie/eddie-cli-elevated
        '';
      });
    })
  ];
}
