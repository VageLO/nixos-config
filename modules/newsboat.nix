{ pkgs, ... }:

{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    browser = "${pkgs.google-chrome}/bin/google-chrome-stable";
    reloadTime = 180;
    urls = [
      { url = "https://feeds.feedburner.com/TechCrunch/"; tags = [ "news" ]; }
      { url = "https://www.wired.com/feed/rss"; tags = [ "news" ]; }
      { url = "https://feeds.feedburner.com/TheHackersNews"; tags = [ "news" ]; }
      { url = "https://feeds.arstechnica.com/arstechnica/index"; tags = [ "news" ]; }
      { url = "https://www.youtube.com/feeds/videos.xml?playlist_id=PL2Fq-K0QdOQiJpufsnhEd1z3xOv2JMHuk"; tags = [ "podcast" ]; }
      { url = "https://feeds.megaphone.fm/QCD6036500916"; tags = [ "podcast" ]; }
      { url = "https://feeds.megaphone.fm/TPC1602991613"; tags = [ "podcast" ]; }
      { url = "https://anchor.fm/s/101adcf44/podcast/rss"; tags = [ "podcast" ]; }
      { url = "https://feeds.simplecast.com/3hnxp7yk"; tags = [ "podcast" ]; }
      { url = "https://feeds.megaphone.fm/hubermanlab"; tags = [ "podcast" ]; }
      { url = "https://api.substack.com/feed/podcast/10845.rss"; tags = [ "podcast" ]; }
      { url = "https://lexfridman.com/feed/podcast/"; tags = [ "podcast" ]; }
      { url = "https://feeds.megaphone.fm/SIXMSB5088139739"; tags = [ "podcast" ]; }
      { url = "https://feeds.megaphone.fm/thediaryofaceo"; tags = [ "podcast" ]; }
      { url = "https://feeds.megaphone.fm/GLT1412515089"; tags = [ "podcast" ]; }
    ];
    extraConfig = ''
      macro m set browser "mpv --player-operation-mode=pseudo-gui -- %u &"; one ; set browser "${pkgs.google-chrome}/bin/google-chrome-stable %u &"

      # podboat
      download-path "~/Downloads/%n"
      player "mpv --player-operation-mode=pseudo-gui"

      # unbind defaults
      unbind-key ENTER
      unbind-key h
      unbind-key j
      unbind-key k
      unbind-key l

      # vim style movement
      bind-key h quit
      bind-key j down
      bind-key k up
      bind-key l open
      # home/end

      unbind-key g
      bind-key g home
      unbind-key G
      bind-key G end
    '';
  };
}
