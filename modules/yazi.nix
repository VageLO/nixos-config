{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        sort_by = "mtime";
        sort_reverse = true;
        show_hidden = true;
        linemode = "mtime";
        ratio = [ 2 4 2 ];
      };
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          run = "cd $DOTFILES";
          on = [ "s" "d" ];
          desc = "Go to Config";
        }
        {
          run = "shell $SHELL --block --confirm";
          on = [ "!" ];
          desc = "Open kitty here";
        }
      ];
    };
  };
}
