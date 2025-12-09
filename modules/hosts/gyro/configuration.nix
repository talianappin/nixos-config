{ den, sys, __findFile, config, inputs, pkgs, ... }:
{
  den.hosts.x86_64-linux.gyro = { };
  den.aspects.gyro = {
    includes = [
      <sys/devices/server>
    ];

    nixos = {
      facter.reportPath = ./facter.json;

      hardware.nvidia = {
        open = true;
        prime = {
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
      
      imports = with inputs; [
        nixos-hardware.nixosModules.common-cpu-intel
        nixos-hardware.nixosModules.common-gpu-nvidia
        nixos-hardware.nixosModules.common-pc-ssd
      ];
    };
  };
}
