{ ... }:
{
  home-manager.users.benjamin = {
    programs.ghostty = {
      enable = true;
      settings = {
        resize-overlay = "never";
        confirm-close-surface = false;
        background-opacity = 0.95;

        shell-integration = "fish";
      };
    };
  };
}
