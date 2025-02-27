{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["vagelo"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      glibc
    ];
  };

  # Disable suspend on idle
  services.logind = {
    extraConfig = ''
      IdleAction=ignore
      IdleActionSec=0min
    '';
  };

  # Firewall
  networking.firewall = {
    enable = true;
    interfaces = {
      "wlp4s0".allowedTCPPorts = [ 8083 ];
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };

  services.usbmuxd.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    daemon.settings = {
      data-root = "/home/vagelo/docker";
    };
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure i3wm
  services.displayManager = {
    defaultSession = "none+i3";
  };

  services.xserver = {
    xkb = {
      layout = "us,ru";
      variant = "";
      options = "grp:ctrl_alt_toggle";
    };
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager.sessionCommands = ''
      xset s off
      xset -dpms
      xset s noblank
    '';

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        i3status
      ];
    };
    xrandrHeads = [
      {
        output = "HDMI-1";
        primary = true;
      }
    ];
  };

  users.users.vagelo = {
    isNormalUser = true;
    description = "vagelo";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd"];
  };

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    libimobiledevice
    ifuse
    neovim
    git
    lazygit
    gcc
    gnumake
    alacritty
    tmux
    ripgrep
  ];

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.ubuntu-mono
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "UbuntuMono Nerd Font" ];
        sansSerif = [ "UbuntuMono Nerd Font" ];
        monospace = [ "UbuntuMono Nerd Font" ];
      };
    };
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}
