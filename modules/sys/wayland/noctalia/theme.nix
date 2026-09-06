{ inputs, ... }:
{
  noctalia.theme =
  {
    homeManager.programs.noctalia.settings = 
    {
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
    };
  };
}
