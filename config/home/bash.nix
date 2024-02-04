{ config, pkgs, flakeDir, ... }:

{
  # Configure Bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    profileExtra = ''
      #if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      #  exec Hyprland
      #fi
    '';
    initExtra = ''

    stty -ixon

    # the command that initializes zoxide. And make that zoxide works with bash
    eval "$(zoxide init bash)" 
    # include path to PATH
    export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
    export PATH=$PATH:$HOME/go/bin

    if [ -f $HOME/.bashrc-personal ]; then
        source $HOME/.bashrc-personal
    fi
    '';
    sessionVariables = {
    
    };
    shellAliases = {
      sv="sudo vim";
      flake-rebuild="sudo nixos-rebuild switch --flake ${flakeDir}";
      flake-update="sudo nix flake update ${flakeDir}";
      gcCleanup="nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      ghd="gh-dash";
      z="zoxide";
      v="nvim";
      ls="lsd";
      ll="lsd -l";
      la="lsd -a";
      lal="lsd -al";
      ".."="cd ..";
    };
  };
}
