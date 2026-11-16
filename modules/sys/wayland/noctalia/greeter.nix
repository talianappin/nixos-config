{
  noctalia.greeter = 
  {
    nixos.services.displayManager.noctalia-greeter =
    {
      enable = true;
      passwordlessSyncUsers = [ "catalia" ];
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
}

