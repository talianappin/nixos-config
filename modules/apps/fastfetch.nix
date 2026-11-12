{ inputs, ... }:
{
  apps.fastfetch.homeManager = 
  {
    programs.fastfetch =
    {
      enable = true;
      settings =
      {
        logo =
        {
          type = "file";
	  source = inputs.self + "/assets/logo.txt";
        };
        modules =
        [
          {
	    type = "custom";
	    format = "┌────────────── Uptime / Date ──────────────┐";
	  }
          {
	    type = "uptime";
	    key = "├─ UPTIME";
	    format = "{formatted}";
          }
	  {
	    type = "datetime";
	    key = "├─ DATE";
	    format = "{year}-{month-pretty}-{day-pretty} {hour-pretty}:{minute-pretty}:{second-pretty}";
	  }
	  {
	    type = "custom";
	    format = "└───────────────────────────────────────────┘";
	  }
	  {
	    type = "break";
	  }
	  {
	    type = "colors";
	    symbol = "circle";
	    paddingLeft = 1;
	  }
        ];
      };
    };
  };
}
