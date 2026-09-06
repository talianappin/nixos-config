{ inputs, ... }:
{
  noctalia.desktop =
  {
    homeManager.programs.noctalia.settings.desktop_widgets =
    {
      enabled = true;
      widget_order = ["clock_main"];
      widget = 
      {
        "clock_main" = 
        {
	  type = "clock";
	  output = "HDMI-A-2";
	  cx = 760.0;
          cy = 440.0;
	  box_width  = 400.0;
          box_height = 200.0;
	  enabled = true;
	  settings.format = "{:%H:%M}";
	};
      };
    };
  };
}

