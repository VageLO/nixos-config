{ pkgs, ... }:

{
  home.packages = with pkgs; [
    aspell
    aspellDicts.en
    aspellDicts.ru
  ];
}
