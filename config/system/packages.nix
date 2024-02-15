{ pkgs, config, inputs, ... }:

let
  my-python-packages = ps: with ps; [
    pandas
    requests
    pendulum # daytime made easy
    pypdf # pdf manipulation
    icecream # print debugging
    loguru # logging
    rich # rich print
    tqdm # progress bar
    xarray # n-d array
    polars # data manipulation
    seaborn # data visualization
    result # result type
    pydantic # data validation
    fastapi # web framework
    sqlmodel # orm
    httpx # http client
    python-dotenv # env variables
  ];
in {
  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
      "electron-19.1.9"
    ];
  };
  # List System Programs
  environment.systemPackages = with pkgs; [
    libusb1
    wget 
    curl 
    git 
    cmatrix 
    lolcat 
    neofetch 
    htop 
    btop 
    libvirt
    virt-viewer 
    polkit_gnome 
    lm_sensors 
    unzip 
    unrar 
    libnotify 
    eza
    v4l-utils 
    ydotool 
    wl-clipboard 
    socat 
    cowsay 
    lsd 
    lshw
    pkg-config 
    meson 
    hugo 
    gnumake 
    ninja 
    go 
    nodejs 
    symbola
    noto-fonts-color-emoji 
    material-icons 
    brightnessctl
    toybox 
    gh
    neovim
    vim
    ripgrep
    zoxide
    fzf
    tmux
    tmuxPlugins.tmux-fzf
    rustup 
    cargo
    distrobox # generate a distro that can help to install packages
    flutter
    android-studio
    usbutils
    yubikey-manager-qt
    zulu17 # java 17 jdk
    (pkgs.python3.withPackages my-python-packages)
  ];
  environment.sessionVariables = rec {
    CHROME_EXECUTABLE = pkgs.chromedriver + "/bin/chromedriver";
  };
  programs.adb.enable = true;

  programs.steam.gamescopeSession.enable = true;
  programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
  
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  virtualisation.libvirtd.enable = true;
  virtualisation.docker = {
    enable = true;
    # If you have a special storage format you can set it here
    # storgeDriver = "btrfs";
  };
  programs.virt-manager.enable = true;
}
