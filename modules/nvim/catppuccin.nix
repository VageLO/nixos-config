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
