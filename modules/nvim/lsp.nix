{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        gopls.enable = true;
        nil_ls.enable = true;
        ts_ls.enable = true;
        ruff.enable = true;
        pyright = {
          enable = true;
          settings = {
            python = {
              pythonPath = "./.venv/bin/python";
              analysis = {
                autoSearchPaths = true;
                useLibraryCodeForTypes = true;
                typeCheckingMode = "off";
                ignore = [ "*" ];
              };
            };
          };
        };
      };
    };

  };
}
