{ ... }:
{
  users.groups = {
    media = { };
  };
  users.users.jellyfin.extraGroups = [ "media" ];
}
