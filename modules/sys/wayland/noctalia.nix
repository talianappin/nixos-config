{ inputs, ... }:
{
  sys.wayland._.noctalia = {
    nixos = {
      imports = [ inputs.noctalia-greeter.nixosModules.default ];
      programs.noctalia-greeter.enable = true;
    };
    homeManager =
    { pkgs, lib, ... }:
    {

      # I HATE THIS BUT I NEED THIS (for wallpaper depth);
#      home.packages = with pkgs;
#       [
#        (python311.withPackages (python-pkgs: with python-pkgs; 
#	  [
#	    pip
#	  ]
#	))
#      ];

      imports = [ inputs.noctalia.homeModules.default ];
      programs = {
        noctalia = {
          enable = true;
          systemd.enable = true;
          settings = 
	  {
	    plugins = 
	    {
	      enabled =
	      [
#	        "salemsayed/niri-active-workspace"
	        "radimous/prismlauncher-instances"
#	        "noctalia/wallpaper_depth" broken!!
		"noctalia/bitwarden"
		"avivbintangaringga/nix-monitor"
		"dotnetrob/cat"
	      ];
	    };
	    shell = 
	    {
	      niri_overview_type_to_launch_enabled = true;
#	      app_icon_colorize = true;
#	      app_icon_color = "on_surface";
	      popup_borders = false;
	      offline_mode = false;
	      animation =
	      {
	        enabled = true;
		speed = 2.0;
	      };
	      launcher =
	      {
	        #icons = false;
		compact = true;
	      };
	      screen_corners =
	      {
	        enabled = true;
		size = 20;
	      };
	      panel =
	      {
	        borders = false; 
	        session_placement = "floating";
		session_position = "bottom_center";
	      };
	      session =
	      {
	        grid = false;
		show_shortcuts = false;
		actions = 
		[
		  {
		    action = "lock";
		    enabled = true;
		    shortcut = "F1";
		    variant = "outline";
		  }
		  {
		    action = "lock_and_suspend";
		    enabled = true;
		    shortcut = "F2";
		    variant = "outline";
		  }
		  {
		    action = "reboot";
		    enabled = true;
		    shortcut = "F3";
		    variant = "outline";
		  }
		  {
		    action = "shutdown";
		    enabled = true;
		    countdown_seconds = 3;
		    shortcut = "F4";
		    variant = "outline";
		  }
		];
	      };
	    };
            wallpaper =
	    {
	      enabled = true;
	      directory = inputs.self + "/assets";
	      transition = "disc";
	      default =
	      {
	        path = inputs.self + "assets/default.jpg";
	      };
	    };
	    theme =
	    {
	      mode = "dark";
	      source = "wallpaper";
              wallpaper_scheme = "m3-tonal-spot";
	      templates = 
	      {
	        enable_builtin_templates = true;
		enable_community_templates = true;
		builtin_ids =
		[
		  "foot"
		  "cava"
		  "niri"
		  "btop"
		  "qt"
		  "gtk3"
		  "gtk4"
		  "scroll"
		];
                community_ids = 
		[
		  "yazi"
		  "fzf"
		  "fastfetch"
		  "steam"
		  "prismlauncher"
		  "heroiclauncher"
		  "discord"
		  "spicetify"
		  "pywalfox-beta4"
		];
	      };
	    };
	    bar =
	    {
	      order = [ "default" "control" ];
	      default =
	      {
	        position = "right";
		start = [ "nix" ];
		center = [ "clock" ];
		end = [ "cat" ];
	        margin_ends = 0;
		thickness = 50;
		radius = 0;
		radius_bottom_left = 20;
                radius_top_left = 20;
		font_weight = 800;
		scale = 1.5;
	      };
	      control =
	      {
	        position = "left";
		start = [];
		center = [ "workspaces" ];
		end = [];
		margin_ends = 490;
		thickness = 25;
		radius = 10;
		scale = 0.70;
		reserve_space = false;
	      };
  	    };
	    widget =
	    {
	      "nix" =
	      {
		type = "custom_button";
		custom_image = inputs.self + "/assets/nix-logo-white.svg";
		custom_image_colorize = false;
		actions =
		{
		  left = "panel-toggle avivbintangaringga/nix-monitor:panel";
		};
	      };
	      "cat" =
	      {
	        type = "dotnetrob/cat:cat";
	        cat_color_mode = "custom";
		cat_color = "on_surface";
	      };
	      "workspaces" =
	      {
	        type = "workspaces";
	        style = "regular";
		show_labels = false;
		show_icons = false;
		active_pill_size = 1.0;
	      };
	    };
          };
        };
      };
    };
  };
}
