{
  programs.kitty = {
    enable = true;
    shellIntegration.mode = "no-cursor";
    settings = {
      font_family = "UbuntuMono Nerd Font";
      font_size = 18;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      cursor_shape = "block";
    };
    extraConfig = ''
      foreground #adbac7
      background #000000
      selection_foreground #22272e
      selection_background #539bf5

      #: Cursor colors
      cursor #ffffff
      
      #: Tab bar colors
      tab_bar_background #1c2128
      active_tab_foreground #adbac7
      active_tab_background #22272e
      inactive_tab_foreground #768390
      inactive_tab_background #1c2128
      
      #: The basic 16 colors

      #: black
      color0 #000000
      color8 #636e7b
      
      #: red
      color1 #f47067
      color9 #ff938a
      
      #: green
      color2 #57ab5a
      color10 #6bc46d
      
      #: yellow
      color3 #c69026
      color11 #daaa3f
      
      #: blue
      color4 #539bf5
      color12 #6cb6ff
      
      #: magenta
      color5 #b083f0
      color13 #dcbdfb
      
      #: cyan
      color6 #39c5cf
      color14 #56d4dd
      
      #: white
      color7 #909dab
      color15 #cdd9e5

    '';
  };
}
