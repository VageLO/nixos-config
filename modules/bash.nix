{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      v = "nvim";
      ".." = "cd ..";
      lg = "lazygit";
      cl = "clear";
      ll = "yazi";
      sd = "cd $DOTFILES";
      hm = "home-manager switch --flake $DOTFILES/#vagelo@lp";
      nm = "sudo nixos-rebuild switch --flake $DOTFILES";
    };
  };
}
