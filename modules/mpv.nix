{ config, pkgs, ... }:

{
    programs.mpv.enable = true;
    home.file = {
        ".config/mpv" = {
            source = pkgs.fetchgit {
                url = "https://github.com/VageLO/mpv2anki";
                hash = "sha256-APUS8Q+MrV1NtO0kJqg1V576nT3l9py+aVDLvF/r+do=";
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
    home.packages = with pkgs; [
        ffmpeg_7
        (python3.withPackages (ps: with ps; [
            pip
            requests
            beautifulsoup4
        ]))
    ];
}
