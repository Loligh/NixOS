{ pkgs, lib, ... }:
{
  networking.firewall.allowedUDPPorts = lib.mkAfter [ 5201 ];
  networking.firewall.allowedTCPPorts = lib.mkAfter [ 5201 ];
  environment.systemPackages = [ pkgs.iperf ];
}
