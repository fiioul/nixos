
in configuration.nix for disk-config.nix

    boot.loader.grub.enable = true;
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.mirroredBoots = [
      { devices = [ "nodev" ]; path = "/boot"; efiSysMountPoint = "/boot"; }
      { devices = [ "nodev" ]; path = "/boot2"; efiSysMountPoint = "/boot2"; }
    ];

