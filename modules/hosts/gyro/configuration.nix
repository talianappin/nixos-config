{ den, sys, __findFile, config, inputs, pkgs, ... }:
{
  den.hosts.x86_64-linux.gyro = { };
  den.aspects.gyro = {
    includes = [
      <sys/devices/server>
    ];

    nixos = {
      facter.reportPath = ./facter.json;
      
      imports = with inputs; [
        nixos-hardware.nixosModules.common-cpu-intel
        nixos-hardware.nixosModules.common-gpu-nvidia
        nixos-hardware.nixosModules.common-pc-ssd
      ];
    };
  };
}
