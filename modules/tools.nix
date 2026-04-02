{ pkgs, ... }:
{
  home.packages = with pkgs; [
    binutils
    nasm
    gdb
    wireshark
    sleuthkit
    cyberchef
  ];
}
