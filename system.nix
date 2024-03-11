{ inputs, config, pkgs, username,
  hostname, gitUsername, theLocale,
  theTimezone, wallpaperDir, wallpaperGit, 
  theLCVariables, theKBDLayout, ... }:

{
  imports =
    [
      inputs.sops-nix.nixosModules.sops
      ./hardware.nix
      ./config/system
    ];

  # Enable networking
  networking.hostName = "${hostname}";  # Define your hostname
  networking.networkmanager.enable = true;

  # Set your time zone
  time.timeZone = "${theTimezone}";

  # Select internationalisation properties
  i18n.defaultLocale = "${theLocale}";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${theLCVariables}";
    LC_IDENTIFICATION = "${theLCVariables}";
    LC_MEASUREMENT = "${theLCVariables}";
    LC_MONETARY = "${theLCVariables}";
    LC_NAME = "${theLCVariables}";
    LC_NUMERIC = "${theLCVariables}";
    LC_PAPER = "${theLCVariables}";
    LC_TELEPHONE = "${theLCVariables}";
    LC_TIME = "${theLCVariables}";
  };

  # Define a user account.
  users.users."${username}" = {
    homeMode = "755";
    isNormalUser = true;
    description = "${gitUsername}";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "adbusers" "docker" ];
    packages = with pkgs; [];
  };
  users.extraGroups.docker.members = [ "username-with-access-to-socket" ];

  environment.variables = {
    EDITOR = "nvim";
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  # Optimization settings and garbage collection automation
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
 };
  sops.defaultSopsFile = ./secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  
  sops.age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

  sops.secrets.openai_api_key = {
    owner = "${username}";
  };

  system.stateVersion = "23.11";
}
