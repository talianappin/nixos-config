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
      imports = [ inputs.noctalia.homeModules.default ];
      programs = {
        noctalia = {
          enable = true;
          systemd.enable = true;
          settings = {
	    bar =
	    {
	      order = [ "default" "top" "left" "bottom"];
	      default =
	      {
	        position = "right";
	        margin_ends = 0;
		radius = 20;
	      };
	      top =
	      {
	        position = "top";
		start = [];
		center = [];
		end = [];
		margin_ends = 0;
		thickness = 8;
		radius = 20;
	      };
	      left =
	      {
	        position = "left";
		start = [];
		center = [];
		end = [];
		margin_ends = 0;
		thickness = 8;
		radius = 20;
	      };
	      bottom =
	      {
	        position = "bottom";
		start = [];
		center = [];
		end = [];
		margin_ends = 0;
		thickness = 8;
		radius = 20;
	      };
	    };
          };
        };
      };
    };
  };
}
