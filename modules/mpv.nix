{ config, pkgs, ... }:

{
    programs.mpv.enable = true;
    home.file = {
        ".config/mpv" = {
            source = pkgs.fetchgit {
                url = "https://github.com/VageLO/mpv2anki";
                hash = "sha256-tTss8yN18uGvoy1jWOfHCHh79sAv9MOlbq66YMd9aCA=";
            };
            recursive = true;
        };
        ".local/share/Anki2/mpv.conf" = {
            text = ''
                sid=1
                volume=60
            '';
            executable = false;
        };
    };

    #home.file = {
    #    ".config/mpv" = {
    #        recursive = true;
    #        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/app/mpv2anki";
    #    };
    #};

    home.packages = with pkgs; [
        ffmpeg_7
        (python3.withPackages (ps: with ps; [
            pip
            requests
            beautifulsoup4
        ]))
    ];
}
