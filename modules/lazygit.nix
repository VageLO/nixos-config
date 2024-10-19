{
  programs.lazygit= {
    enable = true;
    settings = {
      gui = {
        showBottomLine = false;
      };

      os = {
        open = "xdg-open {{filename}} >/dev/null";
        edit = "nvim {{filename}}";
      };
    };
  };
}
