
{
  sys.wayland._.niri =
  {
    nixos = {
      programs = {
        niri.enable = true;
      };
      services.displayManager.ly.enable = true;
     };
     homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [ xwayland-satellite ];
      programs = {
        waybar.enable = true;
        fuzzel.enable = true;
      };
      services = {
        swww.enable = true;
        mako.enable = true;
        polkit-gnome.enable = true;
      };
    };
  };
}
