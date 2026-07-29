{ pkgs, lib, inputs, ... }:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    servers = {
      MainSurvival = {
        enable = true;
	package = pkgs.fabricServers.fabric-1_21_11;

	serverProperties = {/* */};
	whitelist = {/* */};

	symlinks = {
	  "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
	    Lithium = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uXXizFIs/versions/eRLwt73x/ferritecore-8.0.3-fabric.jar"; sha256 = "yG6rrNvwY5ibLKgSyOk/VWuP7/HJ38B8rvodkKXHvzU="; };
	    FerriteCore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uXXizFIs/versions/eRLwt73x/ferritecore-8.0.3-fabric.jar"; sha256 = "WhyDoesItNotWantAHash?"; };
	    #Krypton = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/VSNURh3q/versions/DLKF3HZk/c2me-fabric-mc1.21.11-0.3.6%2Bbeta.1.0.jar"; sha256 = ""; };
	    C2ME = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/VSNURh3q/versions/DLKF3HZk/c2me-fabric-mc1.21.11-0.3.6%2Bbeta.1.0.jar"; sha256 = "sha256-8cqyjuDvXuVLdGhJDAZii6tdjMVHm2VqGpBPCoNrxgY="; };
	    #AppleSkin = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/EsAfCjCV/versions/pvcLnrm0/appleskin-fabric-mc1.21.11-3.0.7.jar"; sha256 = "sha256-UOjD6vafWRmhbMQijPq9Xzudd0E9Jng0mSw+PFGuk+0="; };
	    DistantHorizons = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uCdwusMi/versions/rdwJawR9/DistantHorizons-2.4.0-b-1.21.11-fabric-neoforge.jar"; sha256 = "sha256-4V6FLUemsKrpac1OLrdYhdzvO0qCVmgIuctLPyFrZOI="; };
	    #Chunky = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fALzjamp/versions/bk9YUabA/Chunky-Fabric-1.4.54.jar"; sha256 = "+rt21UYzsEBRZTCVJOdnfd5ig84EmqHhMQGZE/fYUL4="; };
	    Litematica = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/bEpr0Arc/versions/yuHq2lUW/litematica-fabric-1.21.11-0.25.1.jar"; sha256 = "sha256-eygLuesUcrfXPvPiMK03H2kqxO6sdfj2eOBSXX7Z4b0="; };
	    SimpleVoiceChat = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/K5zIeqNd/voicechat-fabric-1.21.11-2.6.7.jar"; sha256 = "EIVYSAAzrHqNUoaDdosCRki+0AH9arbzIixZ0yX7GMA="; };
	  });
        };
      };
    };
  };
}
