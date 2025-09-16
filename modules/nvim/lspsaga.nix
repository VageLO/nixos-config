{
  programs.nixvim = {
    plugins.lspsaga = {
      enable = true;
      settings = {
        lightbulb.enable = false;
        ui = {
          border = "rounded";
          title = true;
        };
      };
    };

    keymaps = [
      { key = "<leader>j"; mode = [ "n" ]; action = "<cmd>Lspsaga diagnostic_jump_next<cr>"; }
      { key = "<leader>k"; mode = [ "n" ]; action = "<cmd>Lspsaga diagnostic_jump_prev<cr>"; }
      { key = "<leader>lt"; mode = [ "n" ]; action = "<cmd>Lspsaga term_toggle<cr>"; }
      { key = "<leader>lr"; mode = [ "n" ]; action = "<cmd>Lspsaga rename ++project<cr>"; }
      { key = "<leader>l."; mode = [ "n" ]; action = "<cmd>Lspsaga show_line_diagnostics<cr>"; }
      { key = "gd"; mode = [ "n" ]; action = "<cmd>Lspsaga goto_definition<cr>"; }
      { key = "gt"; mode = [ "n" ]; action = "<cmd>Lspsaga goto_type_definition<cr>"; }
      { key = "gpd"; mode = [ "n" ]; action = "<cmd>Lspsaga peek_definition<cr>"; }
      { key = "gpt"; mode = [ "n" ]; action = "<cmd>Lspsaga peek_type_definition<cr>"; }
      { key = "K"; mode = [ "n" ]; action = "<cmd>Lspsaga hover_doc<cr>"; }
    ];
  };
}
