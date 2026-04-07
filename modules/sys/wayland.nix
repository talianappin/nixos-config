{
  sys.wayland._.niri =
  {
    nixos = {
      programs.niri.enable = true;
      niri-flake.cache.enable = true;
      services.displayManager.ly = {
        enable = true;
#        settings = {
#          allow_empty_password = false;
#	  auth_fails = 1; 
#	  
#	  #password masking char
#	  asterisk = "~";
#	  clear_password = true;
#
#	  bigclock = "pl";
#	  box_title = "I L0VE B00BS";
#
#          shell = false;
#        };
      };
    };
    homeManager =
    { pkgs, config, ... }:
    {
      home.packages = with pkgs; [ xwayland-satellite ];
      programs = {
        fuzzel.enable = true;
	niri.settings = {
	  prefer-no-csd = true;
	  input = {
	    keyboard = {
	      xkb = {
	        layout = "pl";
		variant = "qwerty";
	      };
              track-layout = "global";
              repeat-delay = 600;
              repeat-rate = 25;
	    };
	    mouse = {
	      natural-scroll = false;
	      accel-speed = 0;
	    };
	    workspace-auto-back-and-forth = true;
            focus-follows-mouse.enable = true;
	  };
	  outputs = {
	    "HDMI-A-1" = {
	      mode = {
	        width = 1920;
		height = 1080;
		refresh = 144.0;
	      };
	      scale = 1.0;
	      position = { x = 0; y = 0; };
              variable-refresh-rate = "on-demand";
	      focus-at-startup = true;
              background-color = "#000000";
	    };
	  };
	  layout = {
            gaps = 8;
	    empty-workspace-above-first = true;
	    focus-ring = {
	      enable = true;
              width = 4;
	      active-color = "#${config.colorScheme.palette.base02}";
	      urgent-color = "#${config.colorScheme.palette.base01}";
	    };
	    
	  };
	  binds = {
            "Mod+T".action.spawn = "foot";
            "Mod+D".action.spawn = "fuzzel";
            "Mod+Q".action.close-window = [];
      
            "Mod+Left".action.focus-column-left = [];
            "Mod+Right".action.focus-column-right = [];
            "Mod+Up".action.focus-workspace-up = [];
            "Mod+Down".action.focus-workspace-down = [];

	    "Mod+Ctrl+Left".action.move-window-left = [];
            "Mod+Ctrl+Right".action.move-window-right = [];
            "Mod+Ctrl+Up".action.move-window-up = [];
            "Mod+Ctrl+Down".action.move-window-down = [];

	    "Mod+F".action.maximize-column = [];
	    "Mod+Ctrl+F".action.maximize-window-to-edges = [];
	    "Mod+Shift+F".action.fullscreen-window = [];
          };
        };
      };
      services = {
        #swww.enable = true;
        mako.enable = true;
        polkit-gnome.enable = true;
      };
    };
  };
}
