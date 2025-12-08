{ den, sys, config, inputs, pkgs, ... }:
{
  den.hosts.x86_64-linux.johnny = { };
  den.aspects.johnny = {
    includes = with sys; [
      desktop
    ];

    nixos = {
      facter.reportPath = ./facter.json;
      
      imports = with inputs; [
        nixos-hardware.nixosModules.common-cpu-amd
        nixos-hardware.nixosModules.common-gpu-amd
        nixos-hardware.nixosModules.common-pc-ssd
      ];

      hardware.amdgpu.opencl.enable = true;
    };
  };
}
