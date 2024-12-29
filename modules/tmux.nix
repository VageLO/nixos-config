{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    historyLimit = 25000;
    prefix = "C-a";
    mouse = true;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];

    extraConfig = ''
      set -g status-style "fg=white,bg=#000000"
      set -g allow-passthrough on
      set -ga update-environment TERM

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

    '';
  };
}
