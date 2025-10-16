{ config, pkgs, lib, ... }:
let
  dotfiles = "${config.home.homeDirectory}/home-manager/dotfiles";
in
{
  programs.i3blocks = {
    enable = true;
    bars = {
      bottom = {
        pomo =  {
          command = "bash ${dotfiles}/pomo.sh -v ${config.home.sessionVariables.VAULT}";
          interval = 1;
        };
        volume_custom = lib.hm.dag.entryAfter [ "pomo" ] {
          command = ''
            exec bash VOL_INFO=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
            VOL=$(echo "$VOL_INFO" | awk '{printf "%.0f", $2 * 100}')
            if echo "$VOL_INFO" | grep -q "\[MUTED\]"; then
              echo "muted ($VOL)"
            else
              echo "$VOL"
            fi
          '';
          interval = 5;
        };
        time = lib.hm.dag.entryAfter [ "volume_custom" ] {
          command = "date +'%d-%m-%Y %r'";
          interval = 1;
        };
      };
    };
  };
}
