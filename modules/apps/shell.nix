{ inputs, ... }:
{
  apps.shell = {
    nixos.programs.fish.enable = true;
    homeManager =
      { pkgs, config, ... }:
      {
        programs = {
          fish = {
	    enable = true;
	    plugins = 
	    [
	      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
	    ];
          };
          foot = {
            enable = true;
	    server.enable = true;

            settings = {
              main = {
                term = "xterm-256color";

                font = "3270 Nerd Font:size=18";
                dpi-aware = "yes";
		include = inputs.self + "/themes/foot_theme";
              };
            };
          };
        };
      };
  };
}
