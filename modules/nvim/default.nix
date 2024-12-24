{ inputs, ... }:

{
  imports = [
    ./catppuccin.nix
    ./lazygit.nix
    ./harpoon.nix
    ./no-neckpain.nix
    ./tmux-navigator.nix
    ./telescope.nix
    ./todo-comments.nix
    ./treesitter.nix
    ./undotree.nix
    ./yazi.nix
    ./lsp.nix
    ./blink.nix
    ./blink-compat.nix
    ./markview.nix
    ./ibl.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
      loaded_netrwPlugin = 0;
    };

    luaLoader.enable = true;
    clipboard.providers.xclip.enable = true;

    plugins = {
      lualine.enable = true;
      nix.enable = true;
      web-devicons.enable = true;
    };

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

    keymaps = [
      {
        key = "<leader>y";
        mode = [ "v" ];
        action = "\"+y";
      }
      {
        key = "<leader>y";
        mode = [ "n" ];
        action = "\"+yy";
      }
    ];

  };
}

