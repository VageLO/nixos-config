{
  networking = {
    nameservers = [ "127.0.0.1" ];
  };

  services = {
    blocky.enable = true;
    blocky.settings = {
      prometheus = {
        enable = true;
        path = "/metrics";
      };

      upstreams.groups = {
        default = [
          "1.1.1.1"
          "8.8.8.8"
        ];
      };

      bootstrapDns = {
        upstream = "https://one.one.one.one/dns-query";
        ips = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };

      blocking = {
        loading = {
          downloads = {
            timeout = "4m";
            attempts = 5;
          };
        };

        denylists = {
          ads = [
            "https://blocklistproject.github.io/Lists/ads.txt"
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
            "https://adaway.org/hosts.txt"
            "https://v.firebog.net/hosts/AdguardDNS.txt"
            "https://v.firebog.net/hosts/Admiral.txt"
            "https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
            "https://v.firebog.net/hosts/Easylist.txt"
            "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts"
            "https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts"
            "https://raw.githubusercontent.com/AdGoBye/AdGoBye-Blocklists/main/AGBBase.toml"
            "https://raw.githubusercontent.com/AdGoBye/AdGoBye-Blocklists/main/AGBCommunity.toml"
            "https://raw.githubusercontent.com/AdGoBye/AdGoBye-Blocklists/main/AGBUpsell.toml"
            "https://raw.githubusercontent.com/AdGoBye/AdGoBye-Blocklists/main/AGBSupporters.toml"
          ];
          tracking = [
            "https://v.firebog.net/hosts/Easyprivacy.txt"
            "https://v.firebog.net/hosts/Prigent-Ads.txt"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts"
            "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
            "https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt"
          ];
          malicious = [
            "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt"
            "https://osint.digitalside.it/Threat-Intel/lists/latestdomains.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt"
            "https://v.firebog.net/hosts/Prigent-Crypto.txt"
            "https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts"
            "https://v.firebog.net/hosts/RPiList-Phishing.txt"
            "https://v.firebog.net/hosts/RPiList-Malware.txt"
          ];
          adult = [
            "https://blocklistproject.github.io/Lists/porn.txt"
          ];
          #distraction = [
          #  ''
          #  www.youtube.com
          #  *.youtube.com
          #  *.reddit.com
          #  *.twitch.tv
          #  *.instagram.com
          #  *.x.com
          #  ''
          #];
        };
        clientGroupsBlock = {
          default = [
            "adult"
            "tracking"
            "malicious"
          ];
        };
      };

      ports = {
        dns = 53;
        http = 4000;
      };

      log = {
        level = "info";
        format = "text";
        timestamp = true;
        privacy = false;
      };

    };
  };
}
