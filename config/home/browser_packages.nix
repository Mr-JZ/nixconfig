
{ pkgs, config, browser, wallpaperDir, flakeDir,
  username, wallpaperGit, ... }:

{
  # Install Packages For The User
  home.packages = with pkgs; [
    chromedriver
    chromium
    firefox
    pkgs."${browser}" 
  ];

  programs.fzf = {
    enable = true;
  };
}
