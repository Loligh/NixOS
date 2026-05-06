{ pkgs, lib, ... }:
{
  networking = {
    networkmanager.enable = true;
    #networkmanager.dns = "none";
    #nameservers = [
    #  "1.1.1.1"
    #  "8.8.8.8"
    #];
  };
  networking.firewall.allowedUDPPorts = lib.mkAfter [ 5201 ];
  networking.firewall.allowedTCPPorts = lib.mkAfter [ 5201 ];
  environment.systemPackages = [ pkgs.iperf ];
}
