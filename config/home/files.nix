{ pkgs, config, ... }:

{
  # Place Files Inside Home Directory
  home.file.".config/zaney-stinger.mov".source = ./files/media/zaney-stinger.mov;
  home.file.".emoji".source = ./files/emoji;
  home.file.".base16-themes".source = ./files/base16-themes;
  home.file.".face".source = ./files/face.jpg; # For GDM
  home.file.".face.icon".source = ./files/face.jpg; # For SDDM
  home.file.".config/rofi/rofi.jpg".source = ./files/rofi.jpg;
  home.file.".config/starship.toml".source = ./files/starship.toml;
  home.file.".local/share/fonts" = {
    source = ./files/fonts;
    recursive = true;
  };
  home.file.".config/tmux".source = builtins.fetchGit {
   url = "git@github.com:Mr-JZ/tmuxconfig.git";
   rev = "f3773c6f6805d7f54044c9a78181b3cfee0cff50";
   submodules = true;
  };
  home.file.".config/nvim".source =  builtins.fetchGit {
    url = "git@github.com:Mr-JZ/nvimconfig.git";
    rev = "10a8960b09382e2c445b31f552e5eb436e934f25";
  };
}

