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
	  noto-fonts-color-emoji
        ];
        enableDefaultPackages = true;
        fontDir.enable = true;
        fontconfig.defaultFonts = {
          sansSerif = ["Inter"];
          serif = ["Aleo"];
          monospace = ["3270 Nerd Font"];
          emoji = ["Noto Color Emoji"];
        };
      };
    };

  };
}
