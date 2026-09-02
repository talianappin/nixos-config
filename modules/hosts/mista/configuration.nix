{ den, sys, __findFile, inputs, ... }:
{
  den.hosts.aarch64-linux.mista = {
    users.number-four.classes = [ ];
  };
  den.aspects.number-four = {
    includes = [
      <sys/devices/pi3b>
    ];

    nixos = 
    { config, pkgs, ... }:
    {
      imports = with inputs; [
        nixos-hardware.nixosModules.raspberry-pi-3
      ];
    };
  };
}