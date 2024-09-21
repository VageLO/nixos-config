{
    programs.nixvim = {
        plugins.lazygit.enable = true;

        keymaps = [
            {
                key = "<leader>lg";
                mode = "n";
                action = "<CMD>LazyGit<CR>";
                options.desc = "Lazy Git";
            }
        ];
    };
}
