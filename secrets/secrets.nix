let
  benjamin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHgv0OuQSOVcYkSNDT2wmb/npBNgMzv+K0pVMFFzlQjS";
  users = [ benjamin ];

  server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMcw5t1oC4mYxTBLbD7Jd32JHmuURvkhh/e+KWae5Zft";
  systems = [ server ];

  all = users ++ systems;
in
{
  "server/restic/repo_password.age".publicKeys = all;
  "server/restic/repo_url.age".publicKeys = all;
  "server/restic/repo_credentials.age".publicKeys = all;

  "server/wireguard/privatekey.age".publicKeys = all; # legacy
  "server/wireguard/home/privatekey.age".publicKeys = all;

  "PC/wireguard/privatekey.age".publicKeys = [ benjamin ]; # legacy
  "desktop/PC/wireguard/home/privatekey.age".publicKeys = [ benjamin ];

  "desktop/Laptop/wireguard/home/privatekey.age".publicKeys = [ benjamin ];
  "desktop/Laptop/wireguard/vpn/privatekey.age".publicKeys = [ benjamin ];
  "desktop/Laptop/wireguard/vpn/presharedkey.age".publicKeys = [ benjamin ];

  "desktop/general/ssh/work/id_ed25519.age".publicKeys = [ benjamin ];

  "server/firefly/appkey.age".publicKeys = all;
}
