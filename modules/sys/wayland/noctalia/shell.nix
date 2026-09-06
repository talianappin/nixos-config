{
  noctalia.shell =
  {
    homeManager.programs.noctalia.settings = 
    {
      shell = 
      {
        niri_overview_type_to_launch_enabled = true;
	popup_borders = false;
	offline_mode = false;
	animation.speed = 2.0;
	launcher.compact = true;
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
    };
  };
}
