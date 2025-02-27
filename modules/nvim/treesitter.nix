{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    nixGrammars = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      go
      python
      javascript
      make
      markdown
      nix
      regex
      toml
      vim
      vimdoc
      xml
      yaml
    ];
    settings = {
      indent.enable = true;
      highlight.enable = true;
    };
  };
}
