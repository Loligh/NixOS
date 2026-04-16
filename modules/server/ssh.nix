{ config, ... }:
{
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHgv0OuQSOVcYkSNDT2wmb/npBNgMzv+K0pVMFFzlQjS benjamin@PC"
  ];

  services.openssh = {
    enable = true;
    extraConfig = ''
      Match user root
        AllowTcpForwarding no
        AllowAgentForwarding no
        PasswordAuthentication no
        KbdInteractiveAuthentication no
        X11Forwarding no
    '';
  };
}
