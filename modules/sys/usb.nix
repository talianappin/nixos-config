{ pkgs, ... }:
{
  sys.usb = {
    nixos.services.udisks2 = {
      enable = true;
    };

    homemanager.services.udiskie = {
      enable = true;
      settings = {
        program-options = {
	  file_manager = "${pkgs.nautilus}/bin/nautilus";
	};
      };
    };
  };
}
