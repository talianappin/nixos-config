{ den, sys, __findFile, inputs, ... }:
{
  den.hosts.x86_64-linux.johnny = { };
  den.aspects.johnny = {
    includes = [
      <sys/devices/desktop>
    ];

    nixos = 
    { config, pkgs, ... }:
    {
      facter.reportPath = ./facter.json;
      
      imports = with inputs; [
        nixos-hardware.nixosModules.common-cpu-amd
        nixos-hardware.nixosModules.common-gpu-amd
        nixos-hardware.nixosModules.common-pc-ssd
      ];

      services.printing = {
        enable = true;
        drivers = with pkgs; [ hplipWithPlugin ];
      };

      boot = {
        # Make v4l2loopback kernel module available to NixOS.
        extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
        # Activate kernel module(s).
        kernelModules = [ "v4l2loopback" "snd-aloop" ];
      
        extraModprobeConfig = ''
          options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
        '';
      };

      hardware.amdgpu.opencl.enable = true;
    };
  };
}
