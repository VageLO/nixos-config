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

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vagelo";
  home.homeDirectory = "/home/vagelo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    unstable.obsidian
    unstable.mmex
    kubernetes
    docker
    lazydocker
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
      source =  ./dotfiles/nvim;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
