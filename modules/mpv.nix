{ config, pkgs, ... }:
{
  programs.mpv.enable = true;
  home.file = {
    ".config/mpv" = {
      recursive = true;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/home-manager/dotfiles/mpv";
    };
    ".local/share/Anki2/mpv.conf" = {
      text = ''
                sid=1
                volume=60
      '';
      executable = false;
    };
  };

  home.packages = with pkgs; [
    chromedriver
    chromium
    ffmpeg_7
  ];
}
