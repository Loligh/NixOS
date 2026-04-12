let
  placeholderForDesktopUser = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIArbETnLMu9QBHp4DiGcNP447rAW8qtlVOUK73y8PwYs";
  users = [ placeholderForDesktopUser ];

  server = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMcw5t1oC4mYxTBLbD7Jd32JHmuURvkhh/e+KWae5Zft";
  systems = [ server ];

  all = users ++ systems;
in
{
  "restic/repo_password.age".publicKeys = all;
  "restic/repo_url.age".publicKeys = all;
  "restic/repo_credentials.age".publicKeys = all;
}
