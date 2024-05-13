{
  config,
  pkgs,
  outputs,
  unstable,
  ...
}: {

  imports = [
    #outputs.homeManagerModules.nvim
    outputs.homeManagerModules.bash
    outputs.homeManagerModules.git
  ];

  home.username = "vagelo";
  home.homeDirectory = "/home/vagelo";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    unstable.obsidian
    unstable.mmex
    keepassxc
    mpv-unwrapped
    anki-bin
    kubernetes
    docker
    lazydocker
    google-chrome
    telegram-desktop
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/nvim" = {
      recursive = true;
      source = ./dotfiles/nvim;
    };
    ".config/alacritty" = {
      recursive = true;
      source = ./dotfiles/alacritty;
    };
    ".config/i3" = {
      recursive = true;
      source = ./dotfiles/i3;
    };
    ".config/i3status" = {
      recursive = true;
      source = ./dotfiles/i3status;
    };
    ".config/lazygit" = {
      recursive = true;
      source = ./dotfiles/lazygit;
    };
    ".config/tmux" = {
      recursive = true;
      source =  ./dotfiles/tmux;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
