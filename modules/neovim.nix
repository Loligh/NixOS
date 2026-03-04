{ ... }:
{
  environment.variables.EDITOR = "nvim";

  programs.nvf = {
    enable = true;
    
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };

      vim.autopairs.enable = true;

      vim.clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
      };

      vim.statusline.lualine.enable = true;

      vim.languages = {
        nix.enable = true;
        qml.enable = true;
      };
    };
  };
}
