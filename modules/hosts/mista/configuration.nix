{ den, sys, __findFile, inputs, ... }:
{
  den.hosts.aarch64-linux.mista = {
    users.number-four.classes = [ "wheel" "homeManager" ];
  };
  den.aspects.number-four = {
    includes = [
      <sys/devices/pi>
    ];

    nixos = 
    { config, pkgs, ... }:
    {
      imports = with inputs; [
        "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
        nixos-hardware.nixosModules.raspberry-pi-4
      ];
    };
  };
}
