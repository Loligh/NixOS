{ ... }:
{
  users.users.benjamin.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHgv0OuQSOVcYkSNDT2wmb/npBNgMzv+K0pVMFFzlQjS benjamin@PC"
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHgv0OuQSOVcYkSNDT2wmb/npBNgMzv+K0pVMFFzlQjS benjamin@PC"
  ];

  services.openssh = {
    enable = true;
    openFirewall = true; # temp
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
