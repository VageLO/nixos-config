{
  programs.nixvim = {
    plugins = {
      blink-emoji.enable = true;
      blink-cmp-spell.enable = true;
      friendly-snippets.enable = true;

      blink-cmp = {
        enable = true;

        settings = {
          completion = {
            accept = {
              auto_brackets = {
                enabled = true;
                semantic_token_resolution = {
                  enabled = false;
                };
              };
            };
            documentation = {
              auto_show = true;
            };
          };

          keymap = {
            preset = "default";
          };

          sources = {
            default = [
              "lsp"
              "obsidian"
              "obsidian_new"
              "obsidian_tags"
              "path"
              "snippets"
              "emoji"
              "spell"
            ];

            providers = {
              lsp = {
                name = "LSP";
                module = "blink.cmp.sources.lsp";
              };
              path = {
                name = "Path";
                module = "blink.cmp.sources.path";
              };
              snippets = {
                name = "Snippets";
                module = "blink.cmp.sources.snippets";
              };
              emoji = {
                name = "Emoji";
                module = "blink-emoji";
              };
              spell = {
                name = "Spell";
                module = "blink-cmp-spell";
              };
            };
          };

        };
      };
    };

  };
}
