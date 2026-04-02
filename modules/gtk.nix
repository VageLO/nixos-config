{ pkgs, config, ... }:
{
  gtk.gtk4.theme = config.gtk.theme;
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.packages = with pkgs; [
    dconf
    adw-gtk3
    libadwaita
  ];
}
