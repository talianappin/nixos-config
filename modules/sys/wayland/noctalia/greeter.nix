{ inputs, ... }:
{
  noctalia.greeter = 
  {
    nixos = 
    {
      imports = [ inputs.noctalia-greeter.nixosModules.default ];
      programs.noctalia-greeter =
      {
        enable = true;
	passwordless-sync-users = [ "catalia" ];
	settings =
	{
	  appearance.hide_logo = true;
	  cursor = {
            theme = "Numix-Cursor";
            size = 16;
    	  };
        };
      };
    };
  };
}

