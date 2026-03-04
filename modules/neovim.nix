{ config, ... }:
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

      vim.clipboard.enable = true;
    };
  };
}
