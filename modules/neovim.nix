{ inputs, ... }:
{
  environment.variables.EDITOR = "nvim";

  imports = [ inputs.nvf.nixosModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;

        autopairs = {
          "nvim-autopairs".enable = true;
        };

        options = {
          tabstop = 2;
          shiftwidth = 2;
        };
        treesitter.indent.enable = true;

        clipboard = {
          enable = true;
          registers = "unnamedplus";
          providers.wl-copy.enable = true;
        };

        statusline = {
          lualine.enable = true;
        };

        lsp.enable = true;
        lsp.formatOnSave = true;
        languages = {
          enableTreesitter = true;
          enableFormat = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          nix.format.type = [ "nixfmt" ];

          qml.enable = true;
        };

        git = {
          enable = true;
          neogit.enable = true;
          neogit.mappings.open = "gs";
        };
      };
    };
  };
}
