{ den, __findFile, sys, ... }:
{
  sys.devices.provides = {
    base = den.lib.parametric.atLeast {
      includes = [
        <sys/networking/base>
        <sys/audio>
        <sys/fonts>
        <sys/usb>
      ];
    };
    
    desktop = den.lib.parametric.atLeast {
      includes = [
        <sys/boot/desktop>
	<sys/emulate>
        <sys/devices/base>
	<sys/bluetooth>
        <sys/wayland/niri>
        <sys/wayland/cliphist>
	<sys/wayland/noctalia>
      ];
    };

    pi = den.lib.parametric.atLeast {
      includes = [
        <sys/boot/pi>
	<sys/devices/base>
        <sys/networking/server>
      ];
    };
  };
}
