{ config, pkgs, ... }: 

{
  programs.neovim = {
    enable = true;

    #extraLuaConfig = ''
    #'';
  };
}
