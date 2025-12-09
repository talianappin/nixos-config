{ den, __findFile, sys, ... }:
{
  sys.devices.provides = {
    base = den.lib.parametric.atLeast {
      includes = [
        <sys/boot>
        <sys/networking/base>
        <sys/bluetooth>
        <sys/audio>
        <sys/secrets>
        <sys/fonts>
      ];
    };
    
    desktop = den.lib.parametric.atLeast {
      includes = [
        <sys/devices/base>
        <sys/wayland/niri>
      ];
    };

    server = den.lib.parametric.atLeast {
      includes = [
        <sys/devices/base>
        <sys/networking/server>
      ];
    };
  };
}
