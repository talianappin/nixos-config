{ lib, ... }:
{
  den.aspects.mista.nixos = {
    fileSystems."/" = lib.mkForce {
      device = "/dev/disk/by-label/NIXSD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };
}
