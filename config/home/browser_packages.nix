
{ pkgs, config, browser, wallpaperDir, flakeDir,
  username, wallpaperGit, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    chromium
    firefox
    google-chrome
    mullvad-vpn
    pkgs."${browser}" 
  ];
}
