{
  sys.fonts = {
    nixos = 
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          inter
          aleo-fonts
          nerd-fonts.mononoki
          openmoji-color
        ];
        enableDefaultPackages = true;
        fontDir.enable = true;
        fontconfig.defaultFonts = {
          sansSerif = ["Inter"];
          serif = ["Aleo"];
          monospace = ["Mononoki Nerd Font"];
          emoji = ["OpenMoji Color"];
        };
      };
    };

  };
}
