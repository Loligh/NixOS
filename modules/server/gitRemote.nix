{ config, pkgs, ... }:
{
  users.users.git = {
    isSystemUser = true;
    group = "git";
    home = "/srv/git-remote";
    createHome = true;
    shell = "${pkgs.git}/bin/git-shell";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHgv0OuQSOVcYkSNDT2wmb/npBNgMzv+K0pVMFFzlQjS benjamin@PC"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPFaiM67gSUXGlYIonbhYK23uf0ihg3BzNaqEhsUkHEX benjamin@BenWindowsPC"
    ];
  };

  users.groups.git = { };

  services.openssh = {
    enable = true;
    extraConfig = ''
      Match user git
        AllowTcpForwarding no
        AllowAgentForwarding no
        PasswordAuthentication no
        KbdInteractiveAuthentication no
        PermitTTY no
        X11Forwarding no
    '';
  };
}
