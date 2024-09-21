{
    programs.nixvim.plugins.harpoon = {
        enable = true;
        keymaps = {
            addFile = "<leader>ha";
            toggleQuickMenu = "<leader>hh";
            navFile = {
                "1" = "<leader>hf";
                "2" = "<leader>hd";
                "3" = "<leader>hs";
                "4" = "<leader>hc";
            };
        };
    };
}
