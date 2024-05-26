{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      v = "nvim";
      ".." = "cd ..";
      lg = "lazygit";
      la = "ls -la";
      ll = "ls -l";
      cl = "clear";
    };
  };
}
