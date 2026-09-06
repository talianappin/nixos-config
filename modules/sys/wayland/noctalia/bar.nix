{ inputs, ... }:
{
  noctalia.bar =
  {
    homeManager.programs.noctalia.settings = 
    {
      bar =
      {
        order = [ "default" "control" ];
        default =
        {
          position = "right";
	  start = [ "nix" "workspaces" ];
	  center = [ "clock" ];
	  end = [ "cat" ];
	  margin_ends = 0;
	  thickness = 50;
	  radius = 0;
	  radius_bottom_left = 20;
	  radius_top_left = 20;
	  font_weight = 800;
	  scale = 1.5;
	  widget_spacing = 12;
	};
	control =
	{
	  position = "left";
	  start = [];
	  center = [ "cpu" "gpu" "ram" "net_in" "net_out" ];
	  end = [];
	  margin_ends = 400;
	  thickness = 50;
	  radius = 20;
	  scale = 1.0;
	  reserve_space = false;
	  font_weight = 800;
	  widget_spacing = 12;
        };
      };
      widget =
      {
        "nix" =
        {
  	  type = "custom_button";
	  custom_image = inputs.self + "/assets/nix-logo-white.svg";
	  custom_image_colorize = false;
	  actions.left = "panel-toggle avivbintangaringga/nix-monitor:panel";
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
	  pill_scale = 0.60;
	};
	"cpu" =
	{
          type = "sysmon";
	  stat = "cpu_usage";
	  visualization = "none";
	};
	"gpu" =
	{
	  type = "sysmon";
	  stat = "gpu_usage";
	  visualization = "none";
        };
        "ram" =
        {
          type = "sysmon";
	  stat = "ram_used";
	  visualization = "none";
	  label_show_units = false;
        };
        "net_in" =
        {
          type = "sysmon";
	  stat = "net_rx";
	  visualization = "none";
	  network_speed_compact = true;
        };
        "net_out" =
        {
          type = "sysmon";
          stat = "net_tx";
          visualization = "none";
	  network_speed_compact = true;
        };
      };
    };
  };
}
