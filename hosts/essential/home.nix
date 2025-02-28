{ pkgs, config, ... }:
{
  imports = [
    ../../modules/bash.nix
    ../../modules/yazi.nix
    ../../modules/i3.nix
    ../../modules/i3status.nix
    ../../modules/lazygit.nix
    ../../modules/aspell.nix
    ../../modules/tmux.nix
    ../../modules/kitty.nix
    ../../modules/nixgl.nix
    ../../modules/nvim
  ];

  home.username = "vagelo";
  home.homeDirectory = "/home/vagelo";

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "VageLO";
    userEmail = "48802151+VageLO@users.noreply.github.com";
    signing = {
      format = "openpgp";
    };
  };

  home.packages = with pkgs; [
    tmux
    uv
    nodejs
    insomnia
    discord
    sqlitebrowser
    lua-language-server
    wget
    xclip
    obsidian
    keepassxc
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
    ".config/rofi" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/rofi";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    DOTFILES = "$HOME/home-manager";
    VAULT = "$HOME/main-vault";
    TERM = "xterm-kitty";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;
}
