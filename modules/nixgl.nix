{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixgl.defaultWrapper
  ];
}
