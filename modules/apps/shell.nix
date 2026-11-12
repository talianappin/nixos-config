{ inputs, ... }:
{
  apps.shell.homeManager =
  { pkgs, ... }:
  {
    programs = {
      fish = {
	enable = true;
	plugins = 
	[
	  { name = "tide"; src = pkgs.fishPlugins.tide.src; }
	];
	interactiveShellInit =
	''
	  set fish_greeting
	  fastfetch
	''; 
      };
      foot = {
        enable = true;
	server.enable = false;
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
}
