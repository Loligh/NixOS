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

  "server/wireguard/privatekey.age".publicKeys = all;
}
