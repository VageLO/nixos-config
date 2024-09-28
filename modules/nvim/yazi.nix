{
    programs.nixvim = {
        plugins.yazi = {
            enable = true;
            settings = {
                enable_mouse_support = true;
                open_for_directories = true;
            };
        };

        keymaps = [
            {
                mode = "n";
                key = "<leader>e";
                action = "<cmd>Yazi toggle<CR>";
                options = {
                    silent = true;
                    desc = "Yazi";
                };

            }
        ];
    };
}
