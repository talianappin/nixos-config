{ inputs, noctalia, den, ... }:
{
  sys.wayland._.noctalia =
  {
    includes = with noctalia; 
    [
      greeter
      plugins
      shell
      theme
      bar
      desktop
    ];
    homeManager =
    {
      imports = [ inputs.noctalia.homeModules.default ];
      programs.noctalia =
      {
        enable = true;
        systemd.enable = true;
      };
    };
  };
}
