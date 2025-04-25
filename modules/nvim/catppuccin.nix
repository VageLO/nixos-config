{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        term_colors = true;
        transparent_background = false;
        color_overrides = {
          mocha = {
            base = "#000000";
            mantle = "#000000";
            crust = "#000000";
            text = "#ffffff";
          };
        };
        custom_highlights = ''
          function(colors)
            return {
              WinSeparator = { fg = colors.text, bg = colors.none, ctermfg = "White", ctermbg = "NONE", force = true },
            }
          end
        '';
        itegrations = {
          telescope = {
            enable = true;
            style = "nvchad";
          };
          dropbar = {
            enable = true;
            color_mode = true;
          };
        };
      };

    };
  };
}
