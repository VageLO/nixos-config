{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      servers = {
        lua-ls.enable = true;
        gopls.enable = true;
        pyright.enable = true;
        nixd = {
          enable = true;
          settings = {
            formatting = {
              command = [ "nixpkgs-fmt" ];
            };
          };
        };
      };

      keymaps = {
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
    };
    plugins.lsp-format = {
      enable = true;
    };
    plugins.cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        completion = {
          keyword_length = 2;
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };
  };
}
