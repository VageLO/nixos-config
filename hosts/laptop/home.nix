{ pkgs, config, inputs, ... }:
{
  imports = [
    ../../modules
  ];

  home.username = "vagelo";
  home.homeDirectory = "/home/vagelo";

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "VageLO";
        email = "48802151+VageLO@users.noreply.github.com";
      };
    };
    signing = {
      format = "openpgp";
    };
  };

  home.packages = with pkgs; [
    fff
    starship
    ff2mpv-rust
    qutebrowser
    pandoc
    autorandr
    quick-lookup
    zotero
    lazydocker
    uv
    nodejs
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
    anki-bin
    go
    google-chrome
    telegram-desktop
    zip
    unzip
    curl
    kitty
    #yazi
    cargo
    pkg-config
    gtk3
    wxGTK32
    scrot
  ];

  home.file = {
    ".config/google-chrome/NativeMessagingHosts/ff2mpv.json".source = "${pkgs.ff2mpv-rust}/etc/opt/chrome/native-messaging-hosts/ff2mpv.json";
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
