{ inputs, pkgs, config, ... }:
{
  imports = [
    ./bash.nix
    ./mpv.nix
    ./nvim
  ];
}
