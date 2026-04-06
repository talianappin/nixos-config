{
  apps.shell = {
    nixos.programs.fish.enable = true;
    homeManager =
      { pkgs, config, ... }:
      {
        programs = {
          fish.enable = true;

          zellij = {
            enable = true;
            enableFishIntegration = true;
            enableBashIntegration = true;
          };

          foot = {
            enable = true;
            settings = {
              main = {
                term = "xterm-256color";

                font = "Mononoki Nerd Font:size=16";
                dpi-aware = "yes";
              };
              colors = {
		background = 	"fcf9f7"; # BASE00	white
		foreground = 	"000000"; # BASE05	black

		# normal
		regular0 = 	"000000"; # BASE00	black
		regular1 =	"fface9"; # BASE08	pink
		regular2 =	"45be30"; # BASE0B	green
		regular3 =	"fed134"; # BASE0A	yellow
		regular4 =	"5a7ebf"; # BASE0D	blue
		regular5 =	"997cba"; # BASE0E	purple
		regular6 =	"b5e7ff"; # BASE0C	sky
		regular7 =	"fcf9f7"; # BASE05	white

		# bright
		bright0 =	"000000"; # BASE03	bright black
		bright1 =	"fface9"; # BASE09	bright pink
		bright2 =	"45be30"; # BASE01	bright green
		bright3 =	"fed134"; # BASE02	bright yellow
		bright4 =	"5a7ebf"; # BASE04	bright blue
		bright5 = 	"997cba"; # BASE06	bright purple
		bright6 =	"b5e7ff"; # BASE0F	bright sky
		bright7 =	"fcf9f7"; # BASE07	bright white
              };
            };
          };
        };
      };
  };
}
