{ inputs, pkgs, config, ... }:
{
  imports = [
    ./bash.nix
    ./mpv.nix
    ./mmex.nix
    ./yazi.nix
    ./i3.nix
    ./i3status.nix
    ./lazygit.nix
    ./nvim
  ];
}
