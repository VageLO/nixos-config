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
    userName = "VageLO";
    userEmail = "48802151+VageLO@users.noreply.github.com";
  };

  home.packages = with pkgs; [
    insomnia
    gimp
    zathura
    discord
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
    ".config/alacritty" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/alacritty";
    };
    ".config/kitty" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/kitty";
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
