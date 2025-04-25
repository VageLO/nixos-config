{ config, pkgs, ... }:
{
  programs.nixvim.plugins.vimtex = {
    enable = true;
    settings = {
      texlivePackage = pkgs.texliveFull;
      view_method = "zathura";
      compiler_latexmk = {
        aux_dir = "${config.home.homeDirectory}/.texfiles/";
        out_dir = "${config.home.homeDirectory}/.texfiles/";
      };
    };
  };
}
