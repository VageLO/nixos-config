{
    programs.nixvim.plugins.tmux-navigator = {
        enable = true;
        keymaps = [
            {
                action = "left";
                key = "<C-h>";
            }
            {
                action = "down";
                key = "<C-j>";
            }
            {
                action = "up";
                key = "<C-k>";
            }
            {
                action = "right";
                key = "<C-l>";
            }
        ];
    };
}
