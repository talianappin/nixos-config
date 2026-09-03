{  inputs, ... }:
{
  apps.steam = {
  nixos =
  { pkgs, ... }:
  {
    boot.kernelModules = [ "ntsync" ]; #proton optimization
    hardware.graphics.enable32Bit = true;
    services.system76-scheduler.enable = true;
    programs = {
      steam = {
        enable = true;
	package = pkgs.millennium-steam;
        extraCompatPackages = [ pkgs.proton-ge-bin ];
        remotePlay.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
      gamescope.enable = true;
    };
    # tmp
    services.hardware.openrgb.enable = true;
  };
  homeManager =
  { pkgs, ... }:
  {
    home.packages = with pkgs; [
      protontricks
      protonup-qt
      steamtinkerlaunch
    ];
  };
  };
}
