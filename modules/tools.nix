{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wireshark-qt
    sleuthkit
    cyberchef
  ];
}
