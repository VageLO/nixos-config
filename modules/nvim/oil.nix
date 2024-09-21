{
    programs.nixvim = {
        plugins.oil = {
            enable = true;
            settings = {
                keymaps = {
                    "H" = "actions.parent";
                    "L" = "actions.select";
                    "<leader>e" = "actions.close";
                };
                view_options = {
                    show_hidden = true;
                };
            };
        };

        keymaps = [
            {
                key = "<leader>e";
                mode = "n";
                action = "<CMD>Oil<CR>";
                options.desc = "Oil: Open parent directory";
            }
        ];
    };
}
