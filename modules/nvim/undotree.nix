{
    programs.nixvim = {
        plugins.undotree = {
            enable = true;
            settings = {
                SetFocusWhenToggle = true;
            };
        };

        keymaps = [
            {
                mode = "n";
                key = "<leader>u";
                action = "<cmd>UndotreeToggle<CR>";
                options = {
                    silent = true;
                    desc = "Undotree";
                };

            }
        ];
    };
}
