{
  noctalia.plugins =
  {
    homeManager =
    { pkgs, ... }:
    {
      #(for wallpaper depth) [unfortunately];
      home.packages = with pkgs; [ (python314.withPackages (python-pkgs: with python-pkgs; [ pip ] )) ];
      programs.noctalia.settings.plugins = 
      {
        auto_update = "all";
	enabled =
	[
	  # official
	  "noctalia/timer"
	  "noctalia/wallpaper_depth"
	  "noctalia/bitwarden"

	  # community
	  "radimous/prismlauncher-instances"
	  "avivbintangaringga/nix-monitor"
	  "dotnetrob/cat"
	];
	source = 
	[
	  {
	    name     = "official";
	    kind     = "git";
	    location = "https://github.com/noctalia-dev/official-plugins";
	    enabled  = true;
	  }
	  {
	    name     = "community";
	    kind     = "git";
	    location = "https://github.com/noctalia-dev/community-plugins";
	    enabled  = true;
	  }
	];
      };
    };
  };
}
