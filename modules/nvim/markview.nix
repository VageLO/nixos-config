{
    programs.nixvim.plugins.markview = {
        enable = true;
        settings = {
            preview.hybrid_modes = [
              "i"
            ];
            preview.modes = [
              "n"
            ]; 
        };
    };
}
