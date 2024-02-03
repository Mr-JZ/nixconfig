{ config, pkgs, flakeDir, ... }:
{
    gitAndTools.gh = {
      enable = true;
      enableCompletion = true;
      enableGhcup = true;
    };
  }
