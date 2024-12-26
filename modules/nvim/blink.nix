{
  programs.nixvim = {
    plugins = {
      cmp-emoji.enable = true;
      cmp-git.enable = true;
      cmp-spell.enable = true;

      blink-cmp = {
        enable = true;

        settings = {
          keymap = {
            preset = "default";
          };

          signature = {
            enable = true;
          };

          sources = {
            default = [
              "lsp"
              "path"
              "luasnip"
              "spell"
              "emoji"
              "git"
            ];
            providers = {
              lsp = {
                name = "lsp";
                enable = true;
                module = "blink.cmp.sources.lsp";
                kind = "LSP";
                score_offset = 1000;
              };
              emoji = {
                name = "emoji";
                enable = true;
                module = "cmp_emoji";
                score_offset = 950;
              };
              git = {
                name = "git";
                enable = true;
                module = "blink.compat.source";
                score_offset = 900;
              };
              spell = {
                name = "spell";
                enable = true;
                module = "blink.compat.source";
                score_offset = 920;
              };
            };
          };

          windows = {
            documentation = {
              auto_show = true;
            };
          };

        };
      };
    };

  };
}
