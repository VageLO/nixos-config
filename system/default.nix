{
  config,
  pkgs,
  unstable,
  ...
}: {
  imports = [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Tallinn";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "et_EE.UTF-8";
    LC_IDENTIFICATION = "et_EE.UTF-8";
    LC_MEASUREMENT = "et_EE.UTF-8";
    LC_MONETARY = "et_EE.UTF-8";
    LC_NAME = "et_EE.UTF-8";
    LC_NUMERIC = "et_EE.UTF-8";
    LC_PAPER = "et_EE.UTF-8";
    LC_TELEPHONE = "et_EE.UTF-8";
    LC_TIME = "et_EE.UTF-8";
  };

	# Configure i3wm
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
  
    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
     ];
    };
  };
 
  users.users.vagelo = {
    isNormalUser = true;
    description = "vagelo";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    git
    lazygit
    gcc
    unstable.alacritty
  ];

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override {fonts = [ "UbuntuMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "UbuntuMono Nerd Font" ];
        sansSerif = [ "UbuntuMono Nerd Font" ];
        monospace = [ "UbuntuMono Nerd Font" ];
      };
    };
  };

 system.stateVersion = "23.11"; # Did you read the comment?
}
