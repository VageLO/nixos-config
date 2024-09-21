{
    programs.nixvim = {
        plugins.telescope = {
            enable = true;
            extensions = {
                fzf-native.enable = true;
                ui-select.enable = true;
            };
            keymaps = {
                "<leader>sf" = {
                    action = "find_files";
                };
                "<leader>sh" = {
                    action = "help_tags";
                };
                "<leader>sk" = {
                    action = "keymaps";
                };
                "<leader>sg" = {
                    action = "git_files";
                };
                "<leader>sc" = {
                    action = "commands";
                };
                "<leader><leader>" = {
                    action = "buffers";
                };
            };
        };

        keymaps = [
            {
                key = "<leader>sd";
                mode = "n";
                action = "<CMD>lua require'telescope.builtin'.find_files{cwd=vim.env.DOTFILES}<CR>";
            }
        ];

    };
}
