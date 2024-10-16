{ inputs, pkgs, config, ... }:
{
  imports = [
    ./bash.nix
    ./mpv.nix
    ./mmex.nix
    ./yazi.nix
    ./nvim
  ];
}
