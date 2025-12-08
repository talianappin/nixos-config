{
  den.aspects.johnny.nixos = {
    fileSystems."/" = {
      device = "/dev/disk/by-label/NIXROOT";
      fsType = "btrfs";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    swapDevices = [
      { device = "/dev/disk/by-label/NIXSWAP"; }
    ];

    services.btrfs.autoScrub.enable = true;
  };
}
