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

  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    sqlitebrowser
    lua-language-server
    wget
    xclip
    unstable.obsidian
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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
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
    DOTFILES = "$HOME/home-manager/dotfiles";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
