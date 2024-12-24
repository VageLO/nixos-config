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
              "buffer"
              "emoji"
              "spell"
              "git"
            ];
            providers = {
              emoji = {
                name = "emoji";
                module = "blink.compat.source";
              };
              git = {
                name = "git";
                module = "blink.compat.source";
                score_offset = 0;
              };
              spell = {
                name = "spell";
                module = "blink.compat.source";
                score_offset = 0;
              };
            };
          };

          completion = {
            trigger = {
              show_in_snippet = false;
            };
            documentation = {
              auto_show = true;
            };
            accept = {
              auto_brackets = {
                enabled = true;
              };
            };
          };

          windows = {
            documentation = {
              auto_show = false;
            };
          };

        };
      };
    };

  };
}
