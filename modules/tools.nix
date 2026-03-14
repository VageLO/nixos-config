{ pkgs, ... }:
{
  home.packages = with pkgs; [
    binutils
    nasm
    gdb
    wireshark-qt
    sleuthkit
    cyberchef
  ];
}
