{ den, __findFile, sys, ... }:
{
  sys.devices.provides = {
    base = den.lib.parametric.atLeast {
      includes = [
        <sys/boot>
        <sys/networking/base>
        <sys/bluetooth>
        <sys/audio>
        <sys/fonts>
        <sys/usb>
      ];
    };
    
    desktop = den.lib.parametric.atLeast {
      includes = [
        <sys/devices/base>
        <sys/wayland/niri>
	<sys/wayland/cliphist>
	<sys/wayland/noctalia>
#	<sys/dm/ly>
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
