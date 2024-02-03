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
  nixpkgs.config.allowUnfree = true;
  # List System Programs
  environment.systemPackages = with pkgs; [
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
    tmux
    rustup 
    distrobox # generate a distro that can help to install packages
    (pkgs.python3.withPackages my-python-packages)
  ];

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

  programs.tmux = {
    enable = true;
    tmux.enableShellIntegration = true;
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
