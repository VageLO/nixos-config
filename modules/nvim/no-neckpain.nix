{ pkgs, ... }:

{
    programs.nixvim = {
        extraPlugins = with pkgs.vimPlugins; [
            no-neck-pain-nvim            
        ];

        keymaps = [
            {
                key = "<leader>nn";
                mode = "n";
                action = "<cmd>NoNeckPain<cr>";
                options.desc = "[N]o [N]eckpain";
            }
        ];
    };
}
