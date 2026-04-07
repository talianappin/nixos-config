{
  sys.fonts = {
    nixos = 
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          inter
          aleo-fonts
          nerd-fonts._3270
	  openmoji-color
        ];
        enableDefaultPackages = true;
        fontDir.enable = true;
        fontconfig.defaultFonts = {
          sansSerif = ["Inter"];
          serif = ["Aleo"];
          monospace = ["3270 Nerd Font"];
          emoji = ["OpenMoji Color"];
        };
      };
    };

  };
}
