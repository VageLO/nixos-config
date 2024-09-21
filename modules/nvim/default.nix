{ inputs, ... }:

{
    imports = [
        ./catppuccin.nix    
        ./oil.nix
        ./lazygit.nix
        ./harpoon.nix
        ./no-neckpain.nix
        ./tmux-navigator.nix
        ./telescope.nix
        ./todo-comments.nix
        ./treesitter.nix
        ./undotree.nix
        ./yazi.nix
        inputs.nixvim.homeManagerModules.nixvim
    ];

    programs.nixvim = {
        enable = true;
        globals.mapleader = " ";

        luaLoader.enable = true;
        clipboard.providers.wl-copy.enable = true;

        plugins.lualine.enable = true;

        opts = {
            number = true;
	        tabstop = 4;
	        relativenumber = true;
	        cursorline = true;
	        linebreak = true;
	        scrolloff = 10;
	        softtabstop = 4;
	        shiftwidth = 4;
	        expandtab = true;
	        guicursor = "n-v-i-c:block-Cursor";
        };
    };
}
