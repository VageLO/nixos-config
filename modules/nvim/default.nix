{ inputs, pkgs, ... }:

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
    ./markview.nix
    ./ibl.nix
    ./conform.nix
    ./lspsaga.nix
    ./vimtex.nix
    ./obsidian.nix
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
      laststatus=3;
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
      signcolumn = "yes";
      conceallevel = 1;
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

    extraPackages = with pkgs; [
      black
    ];
  };
}
