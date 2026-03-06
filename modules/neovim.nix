{ ... }:
{
  environment.variables.EDITOR = "nvim";

  programs.nvf = {
    enable = true;

    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;

      vim.autopairs.nvim-autopairs.enable = true;

      vim.clipboard = {
        enable = true;
        registers = "unnamedplus";
        providers.wl-copy.enable = true;
      };

      vim.statusline.lualine.enable = true;

      vim.lsp.enable = true;
      vim.languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        #qml.enable = true;
      };

      vim.autocmds = [
        {
          event = [
            "BufRead"
            "BufWritePre"
          ];
          command = "lua vim.lsp.buf.format()";
        }
      ];
    };
  };
}
