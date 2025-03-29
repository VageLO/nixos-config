{
    programs.nixvim.plugins.harpoon = {
        enable = true;
        keymaps = {
            addFile = "<leader>hh";
            toggleQuickMenu = "<leader>h";
            navFile = {
                "1" = "<leader>1";
                "2" = "<leader>2";
                "3" = "<leader>3";
                "4" = "<leader>4";
            };
        };
    };
}
