{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    historyLimit = 25000;
    prefix = "C-a";
    mouse = true;
    customPaneNavigationAndResize = true;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      resurrect
    ];

    extraConfig = ''
      set -g allow-passthrough on
      set -ga update-environment TERM

      set -g status-style "fg=white,bg=#000000"

      set -g status-position top
      set -g status-interval 1

      set -g status-left ""
      set -g status-right "#(pomo)"

      bind '"' split-window -v -c "#{pane_current_path}"
      bind-key % split-window -h -c "#{pane_current_path}"

      bind-key -r C-h select-window -t :-
      bind-key -r C-l select-window -t :+

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

    '';
  };
}
