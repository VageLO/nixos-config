{ pkgs, config, ... }:
{
  imports = [
    ../../modules
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
    deluge
    sqlitebrowser
    lua-language-server
    wget
    xclip
    obsidian
    keepassxc
    mpv
    anki-bin
    go
    google-chrome
    telegram-desktop
    zip
    unzip
    curl
    kitty
    yazi
    cargo
    pkg-config
    gtk3
    wxGTK32
    scrot
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
    ".config/kitty" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/kitty";
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
    TERM = "xterm-kitty";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;
}
