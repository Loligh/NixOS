{ ... }:
{
  home-manager.users.benjamin = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Benjamin";
          email = "erdle.benjamin@gmail.com";
        };
        init.defaultBranch = "main";
      };
    };
  };
}
