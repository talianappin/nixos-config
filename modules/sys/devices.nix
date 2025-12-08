{ den, __findFile, ... }:
{
  sys = {
    base = den.lib.parametric.atLeast {
      includes = [
        <sys/boot>
        <sys/networking>
        <sys/bluetooth>
        <sys/audio>
        <sys/secrets>
        <sys/fonts>
      ];
    };
    
    desktop = den.lib.parametric.atLeast {
      includes = [
        <sys/base>
        <sys/wayland/niri>
      ];
    };
  };
}
