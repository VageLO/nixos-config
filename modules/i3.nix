{ lib, ... }:

let
   mod = "Mod1"; 
in 
{
  xsession.windowManager.i3 = {
    enable = true;
    config = {

      modifier = mod;
      floating.modifier = mod;
      workspaceLayout = "tabbed";

      colors = {
        background = "#000000";
      };

      fonts = {
        names = [ "Monospace" ];
        style = "";
        size = 10.0;
      };

      window = {
        border = 2;
        hideEdgeBorders = "vertical";
      };

      bars = [
        {
          trayOutput = "primary";
          statusCommand = "i3status";
          fonts = {
            size = 10.0;
          };
        }
      ];

      modes = {
        resize = {
              l = "resize shrink width 10 px or 10 ppt";
              k = "resize grow height 10 px or 10 ppt";
              j = "resize shrink height 10 px or 10 ppt";
              h = "resize grow width 10 px or 10 ppt";
      
              Right = "resize shrink width 10 px or 10 ppt";
              Up = "resize grow height 10 px or 10 ppt";
              Down = "resize shrink height 10 px or 10 ppt";
              Left = "resize grow width 10 px or 10 ppt";
      
              # back to normal: Enter or Escape or $mod+r
              Return = "mode default";
              Escape = "mode default";
        };
      };

      assigns = {
        "3" = [
          { class = "obsidian"; }
          { class = "mpv"; }
          { class = "anki"; }
        ];
      };

      keybindings = lib.mkDefault {

        # start rofi(a program launcher)
        "${mod}+d" = "exec rofi -modi drun -show drun";

        # start a terminal
        "${mod}+Return" = "exec kitty -e tmux";

        # kill focused window
        "${mod}+Shift+q" = "kill";
        
        # Screenshot
        "${mod}+p" = "exec scrot 'screenshot_%Y-%m-%d_%H-%M-%S.png' -q 100 -M 0 -e 'xclip -selection clipboard -target image/png -i $f && mv $f ~/Pictures/'";
        "${mod}+Shift+p" = "exec scrot 'screenshot_%Y-%m-%d_%H-%M-%S.png' -q 100 -M 0 -e 'xclip -selection clipboard -target image/png -i $f && rm $f'";
        
        # change focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        
        # move focused window
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        
        # alternatively, you can use the cursor keys:
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";
        
        # split in horizontal orientation
        "${mod}+z" = "split h";
        
        # split in vertical orientation
        "${mod}+v" = "split v";
        
        # enter fullscreen mode for the focused container
        "${mod}+f" = "fullscreen toggle";
        
        # change container layout (stacked, tabbed, toggle split)
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        
        # toggle tiling / floating
        "${mod}+Shift+space" = "floating toggle";
        
        # change focus between tiling / floating windows
        "${mod}+space" = "focus mode_toggle";
        
        # focus the parent container
        "${mod}+a" = "focus parent";
        
        # switch to workspace
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        
        # move focused container to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
        
        # reload the configuration file
        "${mod}+Shift+c" = "reload";

        # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
        "${mod}+Shift+r" = "restart";

        # exit i3 (logs you out of your X session)
        "${mod}+Shift+e" = "exec i3-msg exit";
        
        # resize window (you can also use the mouse for that)
        "${mod}+r" = "mode resize";
        
        # sound
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

        "${mod}+Shift+F1" = "exec systemctl reboot";
        "${mod}+Shift+F2" = "exec systemctl suspend";
        "${mod}+Shift+F4" = "exec systemctl poweroff";
      };
    };
  };
}
