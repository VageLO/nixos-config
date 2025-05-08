{
  programs.nixvim.plugins.markview = {
    enable = true;
    settings = {
      preview.hybrid_modes = [
        "n"
        "i"
      ];
      preview.modes = [
        "n"
        "no"
        "c"
      ];
    };
  };
}
