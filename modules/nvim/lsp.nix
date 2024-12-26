{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      servers = {
        lua_ls.enable = true;
        gopls.enable = true;
        nil_ls.enable = true;
        ts_ls.enable = true;
        ruff.enable = true;
        pyright.enable = true;
      };

      keymaps = {
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };

        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };

    };
  };
}
