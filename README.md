# ZaneyOS 🟰 Best ❄️ NixOS Configs

ZaneyOS is a way of reproducing my configuration on any NixOS system. This includes the wallpaper, scripts, applications, config files, and more. *Please remember to change username and hostname in flake.nix.*

![](./config/home/files/media/demo.jpg)

If you want to learn more about my system, this project has a [Wiki](https://gitlab.com/Zaney/zaneyos/-/wikis/home) that explains a ton. It even explains what NixOS is why you may want to choose it and so much more.

# Install / Steps To Reproduce My System

- Enable flakes in your default configuration.nix by adding this:

```
# Enable Flakes and the new command-line tool
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

This file should be located at /etc/nixos/configuration.nix

- Ensure you have Git listed in your pkgs in the /etc/nixos/configuration.nix file.
- Change the hostname in the /etc/nixos/configuration.nix file.
- Rebuild your system.

```
sudo nixos-rebuild switch
```

- Reboot your system.
- Clone this repo.
- Then go into repo folder (stay in this folder)
- Change username, hostname, theme, and any other variables you may want under user information in flake.nix
- Ensure you have selected the proper cpuType and gpuType in the flake as well.
- Generate your hardware.nix like so:

```
nixos-generate-config --show-hardware-config > hardware.nix
```

- Run this command:

```
sudo nixos-rebuild switch --flake .
```

Now when you want to rebuild the configuration you have access to an alias called flake-rebuild that will rebuild the flake based of the flakeDir variable you set in flake.nix!

Hope you enjoy!

# Make the ssh-key available as sudo

Because if you rebuild the system the git fetch function doesn't have the ssh key, because it looks in the `/root/.ssh` folder.
To copy your key execute this command:
```bash
sudo cp ~/.ssh/id_ed25519* /root/.ssh/
```
This copies both ssh keys into the ssh root folder. And on the next rebuild you should be fine.
