{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      v = "nvim";
      ".." = "cd ..";
      lg = "lazygit";
      cl = "clear";
      ct = "rm -rf ~/.local/share/Trash";
      ll = "yazi";
      hm = "home-manager switch --flake $DOTFILES/#vagelo@lp";
      nm = "sudo nixos-rebuild switch --flake $DOTFILES";
    };
  };
}
