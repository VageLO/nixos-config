{ pkgs, config, ... }:
{
  imports = [
    ../../modules/shell
  ];

  home.username = "vagelo";
  home.homeDirectory = "/home/vagelo";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.git = {
    enable = true;
    userName  = "VageLO";
    userEmail = "48802151+VageLO@users.noreply.github.com";
  };

  home.packages = with pkgs; [
    sqlitebrowser
    lua-language-server
    wget
    xclip
    obsidian
    keepassxc
    mpv-unwrapped
    anki-bin
    kubernetes
    docker
    lazydocker
    go
    google-chrome
    telegram-desktop
    zip
    unzip
  ];

  home.file = {
    ".config/nvim" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/nvim";
    };
    ".config/alacritty" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/alacritty";
    };
    ".config/i3" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/i3";
    };
    ".config/i3status" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/i3status";
    };
    ".config/lazygit" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/lazygit";
    };
    ".config/tmux" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/tmux";
    };
    ".config/rofi" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/rofi";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    DOTFILES = "$HOME/home-manager";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;
}
