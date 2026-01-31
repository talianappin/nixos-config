{ den, __findFile, ... }:
{
  sys.ios.nixos = 
  { pkgs, ... }:
  {
    services.usbmuxd.enable = true;
    environment.systemPackages = with pkgs; [
      libimobiledevice
#      ifuse # optional, to mount using 'ifuse'
    ];
  };
}
