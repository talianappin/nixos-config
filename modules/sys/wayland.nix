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
        waybar = {
          enable = true;
          settings = { 
            right-bar = {
              layer = "top";
              position = "right";
              width = 50;
              exclusive = "true";
              modules-left = [ "cpu" ];
              modules-center = [ "clock" ];
              modules-right = [ "tray" ];
              "clock" = {
	        format = "{0:%H}\n{0:%M}";
	        tooltip = "false";
	      };
            };
            top-bar = {
              layer = "top";
	      position = "top";
	      height = 30;
	      exclusive = "true";
	      modules-left = [ "cava" ];
	      modules-center = [ "niri/workspaces" ];
	      modules-right = [  ];
	    };
	  };
	  style = ./waybar.css;
        };
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
