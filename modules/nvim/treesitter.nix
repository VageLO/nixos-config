{
    programs.nixvim.plugins.treesitter = {
        enable = true;
        settings = {
            indent.enable = true;
            highlight.enable = true;
            auto_install = true;
            ensure_installed = [
                "gitignore"
                "lua"
                "go"
                "python"
                "json"
                "bash"
                "yaml"
            ];
        };
    };
}
