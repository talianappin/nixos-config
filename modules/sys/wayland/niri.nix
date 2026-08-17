{
  sys.wayland._.niri =
  {
    nixos = {
      programs.niri.enable = true;
      niri-flake.cache.enable = true;
    };
    homeManager =
    { pkgs, config, ... }:
    {
      home.packages = with pkgs; [ xwayland-satellite ];
      programs.niri.settings = {
	prefer-no-csd = true;
	input = {
	  keyboard = {
	    xkb = {
	      layout = "pl";
	      variant = "prog";
	    };
            track-layout = "global";
            repeat-delay = 600;
            repeat-rate = 25;
	  };
	  mouse = {
	    natural-scroll = false;
	    accel-speed = 0;
	  };
#	  workspace-auto-back-and-forth = true;
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
            width = 2;
	    active.color = "#${config.colorScheme.palette.base02}";
	    urgent.color = "#${config.colorScheme.palette.base01}";
	  };
	  default-column-width = { proportion = 0.5; };
	};
	binds = {
          "Mod+T".action.spawn = "foot";
          "Mod+D".action.spawn = "fuzzel";
          "Mod+Q".action.close-window = [];
	  "Mod+E".action.spawn = ["foot" "yazi"];
      
          "Mod+Left".action.focus-column-left = [];
          "Mod+Right".action.focus-column-right = [];
          "Mod+Up".action.focus-workspace-up = [];
          "Mod+Down".action.focus-workspace-down = [];

	  "Mod+Ctrl+Left".action.move-column-left = [];
          "Mod+Ctrl+Right".action.move-column-right = [];
          "Mod+Ctrl+Up".action.move-column-to-workspace-up = [];
          "Mod+Ctrl+Down".action.move-column-to-workspace-down = [];

	  "Mod+F".action.maximize-column = [];
#	   "Mod+Ctrl+F".action.maximize-window-to-edges = [];  v25.11 feature (on v25.08)
	  "Mod+Shift+F".action.fullscreen-window = [];

	  "XF86AudioRaiseVolume" = {
            action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"];
            allow-when-locked = true;
            cooldown-ms = 150;
          };
          "XF86AudioLowerVolume" = {
            action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"];
            allow-when-locked = true;
            cooldown-ms = 150;
          };
        };
      };
      services = {
        polkit-gnome.enable = true;
      };
    };
  };
}
