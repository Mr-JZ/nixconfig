{ pkgs, config, browser, wallpaperDir, flakeDir,
  username, wallpaperGit, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    pkgs."${browser}" discord libvirt swww grim slurp gnome.file-roller
    swaynotificationcenter rofi-wayland imv transmission-gtk mpv
    gimp obs-studio blender-hip kdenlive audacity
    font-awesome spotify swayidle neovide pavucontrol
    element-desktop swaylock stow home-manager
    chromium
    jellyfin-media-player
    ticktick
    lazygit
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    # Import Scripts
    (import ./../scripts/emopicker9000.nix { inherit pkgs; })
    (import ./../scripts/task-waybar.nix { inherit pkgs; })
    (import ./../scripts/squirtle.nix { inherit pkgs; })
    (import ./../scripts/wallsetter.nix { inherit pkgs; inherit wallpaperDir;
      inherit username; inherit wallpaperGit; })
    (import ./../scripts/themechange.nix { inherit pkgs; inherit flakeDir; })
    (import ./../scripts/theme-selector.nix { inherit pkgs; })
    (import ./../scripts/nvidia-offload.nix { inherit pkgs; })
  ];
}