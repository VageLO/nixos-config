{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
    };
    keymaps = [
      { mode = "n"; key = "<leader>hh"; action.__raw = "function() require'harpoon':list():add() end"; }
      { mode = "n"; key = "<leader>h"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
      { mode = "n"; key = "<leader>1"; action.__raw = "function() require'harpoon':list():select(1) end"; }
      { mode = "n"; key = "<leader>2"; action.__raw = "function() require'harpoon':list():select(2) end"; }
      { mode = "n"; key = "<leader>3"; action.__raw = "function() require'harpoon':list():select(3) end"; }
      { mode = "n"; key = "<leader>4"; action.__raw = "function() require'harpoon':list():select(4) end"; }
      { mode = "n"; key = "<leader>5"; action.__raw = "function() require'harpoon':list():select(5) end"; }
    ];
  };
}
