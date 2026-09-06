{ inputs, ... }:
{
  sys.wayland._.niri =
  {
    nixos =
    {
      programs.niri.enable = true;
      services = {
        accounts-daemon.enable = true;
        greetd.settings.default_session.user = "catalia";
      };
      environment = {
        # fixes zap proxy
        # making gui apps with java should be banned.
        variables.AWT_TOOLKIT = "MToolkit";
        variables._JAVA_AWT_WM_NONREPARENTING = 1;
      };
    };
    homeManager =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs;
      [
        xwayland-satellite
	numix-cursor-theme
      ];
#      imports = [ inputs.niri.homeModules.config ];
      dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
      xdg.autostart.enable = true;
      programs.niri.settings = {
      	workspaces."media" = {};
      	workspaces."chat" = {};
        workspaces."browser" = {};
        cursor =
	{
	  size = 16;
	  theme = "Numix-Cursor";
	};
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
          focus-follows-mouse.enable = false;
	};
	outputs = {
	  "HDMI-A-2" = {
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
	layout =
	{
	  background-color = "transparent";
          gaps = 192;
	  empty-workspace-above-first = true;
	  struts = 
	  {
	    top = -86;
	    bottom = -86;
	    left = 0;
	    right = 0;
	  };
	  focus-ring =
	  {
	    enable = true;
            width = 2;
	  };
	  default-column-width = { proportion = 1.0; };
	};
	window-rules =
	[
	  {
	    draw-border-with-background = false;
	    geometry-corner-radius = 
	    {
	      top-left = 10.0;
	      top-right = 10.0;
	      bottom-left = 10.0;
	      bottom-right = 10.0;
	    };
	    clip-to-geometry = true;
	  }
	  {
	    matches =
	    [
	      { app-id = "signal"; }
	      { app-id = "vesktop"; }
	    ];
	    open-on-workspace = "chat";
	  }
	  {
	    matches = 
	    [
	      { app-id = "steam"; }
	      { app-id = "org.prismlauncher.PrismLauncher"; }
	      { app-id = "Spotify"; }
	    ];
	    open-on-workspace = "media";
	  }
	  {
	    matches = 
	    [
	      { app-id = "librewolf"; }
	    ];
	    open-on-workspace = "browser";
	  }
	];
	layer-rules = 
	[
	  {
	    matches = 
	    [
              { namespace = "^noctalia-wallpaper"; }
	    ];
            place-within-backdrop = true;
	  }
	];
	binds = {
          "Mod+T".action.spawn = "foot";
          "Mod+Space".action.spawn-sh = "noctalia msg panel-toggle launcher";
          "Mod+Q".action.close-window = [];
	  "Mod+E".action.spawn = ["foot" "yazi"];
      
          "Mod+A".action.focus-column-left = [];
          "Mod+D".action.focus-column-right = [];
          "Mod+W".action.focus-workspace-up = [];
          "Mod+S".action.focus-workspace-down = [];

	  "Mod+Ctrl+A".action.move-column-left = [];
          "Mod+Ctrl+D".action.move-column-right = [];
          "Mod+Ctrl+W".action.move-column-to-workspace-up = [];
          "Mod+Ctrl+S".action.move-column-to-workspace-down = [];

	  "Mod+F".action.maximize-column = [];
	  "Mod+Ctrl+F".action.maximize-window-to-edges = [];
	  "Mod+Shift+F".action.fullscreen-window = [];

          "Mod+X".action.spawn-sh = "noctalia msg panel-toggle session";
	  "Mod+Tab".action.spawn-sh = "noctalia msg wallpaper-next";

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
