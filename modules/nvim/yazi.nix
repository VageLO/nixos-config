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
                key = "<leader>y";
                action = "<cmd>Yazi<CR>";
                options = {
                    silent = true;
                    desc = "Yazi";
                };

            }
        ];
    };
}
