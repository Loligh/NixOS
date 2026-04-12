{ inputs, config, ... }:
{
  services.restic.backups.service-state = {

    paths = [ "/srv" ];

    timerConfig = {
      OnCalendar = "04:00"; # 30 min before automatic system update
      Persistent = true;

    };

    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 5"
      "--keep-monthly 6"
    ];

    passwordFile = config.age.secrets."restic/repo_password".path;

    repositoryFile = config.age.secrets."restic/repo_url".path;
    initialize = true;

    environmentFile = config.age.secrets."restic/repo_credentials".path;
  };

  imports = [ inputs.agenix.nixosModules.default ];

  age.secrets = {
    "restic/repo_password" = {
      file = ./secrets/restic/repo_password.age;
    };
    "restic/repo_url" = {
      file = ./secrets/restic/repo_url.age;
    };
    "restic/repo_credentials" = {
      file = ./secrets/restic/repo_credentials.age;
    };
  };
}
