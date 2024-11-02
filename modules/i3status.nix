{ config, pkgs, ... }:

{
  programs.i3status = {
    enable = true;
    enableDefault = false;

    general = {
      colors = true;
      interval = 10;
    };

    modules = {
      "tztime local" = {
        position = 7;
        settings = {
          format = "%Y-%m-%d %H:%M";
        };
      };

      "volume master" = {
        position = 6;
        settings = {
          format = "♪ %volume";
          format_muted = "♪ muted (%volume)";
          device = "default";
          mixer = "Master";
          mixer_idx = 0;
        };
      };

      "memory" = {
        position = 5;
        settings = {
          format = "%used | %available";
          threshold_degraded = "1G";
          format_degraded = "MEMORY < %available";
        };
      };

      "disk /" = {
        position = 4;
        settings = {
          format = "%avail";
        };
      };

      "battery all" = {
        position = 3;
        settings = {
          format = "%status %percentage %remaining";
        };
      };

      "ethernet _first_" = {
        position = 2;
        settings = {
          format_up = "E: %speed";
          format_down = "E: down";
        };
      };

      "wireless _first_" = {
        position = 1;
        settings = {
          format_up = "W:%quality ";
          format_down = "W: down ";
        };
      };

    };
  };
}
