{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      v = "nvim";
      ".." = "cd ..";
      lg = "lazygit";
      ll = "nnn";
      cl = "clear";
      ya = "yazi";
      hm = "home-manager switch --flake ~/home-manager/#vagelo@lp";
      nm = "sudo nixos-rebuild switch --flake ~/home-manager/";
    };
  };
}
