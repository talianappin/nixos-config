{
  sys.dm._.ly = {
    nixos.services.displayManager.ly = {
      enable = true;
      settings = {
	animation = "matrix";
	asterisk = "~";
	hide_borders = true;
	clock = "%c";
	bigclock = "en";
	hide_key_hints = true;
	hide_version_string = true;
      };
    };
  };
}
