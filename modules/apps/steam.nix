{  inputs, ... }:
{
  apps.steam.nixos =
  { pkgs, ... }:
  {
    boot.kernelModules = [ "ntsync" ]; #proton optimization
    hardware.graphics.enable32Bit = true;
    services.system76-scheduler.enable = true;
    programs = {
      steam = {
        enable = true;
        extraCompatPackages = [ pkgs.proton-ge-bin ];
        remotePlay.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
      gamescope.enable = true;
    };
  };
}
