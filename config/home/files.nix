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
  home.file.".config/tmux" = builtins.fetchGit {
    url = "https://github.com/MR-JZ/tmuxconf";
# TODO: change this rev to the correct one
    rev = "4c9f6ad2be28e2bf9789991803f2129f7c0faf17";
    submoduls = true;
  };
  home.file.".config/nvim".source =  builtins.fetchGit {
    url = "https://github.com/MR-JZ/nvimconfig";
    rev = "4c9f6ad2be28e2bf9789991803f2129f7c0faf17";
  };
}

